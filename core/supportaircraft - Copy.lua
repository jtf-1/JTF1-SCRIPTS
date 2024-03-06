env.info( "[JTF-1] supportaircraft.lua" )

--
--- Support Aircraft
--
-- **NOTE** THIS FILE MUST BE LOADED BEFORE SUPPORTAIRCRAFT_DATA.LUA IS LOADED
--
-- Spawn support aircraft (tankers, awacs) at zone markers placed in the mission editor.
--
-- Two files are required for this module;
--     supportaircraft.lua
--     supportaircraft_data.lua
--
-- 1. supportaircraft.lua
-- Core file. Contains functions, key values and GLOBAL settings.
--
-- 2. supportaircraft_data.lua
-- Contains settings that are specific to the miz.
--
-- Load order in miz MUST be;
--     1. supportaircraft.lua
--     2. supportaircraft_data.lua
--
-- In the mission editor, place a zone where you want the support aircraft to spawn.
-- Under SUPPORTAC.mission, add a config block for the aircraft you intend to spawn.
-- See the comments in the example block for explanations of each config option.
--
-- if the predefined templates are not being used a late activated template must be added 
-- to the miz for for each support *type* that is to be spawned.
-- The template should use the same name as the type in the SUPPORTAC.type data block, 
-- eg "KC-135" or "AWACS-E3A" etc.
--
-- Available support aircraft categories and types for which predefined templates are available [category] = [template name];
--
-- Category: tanker
--    tankerBoom = "KC-135" - SPAWNTEMPLATES.templates["KC-135"]
--    tankerProbe = KC-135MPRS" - SPAWNTEMPLATES.templates["KC-135MPRS"]
--    WIP** tankerProbeC130 = "KC-130" - SPAWNTEMPLATES.templates["KC-130"]
--
-- Category: awacs
-- awacsE3a = "AWACS-E3A" - SPAWNTEMPLATES.templates["AWACS-E3A"]
-- awacsE2d = "AWACS-E3A" - SPAWNTEMPLATES.templates["AWACS-E3A"]
--

SUPPORTAC = {}
SUPPORTAC.traceTitle = "[JTF-1 SUPPORTAC] "
SUPPORTAC.ClassName = "SUPPORTAC"
SUPPORTAC.useSRS = true -- if true, messages will be sent over SRS using the MISSIONSRS module. If false, messages will be sent as in-game text.

SUPPORTAC = BASE:Inherit(SUPPORTAC, BASE:New())

local _msg -- used for debug messages only
local useSRS

