env.info( "[JTF-1] bfmacm_data" )
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- ACM/BFM
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- This file MUST be loaded AFTER missiletrainer.lua
--
-- These values are specific to the miz and will override the default values in missiletrainer.lua
--

-- Error prevention. Create empty container if module core lua not loaded.
if not BFMACM then 
	_msg = "[JTF-1 BFMACM] CORE FILE NOT LOADED!"
	BASE:E(_msg)
	BFMACM = {}
end

BFMACM.zoneBfmAcmName = "COYOTEABC" -- The BFM/ACM Zone
BFMACM.zonesNoSpawnName = { -- zones inside BFM/ACM zone within which adversaries may NOT be spawned.
	"zone_box",
} 

if BFMACM.Start then
	BFMACM:Start()
end