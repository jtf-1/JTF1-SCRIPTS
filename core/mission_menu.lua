env.info( "[JTF-1] mission_menu.lua" )

--- Mission Selection Menu
--- ======================
--- 
-- Add F10 command menus for selecting a mission to load, or restarting the current mission.
--
-- Loads a mission list (missions.lua) that defines the selectable missions and creates
-- menu options for restarting the current mission, or loading a different mission.
-- 
-- If the restart option is selected, a message-to-all is triggered containing the missionRestart value.
-- If a mission is selected, a message-to-all is triggered contianing the missionLoad value and 
-- the path to the selected mission.
--
-- The triggered message is intercepted and parsed by a hook (jtf1-hooks.lua) which will process
-- and action as requested (restart, or load the selected mission).
--
-- If the menu should only appear for restricted client slots, set
-- MISSIONMENU.menuAllSlots to FALSE and add a client slot with the group name
-- *prefixed* with the value set in MISSIONMENU.adminMenuName.
--
-- If the menu should be available in all mission slots, set MISSIONMENU.menuAllSlots
-- to TRUE.
-- 
-- Dependancies:
-- [missions.lua] - containins the list of missions that can be selected.
-- [jtf1-hooks.lua] - hooks, parses and actions the message triggered by selected menu option

MISSIONMENU = {
	ClassName = "MISSIONMENU",
	traceTitle = "[JTF-1] ",
	version = "0.1",
	menuAllSlots = false, -- Set to true for admin menu to appear in all player slots
    defaultMenu = "Missions", -- default menu under which to place the Mission Selector options
	defaultMissionRestart = "MISSION_RESTART", -- default mission restart text
	defaultMissionLoad = "MISSION_LOAD", -- default mission load text
	defaultMissionFile = "missions.lua", -- default mission file list
	defaultMissionFolder = "Missions", -- default folder containing missions.lua
	adminUnitName = "XX_", -- String to search for in unit name for admin slots
}

-- inherit methods,  properties etc from BASE for event handler, trace etc
MISSIONMENU = BASE:Inherit(MISSIONMENU, BASE:New())
-- MISSIONMENU event handler
MISSIONMENU:HandleEvent(EVENTS.PlayerEnterAircraft)

MISSIONMENU.missionRestart = JTF1.missionRestart or MISSIONMENU.defaultMissionRestart -- mission restart trigger text
MISSIONMENU.missionLoad = JTF1.missionLoad or MISSIONMENU.defaultMissionLoad -- mission load trigger text
MISSIONMENU.missionFile = JTF1.missionFile or MISSIONMENU.defaultMissionFile -- name of file containing mission list

-- Start Mission Selector
function MISSIONMENU:Start()
	-- -- check if mission is in devmode.
	-- local devMode = trigger.misc.getUserFlag("DEVMODE")
	-- -- add admin menu to all slots if dev mode is active
	-- if devMode == 1 then
	-- 	MISSIONMENU.menuAllSlots = true
	-- end

	-- check if a server config file has defined the path to the missions file.
	if JTF1.missionPath then
		MISSIONMENU.missionPath = JTF1.missionPath
		_msg = string.format(MISSIONMENU.traceTitle .. "missionPath = %s", MISSIONMENU.missionPath)
		self:I(_msg)
	else
		if lfs then -- check if game environment is desanitised
			MISSIONMENU.missionPath = (lfs.writedir() .. MISSIONMENU.defaultMissionFolder) -- set mission path to current write directory
		else
			MISSIONMENU.missionPath = "" -- empty mission path will bypass all but restart mission menu option
		end
	end

	-- set full path to mission list
	local missionPathFile = MISSIONMENU.missionPath .. "\\" .. MISSIONMENU.missionFile
	self:I(MISSIONMENU.traceTitle .. "mission list file: " .. missionPathFile)
	-- check mission list lua file exists. If it does run it. 
	if UTILS.CheckFileExists(MISSIONMENU.missionPath, MISSIONMENU.missionFile) then
		self:I( MISSIONMENU.traceTitle .. "Mission list file exists")
		dofile(missionPathFile)
		MISSIONMENU.missionList = MISSIONLIST -- map mission list values to MISSIONMENU.missionList
		self:I({MISSIONMENU.traceTitle .. "MISSIONMENU.missionList", MISSIONMENU.missionList})
		-- if present insert local server mission list at top of MISSIONMENU.missionList
		if JTF1.missionList then
			self:T({MISSIONMENU.traceTitle .. "JTF1.missionList", MISSIONMENU.missionList})
			table.insert(MISSIONMENU.missionList, 1, JTF1.missionList[1])
			self:T({MISSIONMENU.traceTitle .. "MISSIONMENU.missionList with local server list", MISSIONMENU.missionList})
		end
	else
		self:E(MISSIONMENU.traceTitle .. "Error! Mission list file not found.")        
	end