-- function to start the SUPPORTAC module.
function SUPPORTAC:Start()
	_msg = string.format("%sStart()", self.traceTitle)
	self:T(_msg)

	-- default to not using SRS unless both the server AND the module request it AND MISSIONSRS.Radio.active is true
	useSRS = (JTF1.useSRS and self.useSRS) and MISSIONSRS.Radio.active 
	self:I({self.traceTitle .. "useSRS", self.useSRS})

	for index, mission in ipairs(SUPPORTAC.mission) do -- FOR-DO LOOP
		_msg = string.format("%sStart - mission %s", 
			self.traceTitle, 
			mission.name
		)
		SUPPORTAC:T({_msg, mission})

		local skip = false -- check value to exit early from the current for/do iteration

		local missionZone = ZONE:FindByName(mission.zone)
		-- check zone is present in miz
		if missionZone then -- CHECK MISSION ZONE
		
			-- if trace is on, draw the zone on the map
			-- if BASE:IsTrace() then 
			-- 	-- draw mission zone on map
			-- 	missionZone:DrawZone()
			-- end

			-- airbase to which aircraft will fly on RTB
			local missionTheatre = env.mission.theatre
			_msg = SUPPORTAC.traceTitle .. missionTheatre
			self:T(_msg)
			_msg = SUPPORTAC.traceTitle .. SUPPORTAC.homeAirbase.Nevada
			self:T(_msg)
			local missionHomeAirbase = mission.homeAirbase or SUPPORTAC.homeAirbase[missionTheatre]
			_msg = string.format("%sstart - Mission %s set to use %s as home base.", 
				self.traceTitle, 
				mission.name, 
				missionHomeAirbase
			)
			SUPPORTAC:T(_msg)
			if missionHomeAirbase then -- CHECK HOME AIRBASE
				_msg = string.format("%sstart - Mission %s using %s as home base.", 
					self.traceTitle, 
					mission.name, 
					missionHomeAirbase
				)
				SUPPORTAC:T(_msg)

				-- set home airbase in mission
				mission.homeAirbase = missionHomeAirbase

				-- values used to create mission spawn prefix
				local missionName = mission.name or SUPPORTAC.missionDefault.name
				local missionSpawnType = mission.type or SUPPORTAC.missionDefault.type
				-- set spawn prefix unique to support mission
				local missionSpawnAlias = string.format("M%02d_%s_%s", index, missionName, missionSpawnType)

				-- values used to define mission, spawn and waypoint locations
				local missionFlightLevel = mission.flightLevel or SUPPORTAC.missionDefault.flightLevel
				local missionSpawnDistance = mission.spawnDistance or SUPPORTAC.missionDefault.spawnDistance
				local missionAltitude = UTILS.FeetToMeters(missionFlightLevel * 100)
				local spawnDistance = UTILS.NMToMeters(missionSpawnDistance)
				local spawnHeading = mission.heading or SUPPORTAC.missionDefault.heading
				local spawnAngle = spawnHeading + 180
				if spawnAngle > 360 then 
					spawnAngle = spawnHeading - 180
				end
				local spawnUnlimitedFuel = mission.unlimitedFuel or SUPPORTAC.missionDefault.unlimitedFuel

				-- coordinate used for the AUFTRAG
				local missionCoordinate = missionZone:GetCoordinate()
				missionCoordinate:SetAltitude(missionAltitude)
				mission.missionCoordinate = missionCoordinate

				-- coordinate used for the mission spawn template
				local spawnCoordinate = missionCoordinate
				spawnCoordinate:Translate(spawnDistance, spawnAngle, true, true)
				mission.spawnCoordinate = spawnCoordinate

				-- coordinate used for an initial waypoint for the flightgroup
				local waypointCoordinate = missionCoordinate
				waypointCoordinate = waypointCoordinate:Translate(spawnDistance/2, spawnAngle, true, true)
				mission.waypointCoordinate = waypointCoordinate

				if GROUP:FindByName(missionSpawnType) then -- FIND MISSION SPAWN TEMPLATE - use from mission block
					_msg = string.format("%sstart - Using spawn template from miz for %s.", 
						self.traceTitle, 
						missionSpawnType
					)
					SUPPORTAC:T(_msg)

					-- add mission spawn object using template in miz
					mission.missionSpawnTemplate = SPAWN:NewWithAlias(missionSpawnType, missionSpawnAlias)
				elseif SPAWNTEMPLATES.templates[missionSpawnType] then -- ELSEIF FIND MISSION SPAWN TEMPLATE-- Use predfined template from SPAWNTEMPLATES.templates[missionSpawnType]
					_msg = string.format("%sstart - Using spawn template from SPAWNTEMPLATES.templates for %s.", 
						self.traceTitle, 
						missionSpawnType
					)
					SUPPORTAC:T(_msg)

					-- get template to use for spawn
					local spawnTemplate = SPAWNTEMPLATES.templates[missionSpawnType]

					-- check "category" has been set in template
					-- if not spawnTemplate["category"] then
					-- 	spawnTemplate["category"] = Group.Category.AIRPLANE
					-- end
					
					-- apply mission callsign to template (for correct display in F10 map)
					local missionCallsignId = mission.callsign
					local missionCallsignNumber = mission.callsignNumber or 1

					-- default callsign name to use if not found
					local missionCallsignName = "Ghost"

					if missionCallsignId then
						-- table of callsigns to search for callsign name
						local callsignTable = CALLSIGN.Tanker
						if mission.category == SUPPORTAC.category.awacs then
							callsignTable = CALLSIGN.AWACS
						end

						for name, value in pairs(callsignTable) do
							if value == missionCallsignId then
								missionCallsignName = name
							end
						end
						
					else
						missionCallsignId = 1
					end

					local missionUnit = spawnTemplate.units[1]

					if type(missionUnit["callsign"]) == "table" then
						-- local missionCallsign = string.format("%s%d1", missionCallsignName, missionCallsignNumber)
						missionUnit["callsign"]["name"] = string.format("%s%d1", missionCallsignName, missionCallsignNumber)
						missionUnit["callsign"][1] = missionCallsignId
						missionUnit["callsign"][2] = missionCallsignNumber
						missionUnit["callsign"][3] = 1
						_msg = string.format("%sCallsign for mission %s is %s", 
							self.traceTitle, 
							mission.name, 
							spawnTemplate.units[1]["callsign"]["name"]
						)
						SUPPORTAC:T(_msg)
					elseif type(missionUnit["callsign"]) == "number" then
						missionUnit["callsign"] = tonumber(missionCallsignId)
					else
						missionUnit["callsign"] = missionCallsignId
					end
					
					local missionCountryid = mission.countryid or SUPPORTAC.missionDefault.countryid
					local missionCoalition = mission.coalition or SUPPORTAC.missionDefault.coalition
					local missionGroupCategory = mission.groupCategory or SUPPORTAC.missionDefault.groupCategory

					-- add mission spawn object using template in SPAWNTEMPLATES.templates[missionSpawnType]
					mission.missionSpawnTemplate = SPAWN:NewFromTemplate(spawnTemplate, missionSpawnType, missionSpawnAlias)
						:InitCountry(missionCountryid) -- set spawn countryid
						:InitCoalition(missionCoalition) -- set spawn coalition
						:InitCategory(missionGroupCategory) -- set category
				else -- FIND MISSION SPAWN TEMPLATE
						skip = true -- can't exit to the next iteration so skip the rest of the mission creation
				end -- FIND MISSION SPAWN TEMPLATE

				-- if missionSpawnTamplate was not created continue to next iteration, otherwise set spawn inits and create a new mission
				if skip then -- CHECK SKIP
					_msg = string.format("%sStart - template for type %s for mission %s is not present in MIZ or as a predefined template!", 
						self.traceTitle, 
						missionSpawnType, 
						missionSpawnAlias
					)
					SUPPORTAC:E(_msg)
				else -- CHECK SKIP
					-- mission spawn object defaults
					mission.missionSpawnTemplate:InitLateActivated() -- set template to late activated
					mission.missionSpawnTemplate:InitPositionCoordinate(mission.spawnCoordinate) -- set the default location at which the template is created
					mission.missionSpawnTemplate:InitHeading(mission.heading) -- set the default heading for the spawn template
					mission.missionSpawnTemplate:OnSpawnGroup(
						function(spawngroup)
							local spawnGroupName = spawngroup:GetName()
							_msg = string.format(SUPPORTAC.traceTitle .. "Spawned Group %s", spawnGroupName)
							BASE:T(_msg)
		
							spawngroup:CommandSetUnlimitedFuel(spawnUnlimitedFuel)
							spawngroup:CommandSetCallsign(mission.callsign, mission.callsignNumber) -- set the template callsign
						end
						,mission
					)

					_msg = string.format("%sNew late activated mission spawn template added for %s", 
						self.traceTitle, 
						missionSpawnAlias
					)
					SUPPORTAC:T({_msg, mission.missionSpawnTemplate})
					
					-- call NewMission() to create the initial mission for the support aircraft
					-- subsequent mission restarts will be called after the mission's AUFTRAG is cancelled
					SUPPORTAC:NewMission(mission, 0) -- create new mission with specified delay to flightgroup activation
				end -- CHECK SKIP
			
			else -- CHECK HOME AIRBASE
				
				_msg = string.format("%sStart - Default Home Airbase for %s not defined! Mission skipped.", 
					self.traceTitle, 
					missionTheatre
				)
				SUPPORTAC:E(_msg)

			end -- CHECK HOME AIRBASE

		else -- CHECK MISSION ZONE
			_msg = string.format("%sStart - Zone %s not found! Mission skipped.", 
				self.traceTitle, 
				mission.zone
			)
			SUPPORTAC:E(_msg)
		end -- CHECK MISSION ZONE

	end -- FOR-DO LOOP

