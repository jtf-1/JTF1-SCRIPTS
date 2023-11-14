env.info( "[JTF-1] activeranges_data" )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- ACTIVE RANGES SETTINGS FOR MIZ
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- This file MUST be loaded AFTER activeranges.lua
--
-- These values are specific to the miz and will override the default values in ACTIVERANGES.default
--

-- Error prevention. Create empty container if module core lua not loaded.
if not ACTIVERANGES then 
	_msg = "[JTF-1 ACTIVERANGES] CORE FILE NOT LOADED!"
	BASE:E(_msg)
	ACTIVERANGES = {}
end


ACTIVERANGES.activeatstart = false -- if true, spawn targets with AI inactive
ACTIVERANGES.useSRS = true -- set to false to disable use of SRS for this module in this miz
--ACTIVERANGES.rangeRadio = "377.8" -- radio frequency over which to broadcast Active Range messages


-- start the mission timer
if ACTIVERANGES.Start then
	ACTIVERANGES:Start()
end