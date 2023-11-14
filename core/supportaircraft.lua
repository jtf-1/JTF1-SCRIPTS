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
--    tankerBoom = "KC-135" - SUPPORTAC.template["KC-135"]
--    tankerProbe = KC-135MPRS" - SUPPORTAC.template["KC-135MPRS"]
--    WIP** tankerProbeC130 = "KC-130" - SUPPORTAC.template["KC-130"]
--
-- Category: awacs
-- awacsE3a = "AWACS-E3A" - SUPPORTAC.template["AWACS-E3A"]
-- awacsE2d = "AWACS-E3A" - SUPPORTAC.template["AWACS-E3A"]
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
	_msg = string.format(self.traceTitle .. "Start()")
	self:T(_msg)

	-- default to not using SRS unless both the server AND the module request it AND MISSIONSRS.Radio.active is true
	useSRS = (JTF1.useSRS and self.useSRS) and MISSIONSRS.Radio.active 
	self:I({self.traceTitle .. "useSRS", self.useSRS})

	for index, mission in ipairs(SUPPORTAC.mission) do -- FOR-DO LOOP
		_msg = string.format(self.traceTitle .. "Start - mission %s", mission.name)
		SUPPORTAC:T({_msg, mission})

		local skip = false -- check value to exit early from the current for/do iteration

		local missionZone = ZONE:FindByName(mission.zone)
		-- check zone is present in miz
		if missionZone then -- CHECK MISSION ZONE
		
			-- if trace is on, draw the zone on the map
			if BASE:IsTrace() then 
				-- draw mission zone on map
				missionZone:DrawZone()
			end

			-- airbase to which aircraft will fly on RTB
			local missionTheatre = env.mission.theatre
			_msg = SUPPORTAC.traceTitle .. tostring(missionTheatre)
			self:T(_msg)
			local missionHomeAirbase = mission.homeAirbase or SUPPORTAC.homeAirbase[missionTheatre]
			_msg = SUPPORTAC.traceTitle .. tostring(missionHomeAirbase)
			self:T(_msg)
			_msg = string.format(self.traceTitle .. "start - Mission %s set to use %s as home base.", mission.name, missionHomeAirbase)
			SUPPORTAC:T(_msg)
			if missionHomeAirbase then -- CHECK HOME AIRBASE
				_msg = string.format(self.traceTitle .. "start - Mission %s using %s as home base.", mission.name, missionHomeAirbase)
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
					_msg = string.format(self.traceTitle .. "start - Using spawn template from miz for %s.", missionSpawnType)
					SUPPORTAC:T(_msg)

					-- add mission spawn object using template in miz
					mission.missionSpawnTemplate = SPAWN:NewWithAlias(missionSpawnType, missionSpawnAlias)
				elseif SUPPORTAC.template[missionSpawnType] then -- ELSEIF FIND MISSION SPAWN TEMPLATE-- Use predfined template from SUPPORTAC.template[missionSpawnType]
					_msg = string.format(self.traceTitle .. "start - Using spawn template from SUPPORTAC.template for %s.", missionSpawnType)
					SUPPORTAC:T(_msg)

					-- get template to use for spawn
					local spawnTemplate = SUPPORTAC.template[missionSpawnType]

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
						_msg = string.format(self.traceTitle .. "Callsign for mission %s is %s", mission.name, spawnTemplate.units[1]["callsign"]["name"])
						SUPPORTAC:T(_msg)
					elseif type(missionUnit["callsign"]) == "number" then
						missionUnit["callsign"] = tonumber(missionCallsignId)
					else
						missionUnit["callsign"] = missionCallsignId
					end
					
					local missionCountryid = mission.countryid or SUPPORTAC.missionDefault.countryid
					local missionCoalition = mission.coalition or SUPPORTAC.missionDefault.coalition
					local missionGroupCategory = mission.groupCategory or SUPPORTAC.missionDefault.groupCategory

					-- add mission spawn object using template in SUPPORTAC.template[missionSpawnType]
					mission.missionSpawnTemplate = SPAWN:NewFromTemplate(spawnTemplate, missionSpawnType, missionSpawnAlias)
						:InitCountry(missionCountryid) -- set spawn countryid
						:InitCoalition(missionCoalition) -- set spawn coalition
						:InitCategory(missionGroupCategory) -- set category
				else -- FIND MISSION SPAWN TEMPLATE
						skip = true -- can't exit to the next iteration so skip the rest of the mission creation
				end -- FIND MISSION SPAWN TEMPLATE

				-- if missionSpawnTamplate was not created continue to next iteration, otherwise set spawn inits and create a new mission
				if skip then -- CHECK SKIP
					_msg = string.format(self.traceTitle .. "Start - template for type %s for mission %s is not present in MIZ or as a predefined template!", missionSpawnType, missionSpawnAlias)
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

					_msg = string.format(self.traceTitle .. "New late activated mission spawn template added for %s", missionSpawnAlias)
					SUPPORTAC:T({_msg, mission.missionSpawnTemplate})
					
					-- call NewMission() to create the initial mission for the support aircraft
					-- subsequent mission restarts will be called after the mission's AUFTRAG is cancelled
					SUPPORTAC:NewMission(mission, 0) -- create new mission with specified delay to flightgroup activation
				end -- CHECK SKIP
			
			else -- CHECK HOME AIRBASE
				
				_msg = string.format(self.traceTitle .. "Start - Default Home Airbase for %s not defined! Mission skipped.", missionTheatre)
				SUPPORTAC:E(_msg)

			end -- CHECK HOME AIRBASE

		else -- CHECK MISSION ZONE
			_msg = string.format(self.traceTitle .. "Start - Zone %s not found! Mission skipped.", mission.zone)
			SUPPORTAC:E(_msg)
		end -- CHECK MISSION ZONE

	end -- FOR-DO LOOP