end -- SUPPORTAC:Start()

-- function to create new support mission and flightGroup
function SUPPORTAC:NewMission(mission, initDelay)
	_msg = string.format("%sCreate new mission for %s", 
		self.traceTitle, 
		mission.name
	)
	SUPPORTAC:T(_msg)

	-- create new mission
	local newMission = {}
	local missionCoordinate = mission.missionCoordinate
	local missionAltitude = mission.flightLevel * 100
	local missionSpeed = mission.speed
	local missionHeading = mission.heading
	local missionDespawn = mission.despawn or SUPPORTAC.missionDefault.despawn
	
	-- use appropriate AUFTRAG type for mission
	if mission.category == SUPPORTAC.category.tanker then
		local missionLeg = mission.leg or SUPPORTAC.missionDefault.tankerLeg -- set leg length. Either mission defined or use default for tanker.
		-- create new tanker AUFTRAG mission
		newMission = AUFTRAG:NewTANKER(
		missionCoordinate, 
		missionAltitude, 
		missionSpeed, 
		missionHeading, 
		missionLeg
		)
		_msg = string.format("%sNew mission created: %s", 
			self.traceTitle, 
			newMission:GetName()
		)
		SUPPORTAC:T(_msg)
	elseif mission.category == SUPPORTAC.category.awacs then
		local missionLeg = mission.leg or SUPPORTAC.missionDefault.awacsLeg -- set leg length. Either mission defined or use default for AWACS.
		-- create new AWACS AUFTRAG mission
		newMission = AUFTRAG:NewAWACS(
		missionCoordinate,
		missionAltitude,
		missionSpeed,
		missionHeading,
		missionLeg
		)
		_msg = string.format("%sNew mission created: %s", 
			self.traceTitle, 
			newMission:GetName()
		)
		SUPPORTAC:T(_msg)
	else
		_msg = self.traceTitle .. "Mission category not defined!"
		SUPPORTAC:E(_msg)
		return -- exit mission creation
	end

	newMission:SetEvaluationTime(5)

	if mission.tacan ~= nil then
		newMission:SetTACAN(mission.tacan, mission.tacanid)
	end

	newMission:SetRadio(mission.radio)

	local despawnDelay = mission.despawnDelay or SUPPORTAC.missionDefault.despawnDelay
	local activateDelay = (mission.activateDelay or SUPPORTAC.missionDefault.activateDelay) + despawnDelay

	-- spawn new group
	local spawnGroup = mission.missionSpawnTemplate:SpawnFromCoordinate(mission.spawnCoordinate)
	_msg = string.format("%sNew late activated group %s spawned.", 
		self.traceTitle, 
		spawnGroup:GetName()
	)
	SUPPORTAC:T({_msg, spawnGroup})

	-- create new flightGroup
	local flightGroup = FLIGHTGROUP:New(spawnGroup)
		:SetDefaultCallsign(mission.callsign, mission.callsignNumber)
		:SetDefaultRadio(SUPPORTAC.missionDefault.radio)
		--:SetDefaultAltitude(mission.flightLevel * 100)
		:SetDefaultSpeed(mission.speed) -- mission.speed + (mission.flightLevel / 2)
		
	-- add an initial waypoint between the aircraft and the mission zone
	--flightGroup:AddWaypoint(mission.waypointCoordinate, missionSpeed)
	flightGroup:SetHomebase(mission.homeAirbase)

	flightGroup:Activate(activateDelay)

	-- function call after flightGroup is spawned
	-- assign mission to new ac
	function flightGroup:OnAfterSpawned()
		_msg = string.format(SUPPORTAC.traceTitle .. "Flightgroup %s activated.", self:GetName())
		SUPPORTAC:T(_msg)
		-- assign mission to flightGroup
		self:AddMission(newMission)
	end

	-- function called after flightGroup starts mission
	-- set RTB criteria
	function flightGroup:OnAfterMissionStart()
		local missionName = newMission:GetName()
		local flightGroupName = self:GetName()
		local flightGroupCallSign = SUPPORTAC:GetCallSign(self)

		_msg = string.format(SUPPORTAC.traceTitle .. "Mission %s for Flightgroup %s, %s has started.", missionName, flightGroupName, flightGroupCallSign) -- self:GetCallsignName(true)
		SUPPORTAC:T(_msg)

		self:SetFuelLowRefuel(false)
		local fuelLowThreshold = mission.fuelLowThreshold or SUPPORTAC.missionDefault.fuelLowThreshold

		if fuelLowThreshold > 0 then
			self:SetFuelLowThreshold(fuelLowThreshold) -- tune fuel RTB trigger for each support mission
		end

		self:SetFuelLowRTB()

		function flightGroup:OnAfterRTB()
			_msg = string.format(SUPPORTAC.traceTitle .. "Flightgroup %s is RTB.", flightGroupName)
			SUPPORTAC:T(_msg)
		end

		function newMission:OnAfterDone()
			local missionName = self.name
			local missionFreq = mission.radio
			local flightGroupName = flightGroup:GetName()
			local flightGroupCallSign = SUPPORTAC:GetCallSign(flightGroup)
		
			_msg = string.format(SUPPORTAC.traceTitle .. "newMission OnAfterDone - Mission %s for Flightgroup %s is done.", missionName, flightGroupName)
			SUPPORTAC:T(_msg)

			-- prepare off-station advisory message
			local msgText = string.format("All players, %s is going off station. A new aircraft will be on station shortly.", flightGroupCallSign)
			-- send off station advisory message
			SUPPORTAC:SendMessage(msgText, missionFreq)
			-- create a new mission to replace the departing support aircraft 
			SUPPORTAC:NewMission(mission)

			-- despawn this flightgroup, if it's still alive
			if flightGroup:IsAlive() and missionDespawn then
				_msg = string.format(SUPPORTAC.traceTitle .. "newMission OnAfterDone - Flightgroup %s will be despawned after %d seconds.", flightGroupName, despawnDelay)
				SUPPORTAC:T(_msg)

				flightGroup:Despawn(despawnDelay)
			end

		end -- newMission:OnAfterDone()

	end -- flightGroup:OnAfterMissionStart()

