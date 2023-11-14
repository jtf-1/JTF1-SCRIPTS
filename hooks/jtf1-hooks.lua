-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN JTF-1 HOOKS
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

net.log("[JTF-1] Hooks v0.1")

local jtf1hooks = {}
jtf1hooks.currentMission = ""
jtf1hooks.missionRestart = "MISSION_RESTART"
jtf1hooks.missionLoad = "MISSION_LOAD"

function jtf1hooks.onMissionLoadBegin()

    jtf1hooks.currentMission = DCS.getMissionFilename()
    net.log("[JTF-1] Mission filename = " .. tostring(jtf1hooks.currentMission))

end

function jtf1hooks.onTriggerMessage(message) --"ADMIN9999"

    if message == jtf1hooks.missionRestart then

        net.log("[JTF-1] Restart Current Mission")
        net.load_mission(jtf1hooks.currentMission)

    elseif string.find(message, jtf1hooks.missionLoad) then

        local l = string.len(message)
        local i ,j = string.find(message, jtf1hooks.missionLoad)
        local missionFile = string.sub(message, j+2, l)
        local _msg = "[JTF-1] Load New Mission; " .. missionFile
        net.log (_msg)
        net.load_mission(missionFile)

    end
end

DCS.setUserCallbacks(jtf1hooks)
net.log("[JTF-1] Hooks active.")