env.info( "[JTF-1] bfmacm" )
--
-- ZONES: if zones are MOOSE polygon zones, zone name in mission editor MUST be suffixed with ~ZONE_POLYGON
-- 

BFMACM = {
	ClassName = "BFMACM",
	version = "1.0",
	traceTitle = "[JTF-1] ",
	menuAdded = {},
	menuF10 = {},
	useSRS = true,
}

-- BFMACM.zoneBfmAcmName = "COYOTEABC" -- The BFM/ACM Zone
-- BFMACM.zonesNoSpawnName = { -- zones inside BFM/ACM zone within which adversaries may NOT be spawned.
-- 	"zone_box",
-- } 

BFMACM.adversary = {
	menu = { -- Adversary menu
		{template = "ADV_F4", menuText = "Adversary A-4"},
		{template = "ADV_MiG28", menuText = "Adversary MiG-28"},
		{template = "ADV_Su27", menuText = "Adversary MiG-23"},
		{template = "ADV_MiG23", menuText = "Adversary Su-27"},
		{template = "ADV_F16", menuText = "Adversary F-16"},
		{template = "ADV_F18", menuText = "Adversary F-18"},
	},
	range = {5, 10, 20}, -- ranges at which to spawn adversaries in nautical miles
	spawn = {}, -- container for aversary spawn objects
	defaultRadio = "377.8",
}

-- set frequency to use if messages are to be sent using SRS
BFMACM.rangeRadio = JTF1.rangeRadio or BFMACM.defaultRadio

-- Inherit from BASE
BFMACM = BASE:Inherit( BFMACM, BASE:New() )
-- Add eventhandler
BFMACM:HandleEvent(EVENTS.PlayerEnterAircraft)
BFMACM:HandleEvent(EVENTS.PlayerLeaveUnit)

local _msg
local useSRS

function BFMACM:Start() -- start BFMACM module
	useSRS = (JTF1.useSRS and BFMACM.useSRS) and MISSIONSRS.Radio.active -- default to not using SRS unless both the server AND the module request it and MISSIONSRS.Radio is true
	_msg = string.format("[JTF-1 BFMACM] useSRS: %s", tostring(useSRS))
	-- if useSRS then
	-- 	_msg = _msg .. "TRUE"
	-- else
	-- 	_msg = _msg .. "FALSE"
	-- end 
	self:T(_msg)

	-- Add main BFMACM zone
	if self.zoneBfmAcmName ~= nil then
		_zone = ZONE:FindByName(self.zoneBfmAcmName) or ZONE_POLYGON:FindByName(self.zoneBfmAcmName)
		if _zone == nil then
			_msg = string.format("[JTF-1 BFMACM] ERROR: BFM/ACM Zone: %s not found!", self.zoneBfmAcmName)
			self:E(_msg)
		else
			self.zoneBfmAcm = _zone
			_msg = string.format("[JTF-1 BFMACM] BFM/ACM Zone: %s added.", self.zoneBfmAcmName)
			self:T(_msg)
		end
	else
		-- no zone defined, whole map will be active
		_msg = "[JTF-1 BFMACM] No zone defined. Whole map is active."
		self:T(_msg)
		self.zoneBfmAcm = false

	end

	-- Add spawn exclusion zone(s)
	if self.zonesNoSpawnName then
		self.zonesNoSpawn = {}
		for i, zoneNoSpawnName in ipairs(self.zonesNoSpawnName) do
			_zone = (ZONE:FindByName(zoneNoSpawnName) and ZONE:FindByName(zoneNoSpawnName) or ZONE_POLYGON:FindByName(zoneNoSpawnName))
			if _zone == nil then
			_msg = "[JTF-1 BFMACM] ERROR: Exclusion zone: " .. tostring(zoneNoSpawnName) .. " not found!"
			self:E(_msg)
			else
				self.zonesNoSpawn[i] = _zone
			_msg = "[JTF-1 BFMACM] Exclusion zone: " .. tostring(zoneNoSpawnName) .. " added."
			self:T(_msg)
			end
		end
	else
		self:T("[JTF-1 BFMACM] No exclusion zones defined.")
	end

	-- Add spawn objects
	for i, adversaryMenu in ipairs(BFMACM.adversary.menu) do
		_adv = GROUP:FindByName(adversaryMenu.template)
		if _adv then
			self.adversary.spawn[adversaryMenu.template] = SPAWN:New(adversaryMenu.template)
		else
			_msg = "[JTF-1 BFMACM] ERROR: spawn template: " .. tostring(adversaryMenu.template) .. " not found!" .. tostring(zoneNoSpawnName) .. " not found!"
			self:E(_msg)
		end
	end

