env.info( "[JTF-1] devcheck" )
--- Check for Static or Dynamic mission file loading flag
-- mission flag for setting dev mode
local devFlag = 8888

-- If missionflag is true, mission file will load from filesystem with an assert
local devState = trigger.misc.getUserFlag(devFlag)

if devState == 1 and JTF1.trace then
	
	local msgLog = "[JTF-1 DEVCHECK] "
	local msgText = ""

	if devState == 1 then
		msgText = "Dynamic Loading is ON!"
	end

	if JTF1.trace then
		msgText = msgText .. " TRACE is ON!"
		-- trace all events
		BASE:TraceOnOff(true)
		BASE:TraceAll(true)
	end

	_msg = msgLog .. msgText
	BASE:E(_msg)
	MESSAGE:New(msgText):ToAll()

	DEV_MENU = {
		traceOn = true, -- default tracestate false == trace off, true == trace on.
		flagLoadMission = (JTF1.flagLoadMission and JTF1.flagLoadMission or 9999), -- flag for load misison trigger
		missionRestartMsg = (JTF1.missionRestartMsg and JTF1.missionRestartMsg or "ADMIN9999"), -- Message to trigger mission restart via jtf1-hooks
	}
	
	function DEV_MENU:toggleTrace()
		if BASE:IsTrace() then
		BASE:TraceOff()
		else
		BASE:TraceOn()
		end
		_msg = string.format("[JTF-1 DEVCHECK] Trace toggled", tostring(BASE:IsTrace()))
		BASE:E(_msg)
	end

	-- function DEV_MENU:testLua() --check encoding
	--   local base = _G
	--   local f = assert( base.loadfile( 'E:/GitHub/FUN-MAP_NTTR/scripts/dynamic/test.lua' ) )
	--   if f == nil then
	--     error ("Mission Loader: could not load test.lua." )
		--   else
	--     env.info( "[JTF-1] Mission Loader: test.lua dynamically loaded." )
	--     --return f()
	--   end
	-- end

	function DEV_MENU:restartMission()
		trigger.action.setUserFlag(ADMIN.flagLoadMission, 99)
	end

	-- Add Dev submenu to F10 Other
	if JTF1.menu.root then
		DEV_MENU.topmenu = MENU_MISSION:New("DEVMENU", JTF1.menu.root)
	else
		DEV_MENU.topmenu = MENU_MISSION:New("DEVMENU")
	end
	MENU_MISSION_COMMAND:New("Toggle TRACE.", DEV_MENU.topmenu, DEV_MENU.toggleTrace)
	--MENU_MISSION_COMMAND:New("Reload Test LUA.", DEV_MENU.topmenu, DEV_MENU.testLua)
	MENU_MISSION_COMMAND:New("Restart Mission", DEV_MENU.topmenu, DEV_MENU.restartMission)

	if DEV_MENU.traceOn then
		BASE:TraceOn()
	end  

else
	local _msg = "[JTF-1] DEV flag is OFF."
	BASE:I(_msg)
end

--- END DEVCHECK