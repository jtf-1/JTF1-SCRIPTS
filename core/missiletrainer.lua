env.info( "[JTF-1] missiletrainer.lua" )
--
-- Tracks and destroys missiles fired at the player, if activated from F10 menu
--
-- Two files are used by this module;
--     missiletrainer.lua
--     missiletrainer_data.lua
--
-- 1. missiletrainer.lua
-- Core file. Contains functions, key values and GLOBAL settings.
--
-- 2. missiletrainer_data.lua
-- Contains settings that are specific to the miz.
-- Optional. If NOT used, uncomment MTRAINER:Start() at the end of this file.
-- If used, MTRAINER:Start() in this file MUST be commented out.
--
-- Load order in miz MUST be;
--     1. missiletrainer.lua
--     2. missiletrainer_data.lua
--
-- Settings in missiletrainer_data.lua will override the defaults in the core file.
--

-- Create MTRAINER container and defaults
MTRAINER = {
  menuadded = {},
  MenuF10   = {},
  safeZone = nil, -- safezone to use, otherwise nil --"ZONE_FOX"
  launchZone = nil, -- launchzone to use, otherwise nil --"ZONE_FOX"
  DefaultLaunchAlerts = false,
  DefaultMissileDestruction = false,
  DefaultLaunchMarks = false,
  ExplosionDistance = 300,
  useSRS = true,
}

local _msg

function MTRAINER:Start()
	_msg = "[JTF-1 MTRAINER] Start()."
	BASE:T(_msg)

	MTRAINER = BASE:Inherit(MTRAINER, BASE:New())

	-- add event handlers
	-- MTRAINER.eventHandler = EVENTHANDLER:New()
	MTRAINER:HandleEvent(EVENTS.PlayerEnterAircraft) -- trap player entering a slot
	MTRAINER:HandleEvent(EVENTS.PlayerLeaveUnit) -- trap player leaving a slot
	
	-- set whether module should use SRS to send radio messages
	self.useSRS = (JTF1.useSRS and self.useSRS) and MISSIONSRS.Radio.active -- default to not using SRS unless both the server AND the module request it AND MISSIONSRS.Radio.active is true
	BASE:I({"[JTF-1 MTRAINER] useSRS", self.useSRS})

	-- add new FOX class to the Missile Trainer
	MTRAINER.fox = FOX:New()

	--- FOX Default Settings
	MTRAINER.fox:SetDefaultLaunchAlerts(MTRAINER.DefaultLaunchAlerts)
	MTRAINER.fox:SetDefaultMissileDestruction(MTRAINER.DefaultMissileDestruction)
	MTRAINER.fox:SetDefaultLaunchMarks(MTRAINER.DefaultLaunchMarks)
	MTRAINER.fox:SetExplosionDistance(MTRAINER.ExplosionDistance)
	MTRAINER.fox:SetDebugOnOff()
	MTRAINER.fox:SetDisableF10Menu()

	-- zone in which players will be protected
	if MTRAINER.safeZone then
		MTRAINER.fox:AddSafeZone(ZONE:New(MTRAINER.safeZone))
	end

	-- zone in which launches will be tracked
	if MTRAINER.launchZone then
		MTRAINER.fox:AddLaunchZone(ZONE:New(MTRAINER.launchZone))
	end

	-- start the missile trainer
	MTRAINER.fox:Start()

end

-- handler for PlayEnterAircraft event.
-- call function to add GROUP:UNIT menu.
function MTRAINER:OnEventPlayerEnterAircraft(EventData)
	_msg = "[JTF-1 MTRAINER] OnEventPlayerEnterAircraft()."
	BASE:T(_msg)

	local unitname = EventData.IniUnitName
	local unit, playerName = MTRAINER:GetPlayerUnitAndName(unitname)
	if unit and playerName then
		SCHEDULER:New(nil, MTRAINER.AddMenu, {MTRAINER, unitname, true},0.1)
	end
end