end

-- check player is present and unit is alive
function BFMACM:GetPlayerUnitAndName(unitname)
	if unitname ~= nil then
		local DCSunit = Unit.getByName(unitname)
		if DCSunit then
		local playername=DCSunit:getPlayerName()
		local unit = UNIT:Find(DCSunit)
		if DCSunit and unit and playername then
			return unit, playername
		end
		end
	end
	-- Return nil if we could not find a player.
	return nil,nil
end

-- Spawn adversaries
function BFMACM:SpawnAdv(adv,qty,group,rng,unit)
	local playerName = (unit:GetPlayerName() and unit:GetPlayerName() or "Unknown") 
	local range = rng * 1852
	local hdg = unit:GetHeading()
	local pos = unit:GetPointVec2()
	local spawnPt = pos:Translate(range, hdg, true)
	local spawnVec3 = spawnPt:GetVec3()
	local spawnAllowed, msgNoSpawn

	-- check player is in BFM ACM zone.
	if self.zoneBfmAcm then
		_msg = "[JTF-1 BFMACM] SpawnAdv(). Allowed Spawn Zone is defined."
		self:T(_msg)
		spawnAllowed = unit:IsInZone(self.zoneBfmAcm)
		msgNoSpawn = ", Cannot spawn adversary aircraft if you are outside the BFM/ACM zone!"
	else
		_msg = "[JTF-1 BFMACM] SpawnAdv(). No Allowed Spawn Zone defined."
		self:T(_msg)
		-- no allowed spawn zone defined. Whole map active.
		spawnAllowed = true
	end

	-- Check spawn location is not in an exclusion zone
	if spawnAllowed then
		if self.zonesNoSpawn then
		for i, zoneExclusion in ipairs(self.zonesNoSpawn) do
			spawnAllowed = not zoneExclusion:IsVec3InZone(spawnVec3)
		end
		msgNoSpawn = ", Cannot spawn adversary aircraft in an exclusion zone. Change course, or increase your range from the zone, and try again."
		end
	end

	-- Check spawn location is inside the BFM/ACM zone
	if spawnAllowed and self.zoneBfmAcm then
		spawnAllowed = self.zoneBfmAcm:IsVec3InZone(spawnVec3)
		msgNoSpawn = ", Cannot spawn adversary aircraft outside the BFM/ACM zone. Change course and try again."
	end

	-- Spawn the adversary, if not in an exclusion zone or outside the BFM/ACM zone.
	if spawnAllowed then
		self.adversary.spawn[adv]:InitGrouping(qty)
		:InitHeading(hdg + 180)
		:OnSpawnGroup(
		function ( SpawnGroup )
			local CheckAdversary = SCHEDULER:New( SpawnGroup, 
			function (CheckAdversary)
				if SpawnGroup and BFMACM.zoneBfmAcm then
					if SpawnGroup:IsNotInZone( BFMACM.zoneBfmAcm ) then
						local msg = "All players, BFM Adversary left BFM Zone and was removed!"
						if useSRS then -- if MISSIONSRS radio object has been created, send message via default broadcast.
							MISSIONSRS:SendRadio(msg,BFMACM.rangeRadio)
						else -- otherwise, send in-game text message
							MESSAGE:New(msg):ToAll()
						end
						--MESSAGE:New("Adversary left BFM Zone and was removed!"):ToAll()
						SpawnGroup:Destroy()
						SpawnGroup = nil
					end
				end
			end,
			{}, 0, 5 )
		end
		)
		:SpawnFromVec3(spawnVec3)
		local msg = "All players, " .. playerName .. " has spawned BFM Adversary."
		if useSRS then -- if MISSIONSRS radio object has been created, send message via default broadcast.
			MISSIONSRS:SendRadio(msg,self.rangeRadio)
		else -- otherwise, send in-game text message
			MESSAGE:New(msg):ToAll()
		end
		--MESSAGE:New(playerName .. " has spawned Adversary."):ToGroup(group)
	else
		local msg = playerName .. msgNoSpawn
		if useSRS then -- if MISSIONSRS radio object has been created, send message via default broadcast.
			MISSIONSRS:SendRadio(msg,BFMACM.rangeRadio)
		else -- otherwise, send in-game text message
			MESSAGE:New(msg):ToAll()
		end
		--MESSAGE:New(playerName .. msgNoSpawn):ToGroup(group)
	end