end -- SUPPORTAC:NewMission()

-- function called to send message
-- if MISSIONSRS is loaded, message will be sent on aupport aircraft freq.
-- Otherwise, message will be sent as text to all.
function SUPPORTAC:SendMessage(msgText, msgFreq)
	local _msg = string.format("%sSendMessage: %s", 
		self.traceTitle, 
		msgText
	)
	SUPPORTAC:T(_msg)
	if useSRS then
		MISSIONSRS:SendRadio(msgText, msgFreq)
	else
		MESSAGE:New(msgText):ToAll()
	end
end -- SUPPORTAC:SendMessage()

-- function called to return callsign name with major number only
function SUPPORTAC:GetCallSign(flightGroup)
	local callSign=flightGroup:GetCallsignName()
	if callSign then
		local callsignroot = string.match(callSign, '(%a+)') or "Ghost" -- Uzi
		local callnumber = string.match(callSign, "(%d+)$" ) or "91" -- 91
		local callnumbermajor = string.char(string.byte(callnumber,1)) -- 9
		callSign = callsignroot.." "..callnumbermajor -- Uzi/Victory 9
		return callSign
	end
	-- default callsign to return if it cannot be determined
	return "Ghostrider 1"
end -- SUPPORTAC:GetCallSign()

-- Support categories used to define which AUFTRAG type is used
SUPPORTAC.category = {
	tanker = 1,
	awacs = 2,
} -- end SUPPORTAC.category