end -- SUPPORTAC:Start()

-- function to create new support mission and flightGroup
function SUPPORTAC:NewMission(mission, initDelay)
	_msg = string.format(self.traceTitle .. "Create new mission for %s", mission.name)
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
		_msg = string.format(self.traceTitle .. "New mission created: %s", newMission:GetName())
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
		_msg = string.format(self.traceTitle .. "New mission created: %s", newMission:GetName())
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
	_msg = string.format(self.traceTitle .. "New late activated group %s spawned.", spawnGroup:GetName())
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
	local _msg = string.format(self.traceTitle .. "SendMessage: %s", msgText)
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
-- same as the ID in the SUPPORTAC.template block (see supportaircraft.lua)
SUPPORTAC.type = {
	tankerBoom = "KC-135", -- template to be used for type = "tankerBoom" OR SUPPORTAC.template["KC-135"]
	tankerProbe = "KC-135MPRS", -- template to be used for type = "tankerProbe" OR SUPPORTAC.template["KC-135MPRS"]
	tankerProbeC130 = "KC-130", -- template for type = "tankerProbeC130" OR SUPPORTAC.template["KC-130"]
	awacsE3a = "AWACS-E3A", -- template to be used for type = "awacsE3a" OR SUPPORTAC.template["AWACS-E3A"]
	awacsE2d = "AWACS-E2D", -- template to be used for type = "awacsE2d" OR SUPPORTAC.template["AWACS-E2D"]
	awacsA50 = "AWACS-A50", -- template to be used for type = "awacsA50" OR SUPPORTAC.template["AWACS-A50"]
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

-- TEMPLATES DEFINED IN SUPPORTAIRCRAFT_TEMPLATES.LUA
-- pre-defined spawn templates to be used as an alternative to placing late activated templates in the miz
--[[ SUPPORTAC.template = {
	["KC-135"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 6096,
					["action"] = "Fly Over Point",
					["alt_type"] = "BARO",
					["speed"] = 164.44444444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "Tanker",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["callsign"] = "RTB",
												["modeChannel"] = "Y",
												["channel"] = 60,
												["system"] = 5,
												["unitId"] = 20564,
												["bearing"] = true,
												["frequency"] = 1147000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 6,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -88072.492518417,
					["x"] = -129287.90747937,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 1,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 6096,
				["alt_type"] = "BARO",
				["livery_id"] = "standard usaf",
				["skill"] = "Excellent",
				["speed"] = 164.44444444444,
				["type"] = "KC-135",
				["unitId"] = 1,
				["psi"] = 1.0956711527151,
				["y"] = -88072.492518417,
				["x"] = -129287.90747937,
				["name"] = "KC-135",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 0,
					["chaff"] = 0,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.0960185021449,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Texaco11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "088",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -88072.492518417,
		["x"] = -129287.90747937,
		["name"] = "KC-135",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of [KC-135]
	["KC-135MPRS"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 6096,
					["action"] = "Fly Over Point",
					["alt_type"] = "BARO",
					["speed"] = 164.44444444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "Tanker",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["callsign"] = "RTB",
												["modeChannel"] = "Y",
												["channel"] = 60,
												["system"] = 5,
												["unitId"] = 20565,
												["bearing"] = true,
												["frequency"] = 1147000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["number"] = 4,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = true,
												["name"] = 6,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -87560.730212787,
					["x"] = -129296.58141675,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 1,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 6096,
				["alt_type"] = "BARO",
				["livery_id"] = "22nd ARW",
				["skill"] = "Excellent",
				["speed"] = 164.44444444444,
				["type"] = "KC135MPRS",
				["unitId"] = 1,
				["psi"] = 1.0660373467781,
				["y"] = -87560.730212787,
				["x"] = -129296.58141675,
				["name"] = "KC-135MPRS",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 90700,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.0660373467782,
				["callsign"] = 
				{
					[1] = 3,
					[2] = 1,
					["name"] = "Shell11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "089",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -87560.730212787,
		["x"] = -129296.58141675,
		["name"] = "KC-135MPRS",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of [KC-135MPRS]
	["KC-130"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 2438.4,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 172.5,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "Tanker",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["unitId"] = 16683,
												["modeChannel"] = "Y",
												["channel"] = 60,
												["system"] = 5,
												["callsign"] = "ARC",
												["bearing"] = true,
												["frequency"] = 1147000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -11585.313345172,
					["x"] = -399323.02717468,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 2447,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 2438.4,
				["alt_type"] = "BARO",
				["livery_id"] = "default",
				["skill"] = "Excellent",
				["speed"] = 172.5,
				["type"] = "KC130",
				["unitId"] = 16683,
				["psi"] = 1.4236457627903,
				["y"] = -11585.313345172,
				["x"] = -399323.02717468,
				["name"] = "KC-130",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 30000,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.4236457627903,
				["callsign"] = 
				{
					[1] = 2,
					[2] = 1,
					["name"] = "Arco11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "139",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -11585.313345172,
		["x"] = -399323.02717468,
		["name"] = "KC-130",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,		
	}, -- end of ["KC-130"]
	["AWACS-E3A"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 6096,
					["action"] = "Fly Over Point",
					["alt_type"] = "BARO",
					["speed"] = 164.44444444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "AWACS",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 46,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -88627.624510964,
					["x"] = -129296.58141675,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 17446,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 6096,
				["alt_type"] = "BARO",
				["livery_id"] = "nato",
				["skill"] = "Excellent",
				["speed"] = 164.44444444444,
				["type"] = "E-3A",
				["unitId"] = 20566,
				["psi"] = 1.1124120783257,
				["y"] = -88627.624510964,
				["x"] = -129296.58141675,
				["name"] = "AWACS-E3A",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = 65000,
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.1124120783257,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Overlord11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "090",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -88627.624510964,
		["x"] = -129296.58141675,
		["name"] = "AWACS-E3A",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of [AWACS-E3A]
  	["AWACS-E2D"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = true,
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 9144,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 133.61111111111,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "AWACS",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "EPLRS",
											["params"] = 
											{
												["value"] = true,
												["groupId"] = 38,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = -12187.736469214,
					["x"] = -399320.85899169,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 2452,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 9144,
				["alt_type"] = "BARO",
				["livery_id"] = "E-2D Demo",
				["skill"] = "High",
				["speed"] = 133.61111111111,
				["type"] = "E-2C",
				["unitId"] = 16697,
				["psi"] = 1.3887207292845,
				["y"] = -12187.736469214,
				["x"] = -399320.85899169,
				["name"] = "AWACS-E2D-1",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "5624",
					["flare"] = 60,
					["chaff"] = 120,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = -1.3887207292845,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Overlord11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "143",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = -12187.736469214,
		["x"] = -399320.85899169,
		["name"] = "AWACS-E2D",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,		
	}, -- end of ["AWACS-E2D"]
	["AWACS-A50"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "AWACS",
		["uncontrolled"] = false,
		["taskSelected"] = true,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 10972.8,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 220.97222222222,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["enabled"] = true,
									["auto"] = true,
									["id"] = "AWACS",
									["number"] = 1,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 2,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 3,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = 0,
												["name"] = 1,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
								[4] = 
								{
									["enabled"] = true,
									["auto"] = false,
									["id"] = "WrappedAction",
									["number"] = 4,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "Option",
											["params"] = 
											{
												["value"] = false,
												["name"] = 19,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [4]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 315953.41096792,
					["x"] = 63905.857563882,
					["name"] = "",
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 588,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 10972.8,
				["alt_type"] = "BARO",
				["livery_id"] = "RF Air Force new",
				["skill"] = "High",
				["speed"] = 220.97222222222,
				["AddPropAircraft"] = 
				{
					["PropellorType"] = 0,
					["SoloFlight"] = false,
				}, -- end of ["AddPropAircraft"]
				["type"] = "A-50",
				["unitId"] = 1595,
				["psi"] = -1.7947587772958,
				["y"] = 315953.41096792,
				["x"] = 63905.857563882,
				["name"] = "RED_AWACS",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "70000",
					["flare"] = 192,
					["chaff"] = 192,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 1.7947587772958,
				["callsign"] = 666,
				["onboard_num"] = "027",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 315953.41096792,
		["x"] = 63905.857563882,
		["name"] = "RED_AWACS",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of ["AWACS-RED"]
	["S3BTANKER"] = {
		["category"] = Group.Category.AIRPLANE,
		["lateActivation"] = true,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["radioSet"] = false,
		["task"] = "Refueling",
		["uncontrolled"] = false,
		["route"] = 
		{
			["routeRelativeTOT"] = true,
			["points"] = 
			{
				[1] = 
				{
					["alt"] = 1828.8,
					["action"] = "Turning Point",
					["alt_type"] = "BARO",
					["speed"] = 141.31944444444,
					["task"] = 
					{
						["id"] = "ComboTask",
						["params"] = 
						{
							["tasks"] = 
							{
								[1] = 
								{
									["number"] = 1,
									["auto"] = true,
									["id"] = "Tanker",
									["enabled"] = true,
									["params"] = 
									{
									}, -- end of ["params"]
								}, -- end of [1]
								[2] = 
								{
									["number"] = 2,
									["auto"] = true,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "ActivateBeacon",
											["params"] = 
											{
												["type"] = 4,
												["AA"] = false,
												["callsign"] = "TKR",
												["system"] = 4,
												["channel"] = 1,
												["modeChannel"] = "X",
												["bearing"] = true,
												["frequency"] = 962000000,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [2]
								[3] = 
								{
									["number"] = 3,
									["auto"] = false,
									["id"] = "WrappedAction",
									["enabled"] = true,
									["params"] = 
									{
										["action"] = 
										{
											["id"] = "SetInvisible",
											["params"] = 
											{
												["value"] = true,
											}, -- end of ["params"]
										}, -- end of ["action"]
									}, -- end of ["params"]
								}, -- end of [3]
							}, -- end of ["tasks"]
						}, -- end of ["params"]
					}, -- end of ["task"]
					["type"] = "Turning Point",
					["ETA"] = 0,
					["ETA_locked"] = true,
					["y"] = 606748.96393416,
					["x"] = -358539.84033849,
					["formation_template"] = "",
					["speed_locked"] = true,
				}, -- end of [1]
			}, -- end of ["points"]
		}, -- end of ["route"]
		["groupId"] = 1,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["alt"] = 1828.8,
				["alt_type"] = "BARO",
				["livery_id"] = "usaf standard",
				["skill"] = "High",
				["speed"] = 141.31944444444,
				["type"] = "S-3B Tanker",
				["unitId"] = 1,
				["psi"] = 0,
				["y"] = 606748.96393416,
				["x"] = -358539.84033849,
				["name"] = "Aerial-1-1",
				["payload"] = 
				{
					["pylons"] = 
					{
					}, -- end of ["pylons"]
					["fuel"] = "7813",
					["flare"] = 30,
					["chaff"] = 30,
					["gun"] = 100,
				}, -- end of ["payload"]
				["heading"] = 0,
				["callsign"] = 
				{
					[1] = 1,
					[2] = 1,
					["name"] = "Texaco11",
					[3] = 1,
				}, -- end of ["callsign"]
				["onboard_num"] = "010",
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = 606748.96393416,
		["x"] = -358539.84033849,
		["name"] = "S3BTANKER",
		["communication"] = true,
		["start_time"] = 0,
		["modulation"] = 0,
		["frequency"] = 251,
	}, -- end of ["S3BTANKER"]
} -- end SUPPORTAC.template
-- ]]

-- END SUPPORT AIRCRAFT SECTION