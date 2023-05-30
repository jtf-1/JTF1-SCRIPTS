-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- Dynamic Deck Population
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DYNDECK = {
    menu = {},
    templates = {},
}

DYNDECK.ship = {
    {
        name = "CVN-72 Lincoln", -- Name will be used for ship's menu entry
        id = 1137, -- unit ID in Mission Editor
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

                name = "sc_lch_low", 

                -- text that will appear in the template's menu entry

                menutext = "Launch low density", 

                -- whether a full deck clear should not be performed prior to applying the template. 
                -- True = do not clear deck (for partial templates). 
                -- False = clear deck first (for full templates)

                noClear = true, 

                -- flag to denote template is active. 
                -- True = active (do not re-apply the template if it seelcted from the menu). 
                -- False = template is not active.

                active = false
            }, 
            {
                group = "",
                name = "sc_lch_med", 
                menutext = "Launch medium density", 
                noClear = true, 
                active = false
            }, 
            {
                group = "",
                name = "sc_lch_hvy", 
                menutext = "Launch high density", 
                noClear = true, 
                active = false
            }, 
            {
                group = "",
                name = "sc_rec_low", 
                menutext = "Recovery low density", 
                noClear = true, 
                active = false
            }, 
            {
                group = "",
                name = "sc_rec_med", 
                menutext = "Recovery medium density", 
                noClear = true, 
                active = false
            }, 
            {
                group = "",
                name = "sc_rec_hvy", 
                menutext = "Recovery high density", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Cat",
                name = "sc_cat1l_f18", 
                menutext = "F18 Cat 1 Launch", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Cat",
                name = "sc_cat1r_f18", 
                menutext = "F18 Cat 1 Recovery", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Cat",
                name = "sc_cat2l_f18", 
                menutext = "F18 Cat 2 Launch", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Cat",
                name = "sc_cat2r_f18", 
                menutext = "F18 Cat 2 Recovery", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el1_f14", 
                menutext = "F14 EL1", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el2_f14", 
                menutext = "F14 EL2", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el3_f14", 
                menutext = "F14 EL3", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el4_f14", 
                menutext = "F14 EL4", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el1_f18", 
                menutext = "F18 EL1", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el2_f18", 
                menutext = "F18 EL2", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el3_f18", 
                menutext = "F18 EL3", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Elevators",
                name = "sc_el4_f18", 
                menutext = "F18 EL4", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Island",
                name = "sc_island", 
                menutext = "AC and Tech around Island", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Island",
                name = "sc_deckeq", 
                menutext = "Deck eqpt around Island", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Patio",
                name = "sc_patiol_f14", 
                menutext = "F14 on Patio Launch", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Patio",
                name = "sc_patior_f14", 
                menutext = "F14 on Patio Recovery", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Patio",
                name = "sc_patiol_f18", 
                menutext = "F18 on Patio Launch", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Patio",
                name = "sc_patior_f18", 
                menutext = "F18 on Patio Recovery", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Corral",
                name = "sc_corral", 
                menutext = "AC and Tech Corral", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Fantail",
                name = "sc_fantail_f14", 
                menutext = "F14 on Fantail", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Fantail",
                name = "sc_fantail_f18", 
                menutext = "F18 on Fantail", 
                noClear = true, 
                active = false
            },
            {
                group = "Other",
                name = "sc_wires", 
                menutext = "Techs along Wires", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Other",
                name = "sc_street", 
                menutext = "AC and techs on Street", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Other",
                name = "sc_bow", 
                menutext = "AC and techs on Bow", 
                noClear = true, 
                active = false
            }, 
            {
                group = "Other",
                name = "sc_point", 
                menutext = "AC and techs on Point", 
                noClear = true, 
                active = false
            }, 
        }
    },
}

-- Remove template objects from the ship
function DYNDECK:clearDeck(templateName, shipID, coalitionID, shipIndex, templateIndex)
    BASE:T("[DYNDECK] clearDeck called.")

    local staticFind = templateName or ("dyndeck_" .. shipID) -- search string for identifying objects to remove
    local statObj = coalition.getStaticObjects(coalitionID) -- table of all static objects for coalition
 
    -- step through table to find statics with the search string in thier name
    for i, static in pairs(statObj) do
        local staticName = static:getName()
        if string.match(staticName, ".*" .. staticFind .. ".*") then
            static:destroy() -- destroy found static
        end
    end
    
    if templateName then
        -- if a template name was passed to clearDeck change its active tag to false
        DYNDECK.ship[shipIndex].templates[templateIndex].active = false
    else
        -- if no template name was provided change the active tag for all the ship's templates to false 
        for j, template in ipairs(DYNDECK.ship[shipIndex].templates) do
            DYNDECK.ship[shipIndex].templates[j].active = false
        end
        -- set the ship's fullTemplateActive tag to false
        DYNDECK.ship[shipIndex].fullTemplateActive = false
    end

end