end

function BFMACM:AddMenu(unitname)
	self:T("[JTF-1 BFMACM] AddMenu called.")
  local unit, playername = self:GetPlayerUnitAndName(unitname)
  if unit and playername then
    local group = unit:GetGroup()
    local gid = group:GetID()
    local uid = unit:GetID()
    if group and gid then
      -- only add menu once!
      if self.menuAdded[uid] == nil then
        -- add GROUP menu if not already present
        if self.menuF10[gid] == nil then
			self:T("[JTF-1 BFMACM] Adding menu for group: " .. group:GetName())
			self.menuF10[gid] = MENU_GROUP:New(group, "AI BFM/ACM")
        end
        if self.menuF10[gid][uid] == nil then
          -- add playername submenu
          self:T("[JTF-1 BFMACM] Add submenu for player: " .. playername)
          self.menuF10[gid][uid] = MENU_GROUP:New(group, playername, BFMACM.menuF10[gid])
          -- add adversary submenus and range selectors
          self:T("[JTF-1 BFMACM] Add submenus and range selectors for player: " .. playername)
          for iMenu, adversary in ipairs(self.adversary.menu) do
            -- Add adversary type menu
            self.menuF10[gid][uid][iMenu] = MENU_GROUP:New(group, adversary.menuText, BFMACM.menuF10[gid][uid])
            -- Add single or pair selection for adversary type
            self.menuF10[gid][uid][iMenu].single = MENU_GROUP:New(group, "Single", BFMACM.menuF10[gid][uid][iMenu])
            self.menuF10[gid][uid][iMenu].pair = MENU_GROUP:New(group, "Pair", BFMACM.menuF10[gid][uid][iMenu])
            -- select range at which to spawn adversary
            for iCommand, range in ipairs(BFMACM.adversary.range) do
                MENU_GROUP_COMMAND:New(group, tostring(range) .. " nm", BFMACM.menuF10[gid][uid][iMenu].single, BFMACM.SpawnAdv, BFMACM, adversary.template, 1, group, range, unit)
                MENU_GROUP_COMMAND:New(group, tostring(range) .. " nm", BFMACM.menuF10[gid][uid][iMenu].pair, BFMACM.SpawnAdv, BFMACM, adversary.template, 2, group, range, unit)
            end
          end
        end
        BFMACM.menuAdded[uid] = true
      end
    else
		self:T(string.format("[JTF-1 BFMACM] ERROR: Could not find group or group ID in AddMenu() function. Unit name: %s.", unitname))
    end
  else
    self:T(string.format("[JTF-1 BFMACM] ERROR: Player unit does not exist in AddMenu() function. Unit name: %s.", unitname))
  end
end
  
-- handler for PlayEnterAircraft event.
-- call function to add GROUP:UNIT menu.
function BFMACM:OnEventPlayerEnterAircraft(EventData)
	self:T("[JTF-1 BFMACM] PlayerEnterAircraft called.")
	local unitname = EventData.IniUnitName
	local unit, playername = BFMACM:GetPlayerUnitAndName(unitname)
	if unit and playername then
		self:T("[JTF-1 BFMACM] Player entered Aircraft: " .. playername)
		SCHEDULER:New(nil, BFMACM.AddMenu, {BFMACM, unitname},0.1)
	end
end

-- handler for PlayerLeaveUnit event.
-- remove GROUP:UNIT menu.
function BFMACM:OnEventPlayerLeaveUnit(EventData)
	local playername = EventData.IniPlayerName
	local unit = EventData.IniUnit
	local gid = EventData.IniGroup:GetID()
	local uid = EventData.IniUnit:GetID()
	self:T("[JTF-1 BFMACM] " .. playername .. " left unit:" .. unit:GetName() .. " UID: " .. uid)
	if gid and uid then
		if self.menuF10[gid] then
			self:T("[JTF-1 BFMACM] Removing menu for unit UID:" .. uid)
			self.menuF10[gid][uid]:Remove()
			self.menuF10[gid][uid] = nil
			self.menuAdded[uid] = nil
		end
	end
end

-- pre-defined spawn templates to be used as an alternative to placing late activated templates in the miz
BFMACM.template = {

}
--BFMACM:Start()

--- END ACMBFM SECTION