-- Support aircraft types. Used to define the late activated group to be used as the spawn template
-- for the type. A check is made to ensure the template exists in the miz or that the value is the
-- same as the ID in the SPAWNTEMPLATES.templates block (see supportaircraft.lua)
SUPPORTAC.type = {
	tankerBoom = "KC-135", -- template to be used for type = "tankerBoom" OR SPAWNTEMPLATES.templates["KC-135"]
	tankerProbe = "KC-135MPRS", -- template to be used for type = "tankerProbe" OR SPAWNTEMPLATES.templates["KC-135MPRS"]
	tankerProbeC130 = "KC-130", -- template for type = "tankerProbeC130" OR SPAWNTEMPLATES.templates["KC-130"]
	awacsE3a = "AWACS-E3A", -- template to be used for type = "awacsE3a" OR SPAWNTEMPLATES.templates["AWACS-E3A"]
	awacsE2d = "AWACS-E2D", -- template to be used for type = "awacsE2d" OR SPAWNTEMPLATES.templates["AWACS-E2D"]
	awacsA50 = "AWACS-A50", -- template to be used for type = "awacsA50" OR SPAWNTEMPLATES.templates["AWACS-A50"]
} -- end SUPPORTAC.type

-- Default home airbase. Added to the mission spawn template if not defined in
-- the mission data block
SUPPORTAC.homeAirbase = {
	["Nevada"] = AIRBASE.Nevada.Nellis_AFB,
	["Caucasus"] = AIRBASE.Caucasus.Tbilisi_Lochini,
	["PersianGulf"] = AIRBASE.PersianGulf.Al_Dhafra_AB,
	["Syria"] = AIRBASE.Syria.Incirlik,
	["Sinai"] = AIRBASE.Sinai.Cairo_International_Airport,
	["MarianaIslands"] = AIRBASE.MarianaIslands.Andersen_AFB,
} -- end SUPPORTAC.homeAirbase

