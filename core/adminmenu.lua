env.info( "[JTF-1] adminmenu.lua" )

--- Admin menu
--
-- Add F10 command menus for selecting a mission to load, or restarting the current mission.
--
-- In the Mission Editor, add (a) switched condition trigger(s) with a 
-- FLAG EQUALS condition, where flag number is ADMIN.flagLoadMission value
-- and flag value is the ADMIN.missionList[x].missionFlagValue (see below).
-- A missionFlagValue == 0 is used to trigger restart of the current
-- mission using jtf1-hooks.lua.
--
-- If the menu should only appear for restricted client slots, set
-- ADMIN.menuAllSlots to FALSE and add a client slot with the group name
-- *prefixed* with the value set in ADMIN.adminMenuName.
--
-- If the menu should be available in all mission slots, set ADMIN.menuAllSlots
-- to TRUE.|
-- 

ADMIN = {
	ClassName = "ADMIN",
	traceTitle = "[JTF-1] ",
	version = "0.1",
	menuAllSlots = false, -- Set to true for admin menu to appear in all player slots
	defaultMissionRestart = "MISSION_RESTART",
	defaultMissionLoad = "MISSION_LOAD",
	defaultMissionFile = "missions.lua",
	defaultMissionFolder = "missions",
	defaultMissionPath = "C:\\Users\\jtf-1\\Saved Games\\missions",
	adminUnitName = "XX_", -- String to locate within unit name for admin slots
}

ADMIN.missionRestart = JTF1.missionRestart or ADMIN.defaultMissionRestart
ADMIN.missionLoad = JTF1.missionLoad or ADMIN.defaultMissionLoad
ADMIN.missionFile = JTF1.missionFile or ADMIN.defaultMissionFile

-- inherit methods,  properties etc from BASE for event handler, trace etc
ADMIN = BASE:Inherit(ADMIN, BASE:New())
-- ADMIN event handler
ADMIN:HandleEvent(EVENTS.PlayerEnterAircraft)



function ADMIN:Start()
	-- check if mission is in devmode.
	local devState = trigger.misc.getUserFlag(8888)
	-- add admin menu to all slots if dev mode is active
	if devState == 1 then
		ADMIN.menuAllSlots = true
	end

	-- check if a server config file has defined the path to the missions file.
	if JTF1.missionPath then
		ADMIN.missionPath = JTF1.missionPath
		_msg = string.format(ADMIN.traceTitle .. "missionPath = %s", ADMIN.missionPath)
		self:T(_msg)
	else
		if lfs then -- check if game environment is desanitised
			ADMIN.missionPath = (lfs.writedir() .. "\\" .. ADMIN.defaultMissionFolder) -- set mission path to current write directory
		else
			ADMIN.missionPath = "" -- empty mission path will bypass all but restart mission menu option
		end
	end

	-- set full path to mission list
	local missionPathFile = ADMIN.missionPath .. "\\" .. ADMIN.missionFile
	self:T(ADMIN.traceTitle .. "mission list file: " .. missionPathFile)
	-- check mission list lua file exists. If it does run it. 
	if UTILS.CheckFileExists(ADMIN.missionPath, ADMIN.missionFile) then
		self:T( ADMIN.traceTitle .. "Mission list file exists")
		dofile(missionPathFile)
		ADMIN.missionList = MISSIONLIST -- map mission list values to ADMIN.missionList
		self:T({ADMIN.traceTitle .. "ADMIN.missionList", ADMIN.missionList})
		-- if present insert local server mission list at top of ADMIN.missionList
		if JTF1.missionList then
			self:T({ADMIN.traceTitle .. "JTF1.missionList", ADMIN.missionList})
			table.insert(ADMIN.missionList, 1, JTF1.missionList[1])
			self:T({ADMIN.traceTitle .. "ADMIN.missionList with local server list", ADMIN.missionList})
		end
	else
		self:E(ADMIN.traceTitle .. "Error! Mission list file not found.")        
	end

end

function ADMIN:GetPlayerUnitAndName(unitName)
	if unitName ~= nil then
		-- Get DCS unit from its name.
		local DCSunit = Unit.getByName(unitName)
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

-- when player enters a slot, check if it's an admin slot and add F10 admin menu if it is
function ADMIN:OnEventPlayerEnterAircraft(EventData)
	local unitName = EventData.IniUnitName
	local unit, playername = ADMIN:GetPlayerUnitAndName(unitName)
	if unit and playername then
		-- add a scheduled task to create F10 menu if it's an admin slot or if menuAllslots is set to true
		if string.find(unitName, ADMIN.adminUnitName) or ADMIN.menuAllSlots then
			-- delay task to allow client to finish spawning
			SCHEDULER:New(nil, ADMIN.BuildAdminMenu, {self, unit, playername}, 0.5)
		end
	end
end

--- Load mission requested from menu
function ADMIN:LoadMission(playerName, missionFile)
	local adminMessage = ADMIN.missionRestart
	if playerName then
		self:T(ADMIN.traceTitle .. "Restart or load called by player name: " .. playerName)
	else
		self:T(ADMIN.traceTitle .. "Restart or load called by non-player!")
	end
	if missionFile then
		adminMessage = ADMIN.missionLoad .. "-" .. missionFile
	end
	MESSAGE:New(adminMessage):ToAll()
end

--- Add admin menu and commands if client is in an ADMIN spawn
function ADMIN:BuildAdminMenu(unit,playername)
	local adminGroup = unit:GetGroup()
	-- add ADMIN menu to F10
	local adminMenu
	if JTF1.menu.root then
		-- add root to JTF1 menu
		adminMenu = MENU_GROUP:New(adminGroup, "Admin", JTF1.menu.root)
	else
		-- add root to main F10 menu
		adminMenu = MENU_GROUP:New(adminGroup, "Admin")
	end
	
	-- add command to restart current mission  
	MENU_GROUP_COMMAND:New( adminGroup, "Restart Current Mission", adminMenu, ADMIN.LoadMission, self, playername)
	-- if a mission list has been found add submenus for it
	if ADMIN.missionList then
		self:T(ADMIN.traceTitle .. "Build missionList.")
		-- add menus to load missions
		for i, missionList in ipairs(ADMIN.missionList) do
			self:T(missionList)
			-- add menu for mission group  
			local missionName = MENU_GROUP:New(adminGroup, missionList.missionName, adminMenu)
			-- add menus for each mission file in the group
			for j, missionMenu in ipairs(missionList.missionMenu) do
				self:T(missionMenu)
				-- add full path to mission file if defined
				local missionFile = ADMIN.missionPath .. "\\" .. missionMenu.missionFile
				-- add command to load mission
				MENU_GROUP_COMMAND:New( adminGroup, missionMenu.menuText, missionName, ADMIN.LoadMission, self, playername, missionFile )
				_msg = string.format(ADMIN.traceTitle .. "Admin Menu Mission %s", missionFile)
				self:T(_msg)
			end
		end
	end
end

--- END ADMIN MENU SECTION