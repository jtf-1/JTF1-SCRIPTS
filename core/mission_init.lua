env.info( "*** [JTF-1] MISSION SCRIPTS START ***" )
---- remove default MOOSE player menu
_SETTINGS:SetPlayerMenuOff()

--- debug on/off
BASE:TraceOnOff(false)

JTF1 = {
	traceTitle = "[JTF-1 MISSIONINIT] ",
	missionRestart = "ADMIN9999", -- Message to trigger mission restart via jtf1-hooks
	flagLoadMission = 9999, -- flag for load misison trigger
	defaultServerConfigFile = "LocalServerSettings.lua", -- srs server settings file name
	menu = {},
}

function JTF1:Start()
	if not lfs then
		BASE:E( "[JTF-1] WARNING: lfs not desanitized. Loading will look into your DCS installation root directory rather than the \"Saved Games\\DCS\" folder.")
	else

		-- load local server settings file
		local settingsFile = lfs.writedir() .. JTF1.defaultServerConfigFile

		if UTILS.CheckFileExists(lfs.writedir(), JTF1.defaultServerConfigFile) then
			BASE:I( "[JTF-1] Mission INIT settingsFile = " .. settingsFile )
			dofile(settingsFile)
			for _name, _value in pairs(LOCALSERVER) do
				JTF1[_name] = _value
			end
			BASE:I("[JTF-1] Local server settings to follow...")
			BASE:I(JTF1)
		else
			BASE:E("[JTF-1] Error! Server config file not found. Using mission defaults")
		end

	end

	-- add root menu for JTF-1 if activated in data file
	if JTF1.jtfmenu then
		JTF1.menu.root = MENU_MISSION:New("JTF-1")
	end

end


--- END INIT