env.info( "[JTF-1] supportaircraft_data" )
--------------------------------------------
--- Support Aircraft Defined in this file
--------------------------------------------
--
-- **NOTE**: SUPPORTAIRCRAFT.LUA MUST BE LOADED BEFORE THIS FILE IS LOADED!
--
-- This file contains the config data specific to the miz in which it will be used.
-- All functions and key values are in SUPPORTAIRCRAFT.LUA, which should be loaded first
--
-- Load order in miz MUST be;
--     1. supportaircraft.lua
--     2. supportaircraft_data.lua
--

-- Error prevention. Create empty container if SUPPORTAIRCRAFT.LUA is not loaded or has failed.
if not SUPPORTAC then 
	_msg = "[JTF-1 SUPPORTAC] CORE FILE NOT LOADED!"
	BASE:E(_msg)
	SUPPORTAC = {}
end

SUPPORTAC.useSRS = true

-- Support aircraft missions. Each mission block defines a support aircraft mission. Each block is processed
-- and an aircraft will be spawned for the mission. When the mission is cancelled, eg after RTB or if it is destroyed,
-- a new aircraft will be spawned and a fresh AUFTRAG created.
--
-- See SUPPORTAC.missionDefault in supportaircraft.lua for all mission options.
--
SUPPORTAC.mission = {
	-- {
	-- 	name = "ARWK", -- text name for this support mission. Combined with this block's index and the mission type to define the group name on F10 map
	-- 	category = SUPPORTAC.category.tanker, -- support mission category. Used to determine the auftrag type. Options are listed in SUPPORTAC.category
	-- 	type = SUPPORTAC.type.tankerBoom, -- type defines the spawn template that will be used
	-- 	zone = "ARWK", -- ME zone that defines the start waypoint for the spawned aircraft
	-- 	callsign = CALLSIGN.Tanker.Arco, -- callsign under which the aircraft will operate
	-- 	callsignNumber = 1, -- primary callsign number that will be used for the aircraft
	-- 	tacan = 35, -- TACAN channel the ac will use
	-- 	tacanid = "ARC", -- TACAN ID the ac will use. Also used for the morse ID
	-- 	radio = 276.5, -- freq the ac will use when on mission
	-- 	flightLevel = 160, -- flight level at which to spwqan aircraft and at which track will be flown
	-- 	speed = 315, -- IAS when on mission
	-- 	heading = 94, -- mission outbound leg in degrees
	-- 	leg = 40, -- mission leg length in NM
	-- 	fuelLowThreshold = 30, -- lowest fuel threshold at which RTB is triggered
	-- 	activateDelay = 5, -- delay, after this aircraft has been despawned, before new aircraft is spawned
	-- 	despawnDelay = 10, -- delay before this aircraft is despawned
	--  coalition = coalition.side.BLUE -- coalition to which spawn group should be set. Default 
	-- },
}

-- call the function that initialises the SUPPORTAC module
if SUPPORTAC.Start ~= nil then
  _msg = "[JTF-1 SUPPORTAC] SUPPORTAIRCRAFT_DATA - call SUPPORTAC:Start()."
  BASE:I(_msg)
  SUPPORTAC:Start()
end