-- check player is present and unit is alive
function MTRAINER:GetPlayerUnitAndName(unitname)
	_msg = "[JTF-1 MTRAINER] GetPlayerUnitAndName()."
	BASE:T(_msg)
	
	if unitname ~= nil then
		local DCSunit = Unit.getByName(unitname)
		if DCSunit then
			local playerName=DCSunit:getPlayerName()
			local unit = UNIT:Find(DCSunit)
			if DCSunit and unit and playerName then
				return unit, playerName
			end
		end
	end
	-- Return nil if we could not find a player.
	return nil,nil
end

--- Add Missile Trainer for GROUP|UNIT in F10 root menu.
-- @param #string unitname Name of unit occupied by client
function MTRAINER:AddMenu(unitname)
	_msg = "[JTF-1 MTRAINER] AddMenu()"
	BASE:T(_msg)

	local unit, playerName = self:GetPlayerUnitAndName(unitname)
	if unit and playerName then
		local group = unit:GetGroup()
		local gid = group:GetID()
		local uid = unit:GetID()
		if group and gid then
			-- only add menu once!
			if MTRAINER.menuadded[uid] == nil then
				-- add GROUP menu if not already present
				if MTRAINER.MenuF10[gid] == nil then
					BASE:T("[JTF-1 MTRAINER] Adding menu for group: " .. group:GetName())
					MTRAINER.MenuF10[gid] = MENU_GROUP:New(group, "Missile Trainer")
				end
				if MTRAINER.MenuF10[gid][uid] == nil then
					BASE:T("[JTF-1 MTRAINER] Add submenu for player: " .. playerName)
					MTRAINER.MenuF10[gid][uid] = MENU_GROUP:New(group, playerName, MTRAINER.MenuF10[gid])
					BASE:T("[JTF-1 MTRAINER] Add commands for player: " .. playerName)
					MENU_GROUP_COMMAND:New(group, "Missile Trainer On/Off", MTRAINER.MenuF10[gid][uid], MTRAINER.ToggleTrainer, MTRAINER, unitname)
					MENU_GROUP_COMMAND:New(group, "My Status", MTRAINER.MenuF10[gid][uid], MTRAINER.fox._MyStatus, MTRAINER.fox, unitname)
				end
				MTRAINER.menuadded[uid] = true
			end
		else
			BASE:T(string.format("[JTF-1 MTRAINER] ERROR: Could not find group or group ID in AddMenu() function. Unit name: %s.", unitname))
		end
	else
		BASE:T(string.format("[JTF-1 MTRAINER] ERROR: Player unit does not exist in AddMenu() function. Unit name: %s.", unitname))
	end
end

--- Toggle Launch Alerts and Destroy Missiles on/off
-- @param #string unitname name of client unit
function MTRAINER:ToggleTrainer(unitname)
	_msg = "[JTF-1 MTRAINER] ToggleTrainer()"
	BASE:T(_msg)

	self.fox:_ToggleLaunchAlert(unitname)
	self.fox:_ToggleDestroyMissiles(unitname)
end

-- handler for PlayerLeaveUnit event.
-- remove GROUP:UNIT menu.
function MTRAINER:OnEventPlayerLeaveUnit(EventData)
	_msg = "[JTF-1 MTRAINER] OnEventPlayerLeaveUnit()"
	BASE:T(_msg)

	local playerName = EventData.IniPlayerName
	local unit = EventData.IniUnit
	local gid = EventData.IniGroup:GetID()
	local uid = EventData.IniUnit:GetID()
	local unitName = unit:GetName()
	if gid and uid then
		_msg = string.format("[JTF-1 MTRAINER] %s left unit: %s with UID: %s", playerName,  unitName, uid)
		BASE:T(_msg)
		if MTRAINER.MenuF10[gid] then
			_msg = string.format("[JTF-1 MTRAINER] Removing menu for unit UID: %s", uid)
			BASE:T(_msg)
			MTRAINER.MenuF10[gid][uid]:Remove()
			MTRAINER.MenuF10[gid][uid] = nil
			MTRAINER.menuadded[uid] = nil
		end
	end
end

-- MTRAINER:Start() -- uncomment if module is used without missiletrainer_data.lua

--- END MISSILE TRAINER