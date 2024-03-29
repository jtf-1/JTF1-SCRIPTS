env.info( "[JTF-1] dynamic_deck_templates" )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Dynamic Deck Templates
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- NOTE: dynamic_deck_population.lua should be loaded AFTER this file.
--
-- Load order in miz MUST be;
--     1. dynamic_deck_data.lua
--     2. dynamic_deck.lua
--
--     dynamic_deck_templates.lua can be loaded either before or after these files

local _msg

if not DYNDECK then -- Error prevention. Create empty container if DDP module not loaded.
    _msg = "[JTF-1 DYNDECK] CORE FILE NOT LOADED!"
    DYNDECK = {}
elseif not DYNDECK.sc_ then
    _msg = "[JTF-1 DYNDECK] TEMPLATE FILE NOT LOADED!"
    BASE:E(_msg)
end

if _msg then
    SUPPORTAC:E(_msg)
end

DYNDECK.ship = {
    {
        name = "CVN-72 Lincoln", -- Name will be used for ship's menu entry
        id = 20122, -- unit ID in Mission Editor
        coalitionID = 2, -- 1, red, 2 blue
        fullTemplateActive = false, -- flag to denote a full deck template is active
        templates = {
            {
                -- Submenu group under which template should appear. 
                -- "" assumes full template. 
                -- If a name is present, partial template assumed. 
                -- Value will be used as the text for group in the submenu.
                -- Templates with same group name will appear in same group submenu

                group = "", 

                -- name of template as it appears in the name of the function containing the template

                name = "sc_flex4c234", 

                -- text that will appear in the template's menu entry

                menutext = "Launch and Recovery medium density", 

                -- whether a full deck clear should not be performed prior to applying the template. 
                -- True = do not clear deck (for partial templates). 
                -- False = clear deck first (for full templates)

                noClear = false, 

                -- flag to denote template is active. 
                -- True = active (do not re-apply the template if it seelcted from the menu). 
                -- False = template is not active.

                active = false 
            },
        },
    },
}

if DYNDECK.Start then
    DYNDECK:Start()
end
