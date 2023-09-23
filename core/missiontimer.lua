env.info( "[JTF-1] missiontimer.lua" )

--- Mission Timer
--
-- Add schedules to display messages at set intervals prior to restarting the base mission.
-- ME switched triggers should be set to a FLAG EQUALS condition for the flag flagLoadMission
-- value (defined in script header). Sending missionRestart text will trigger restarting the
-- current mission via jtf1-hooks.lua.
--
MISSIONTIMER = {}
-- debug messages title
MISSIONTIMER.traceTitle = "[JTF-1 MISSIONTIMER] "
 -- schedule container
MISSIONTIMER.msgWarning = {}
-- DEFAULT settings. WIll be oiverwritten by values defined in _data file.
MISSIONTIMER.missionRestart = ( JTF1.missionRestart and JTF1.missionRestart or "ADMIN9999" ) -- Message to trigger mission restart via jtf1-hooks
MISSIONTIMER.durationHrs = 24 -- Mission run time in HOURS
MISSIONTIMER.msgSchedule = {60, 30, 10, 5} -- Schedule for mission restart warning messages. Time in minutes.
MISSIONTIMER.restartDelay =  10 -- time in minutes to delay restart if active clients are present.
MISSIONTIMER.useSRS = true -- default flag to determine if htis module should send messages through SRS.

local useSRS
local _msg

-- function to start the mission timer
function MISSIONTIMER:Start()
	self.useSRS = (JTF1.useSRS and self.useSRS) and MISSIONSRS.Radio.active -- default to not using SRS unless both the server AND the module request it AND MISSIONSRS.Radio.active is true
	BASE:I({"[JTF-1 MISSIONTIMER] useSRS", self.useSRS})
	self.durationSecs = self.durationHrs * 3600 -- Mission run time in seconds
	BASE:T({"[JTF-1 MISSIONTIMER] settings",{self}})
	self:AddSchedules()
end

--- function to add scheduled messages for mission restart warnings and restart at end of mission duration
function MISSIONTIMER:AddSchedules()
	if self.msgSchedule ~= nil then
		BASE:I({"[JTF-1 MISSIONTIMER] Schedule", self.msgSchedule})
		for i, msgTime in ipairs(self.msgSchedule) do
		self.msgWarning[i] = SCHEDULER:New( nil, 
			function()
			_msg = string.format("[JTF-1 MISSIONTIMER] TIMER WARNING CALLED at %d minutes remaining.", msgTime)
			BASE:T(_msg)
			_msg = string.format("All players, mission is scheduled to restart in %d minutes!", msgTime)
			if self.useSRS then -- if MISSIONSRS radio object has been created, send message via default broadcast.
				MISSIONSRS:SendRadio(_msg)
			else -- otherwise, send in-game text message
				MESSAGE:New(_msg):ToAll()
			end
			end,
		{msgTime}, self.durationSecs - (msgTime * 60))
		end
	end
	self.msgWarning["restart"] = SCHEDULER:New( nil,
		function()
			MISSIONTIMER:Restart()
		end,
		{ }, self.durationSecs
	)
end

-- function to restart the mission after the end of the scheduled duration
-- restart will be delayed until all pplayers have left the mission
function MISSIONTIMER:Restart()
	if not self.clientList then
		self.clientList = SET_CLIENT:New()
		self.clientList:FilterActive()
		self.clientList:FilterStart()
	end
	if self.clientList:CountAlive() > 0 then
		local delayTime = self.restartDelay
		local msg  = "All players, mission will restart when no active clients are present. Next check will be in " .. tostring(delayTime) .." minutes." 
		if self.useSRS then -- if MISSIONSRS radio object has been created, send message via default broadcast.
			MISSIONSRS:SendRadio(msg)
		else -- otherwise, send in-game text message
			MESSAGE:New(msg):ToAll()
		end
		self.msgWarning["restart"] = SCHEDULER:New( nil,
			function()
				MISSIONTIMER:Restart()
			end,
			{ }, (self.restartDelay * 60)
		)
	else
		BASE:I("[JTF-1 MISSIONTIMER] RESTART MISSION")
		MESSAGE:New(self.missionRestart):ToAll()
	end
end

--- END MISSION TIMER