-- Apply the selected template to the ship
function DYNDECK:applyTemplate(templateName, shipID, coalitionID, noClear, shipIndex, templateIndex)
    BASE:T("[DYNDECK] applyTemplate called.")
 
    if DYNDECK[templateName] then -- check called template exists!
        -- only apply the template if it is *not* already active
 
        if not DYNDECK.ship[shipIndex].templates[templateIndex].active then
            BASE:T("[DYNDECK] Template not active.")
 
            if DYNDECK.ship[shipIndex].fullTemplateActive or (not noClear) then -- a full template is being, or has already been, applied
                BASE:T("[DYNDECK] Clear Deck.")
                -- clear deck before applying template
                DYNDECK:clearDeck(false, shipID, coalitionID, shipIndex)
            end
 
            BASE:T("[DYNDECK] Apply template: " .. templateName)
            -- call function for the template
            DYNDECK[templateName](shipID, templateName)
            -- mark the template as active
            DYNDECK.ship[shipIndex].templates[templateIndex].active = true
 
            if not noClear then 
                -- mark ship as having a full template applied
                DYNDECK.ship[shipIndex].fullTemplateActive = true
            end
        else
            BASE:T("[DYNDECK] TEMPLATE ALREADY ACTIVE!")
        end
 
    else -- if template does not exist
        _msg = "[DYNDECK] ERROR! REQUESTED SHIP TEMPLATE NOT FOUND: " .. templateName
        BASE:T(_msg)
        MESSAGE:New(_msg):ToAll()
    end
end

function DYNDECK:addMenu()

    BASE:T("[DYNDECK] Add template menus to mission.")
 
    -- add menu root
    DYNDECK.menu = MENU_MISSION:New("Dynamic Deck")

    -- add ship menus
     for shipIndex, menuship in ipairs(DYNDECK.ship) do
  
        -- add menu for ship
        DYNDECK.menu[menuship.id] = MENU_MISSION:New(menuship.name, DYNDECK.menu)
        -- add submenu for COMPLETE templates
        DYNDECK.menu[menuship.id].complete = MENU_MISSION:New("Complete Templates", DYNDECK.menu[menuship.id])
        -- add submenu for PARTIAL templates
        DYNDECK.menu[menuship.id].partial = MENU_MISSION:New("Partial Templates", DYNDECK.menu[menuship.id])
  
        
        -- add menu commands for full templates first
        for templateIndex, template in ipairs(menuship.templates) do
  
            if template.group == "" then -- this is a full template and should be placed in the ship's root menu
  
             end
  
        end

        -- add group submenus and add/remove commands for partial templates
        for templateIndex, template in ipairs(menuship.templates) do
 
            if template.group == "" then -- this is a complete template and should be placed in the Complete Templates submenu
                BASE:T("[DYNDECK] Add Full Template: " .. template.name)
  
                -- add command to ship root menu for full template 
                MENU_MISSION_COMMAND:New(template.menutext, DYNDECK.menu[menuship.id].complete, DYNDECK.applyTemplate, self, template.name, menuship.id, menuship.coalitionID, false, shipIndex ,templateIndex)

            else -- this is a partial template and should be placed in the Partial Templates submenu
                BASE:T("[DYNDECK] Add partial template.")

                -- add submenu for group if it doesn't already exist
                if not DYNDECK.menu[menuship.id].partial[template.group] then
                    BASE:T("[DYNDECK] Add Group submenu: " .. template.group)
 
                    DYNDECK.menu[menuship.id].partial[template.group] = MENU_MISSION:New(template.group, DYNDECK.menu[menuship.id].partial) -- add group submenu
                    DYNDECK.menu[menuship.id].partial[template.group].templates = {} -- container for grouped template submenus
 
                end
 
                if not DYNDECK.menu[menuship.id].partial[template.group].templates[template.name] then -- check template entry isn't a duplicate
                    BASE:T("[DYNDECK] Add template submenu: " .. template.name)

                    -- add a submenu for the group template
                    DYNDECK.menu[menuship.id].partial[template.group].templates[template.name] = MENU_MISSION:New(template.menutext, DYNDECK.menu[menuship.id].partial[template.group])

                    -- add a menu to apply the partial template
                    MENU_MISSION_COMMAND:New("Add",  DYNDECK.menu[menuship.id].partial[template.group].templates[template.name], DYNDECK.applyTemplate, self, template.name, menuship.id, menuship.coalitionID, true, shipIndex ,templateIndex)

                    -- add a menu to remove the partial template
                    MENU_MISSION_COMMAND:New("Remove", DYNDECK.menu[menuship.id].partial[template.group].templates[template.name], DYNDECK.clearDeck, self, template.name, menuship.id, menuship.coalitionID, shipIndex ,templateIndex)  

                else
                    BASE:T("[DYNDECK] ERROR! Menu has already been added for template: " .. template.name)
                end
 
            end
 
        end

        -- add menu to completely clear the ships deck of all statics
        MENU_MISSION_COMMAND:New("Clear Deck", DYNDECK.menu[menuship.id], DYNDECK.clearDeck, self, false, menuship.id, menuship.coalitionID, shipIndex)  
 
    end

end

DYNDECK:addMenu()


-- END Dynamic Deck Population
