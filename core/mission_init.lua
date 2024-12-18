env.info( "*** [JTF-1] MISSION SCRIPTS START ***" )
---- remove default MOOSE player menu
_SETTINGS:SetPlayerMenuOff()

--- debug on/off
BASE:TraceOnOff(false)

JTF1 = {
	traceTitle = "[JTF-1 MISSIONINIT] ",
	trace = false,
	missionRestart = "MISSION_RESTART", -- Message to trigger mission restart via jtf1-hooks
	flagLoadMission = 9999, -- flag for load misison trigger
	defaultServerConfigFile = "LocalServerSettings.lua", -- srs server settings file name
	menu = {},
}

function JTF1:Start()
	if not lfs then
		_msg = JTF1.traceTitle .. "WARNING: lfs not desanitized. Loading will look into your DCS installation root directory rather than the \"Saved Games\\DCS\" folder."
		BASE:E(_msg)
	else

		-- load local server settings file
		local settingsFolder = lfs.writedir() .. "Missions\\"
		local settingsFile = settingsFolder .. JTF1.defaultServerConfigFile

		if UTILS.CheckFileExists(settingsFolder, JTF1.defaultServerConfigFile) then
			_msg = string.format("%sServer Settings File = %s", JTF1.traceTitle, settingsFile) 
			BASE:I(_msg)
			local msgServerSettings = ""
			dofile(settingsFile)
			for _name, _value in pairs(LOCALSERVER) do
				JTF1[_name] = _value
				msgServerSettings = msgServerSettings .. _name .. " = " .. tostring(_value) .. "\n"
			end
			_msg = string.format("%sServer Settings follow;\n\n%s\n",
				JTF1.traceTitle,
				msgServerSettings
			)
			BASE:I(_msg)
		else
			_msg = JTF1.traceTitle .. "Error! Server config file not found. Using mission defaults"
			BASE:E(_msg)
		end

	end

	-- add root menu for JTF-1 if activated in data file
	if JTF1.jtfmenu then
		JTF1.menu.root = MENU_MISSION:New("JTF-1")
	end

end


--- END INIT