end

function MISSIONMENU:GetPlayerUnitAndName(unitName)
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
function MISSIONMENU:OnEventPlayerEnterAircraft(EventData)
	local unitName = EventData.IniUnitName
	local unit, playername = MISSIONMENU:GetPlayerUnitAndName(unitName)
	if unit and playername then
		-- add a scheduled task to create F10 menu if it's an admin slot or if menuAllslots is set to true
		if string.find(unitName, MISSIONMENU.adminUnitName) or MISSIONMENU.menuAllSlots then
			-- delay task to allow client to finish spawning
			SCHEDULER:New(nil, MISSIONMENU.BuildAdminMenu, {self, unit, playername}, 0.5)
		end
	end
end

--- Load mission requested from menu
function MISSIONMENU:LoadMission(playerName, missionFile)
	local adminMessage = MISSIONMENU.missionRestart
	if playerName then
		self:I(MISSIONMENU.traceTitle .. "Restart or load called by player name: " .. playerName)
	else
		self:I(MISSIONMENU.traceTitle .. "Restart or load called by non-player!")
	end
	if missionFile then
		adminMessage = MISSIONMENU.missionLoad .. "-" .. missionFile
	end
	MESSAGE:New(adminMessage):ToAll()
end

--- Add admin menu and commands if client is in an MISSIONMENU spawn
function MISSIONMENU:BuildAdminMenu(unit,playername)
	local adminGroup = unit:GetGroup()
	-- add MISSIONMENU menu to F10
	local adminMenu
	if JTF1.menu.root then
		-- add root to JTF1 menu
		adminMenu = MENU_GROUP:New(adminGroup, "Admin", JTF1.menu.root)
	else
		-- add root to main F10 menu
		adminMenu = MENU_GROUP:New(adminGroup, "Admin")
	end
	
	-- add command to restart current mission  
	MENU_GROUP_COMMAND:New( adminGroup, "Restart Current Mission", adminMenu, MISSIONMENU.LoadMission, self, playername)
	-- if a mission list has been found add submenus for it
	if MISSIONMENU.missionList then
		self:T(MISSIONMENU.traceTitle .. "Build missionList.")
		-- add menus to load missions
		for i, missionList in ipairs(MISSIONMENU.missionList) do
			self:T(missionList)
			-- add menu for mission group  
			local missionName = MENU_GROUP:New(adminGroup, missionList.missionName, adminMenu)
			-- add menus for each mission file in the group
			for j, missionMenu in ipairs(missionList.missionMenu) do
				self:T(missionMenu)
				-- add full path to mission file if defined
				local missionFile = MISSIONMENU.missionPath .. "\\" .. missionMenu.missionFile
				-- add command to load mission
				MENU_GROUP_COMMAND:New( adminGroup, missionMenu.menuText, missionName, MISSIONMENU.LoadMission, self, playername, missionFile )
				_msg = string.format(MISSIONMENU.traceTitle .. "Admin Menu Mission %s", missionFile)
				self:T(_msg)
			end
		end
	end
end

MISSIONMENU:Start()

--- END MISSIONMENU MENU SECTION