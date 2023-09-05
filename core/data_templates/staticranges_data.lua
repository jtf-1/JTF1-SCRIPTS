env.info( "[JTF-1] staticranges_data" )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- STATIC RANGES SETTINGS FOR MIZ
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- This file MUST be loaded AFTER staticranges.lua
--
-- These values are specific to the miz and will override the default values in STATICRANGES.default
--

-- Error prevention. Create empty container if module core lua not loaded.
if not STATICRANGES then 
	_msg = "[JTF-1 STATICRANGES] CORE FILE NOT LOADED!"
	BASE:E(_msg)
	STATICRANGES = {}
end

-- These values will overrides the default values in staticranges.lua
STATICRANGES.strafeMaxAlt             = 1530 -- [5000ft] in metres. Height of strafe box.
STATICRANGES.strafeBoxLength          = 3000 -- [10000ft] in metres. Length of strafe box.
STATICRANGES.strafeBoxWidth           = 300 -- [1000ft] in metres. Width of Strafe pit box (from 1st listed lane).
STATICRANGES.strafeFoullineDistance   = 610 -- [2000ft] in metres. Min distance for from target for rounds to be counted.
STATICRANGES.strafeGoodPass           = 20 -- Min hits for a good pass.

-- Range targets table
STATICRANGES.Ranges = {
    -- { -- SAMPLE RANGE DATA
    --   rangeId               = "R63", -- unique ID for the range
    --   rangeName             = "Range 63", -- text used for messages
    --   rangeZone             = "R63", -- zone object in which range objects are placed
    --   rangeControlFrequency = 361.6, -- TAC radio frequency for the range
    --   groups = { -- group objects used as bombing targets
    --     "63-01", "63-02", "63-03", "63-05", 
    --     "63-10", "63-12", "63-15", "R-63B Class A Range-01", 
    --     "R-63B Class A Range-02",    
    --   },
    --   units = { -- unit objects used as bombing targets
    --     "R63BWC", "R63BEC",
    --   },
    --   strafepits = { -- unit objects used as strafepits 
    --     { --West strafepit -- use sub groups for multiple strafepits
    --       "R63B Strafe Lane L2", 
    --       "R63B Strafe Lane L1", 
    --       "R63B Strafe Lane L3",
    --     },
    --     { --East strafepit 
    --       "R63B Strafe Lane R2", 
    --       "R63B Strafe Lane R1", 
    --       "R63B Strafe Lane R3",
    --     },
    --   },
    -- },
}
  
-- Start the STATICRANGES module
if STATICRANGES.Start then
	STATICRANGES:Start()
end