-- default mission values to be used if not specified in the flight's mission data block
SUPPORTAC.missionDefault = {
	name = "TKR", -- default name for the mission
	category = SUPPORTAC.category.tanker, -- default aircraft category
	type = SUPPORTAC.type.tankerBoom, -- default spawn template that will be used
	callsign = CALLSIGN.Tanker.Texaco, -- default callsign
	callsignNumber = 1, -- default calsign number
	tacan = 100, -- default TACAN preset
	tacanid = "TEX", -- default TACAN ID
	radio = 251, -- default radio freq the ac will use when not on mission
	flightLevel = 200, -- default FL at which to fly mission
	speed = 315, -- default speed at which to fly mission
	heading = 90, --default heading on which to spawn aircraft
	tankerLeg = 50, -- default tanker racetrack leg length
	awacsLeg = 70, -- default awacs racetrack leg length
	activateDelay = 10, -- delay, in seconds, after the previous ac has despawned before the new ac will be activated 
	despawnDelay = 30, -- delay, in seconds, before the old ac will be despawned
	unlimitedFuel = true, -- default unlimited fuel. Set to false in data if fuel RTB is desired
	fuelLowThreshold = 30, -- default % fuel low level to trigger RTB
	spawnDistance = 1, -- default distance in NM from the mission zone at which to spawn aircraft
	countryid = country.id.USA, -- default country to be used for predfined templates
	coalition = coalition.side.BLUE, -- default coalition to use for predefined templates
	groupCategory = Group.Category.AIRPLANE, -- default group category to use for predefined templates
	despawn = true, -- default deSpawn option. if false or nil the aircraft will fly to hom base on RTB
} -- end SUPPORTAC.missionDefault


-- END SUPPORT AIRCRAFT SECTION