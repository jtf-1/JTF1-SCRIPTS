env.info( "[JTF-1] missiongcicap" )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- MISSION AUTO CAP
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- Automated Redfor GCI driven CAP
--
-- Two files are required for this module;
--     missiongcicap.lua
--     missiongcicap_data.lua
--
-- 1. missiongcicap.lua
-- Contains functions, key values and GLOBAL settings.
--
-- 2. missiongcicap_data.lua
-- Contains settings that are specific to the miz.
--
-- Load order in miz MUST be;
--     1. missiongcicap.lua
--     2. missiongcicap_data.lua
--

MISSIONGCICAP = MISSIONGCICAP or {}

MISSIONGCICAP = BASE:Inherit(MISSIONGCICAP, BASE:New())
MISSIONGCICAP.ClassName = "MISSIONGCICAP"
MISSIONGCICAP.traceTitle = MISSIONGCICAP.ClassName .. " "
MISSIONGCICAP.version = "0.1"

-- Default values for CAP settings
MISSIONGCICAP.default = {
    coalition = "red",
	country = 0, -- RUSSIA
    spawnAlias = "MEGC_",
    resurrection = 900,
    capSpeed = 350,
    capAlt = 25000,
    capDirection = 90,
    capLeg = 20,
    capGrouping = 2,
    missionRange = 100,
    engageRange = 50,
    numberAlter5Standby = 2,
    maxAliveMissions = 8,
    repeatOnFailure = 3,
    tankerAndAWACSInvisible = true,
    debug = false,
    Monitor = false,
    traceOn = false,
    traceLevel = 1,
}

MISSIONGCICAP.airbase = {
    Afghanistan = {
        ["Shindand"] = "Shindand",
        ["Nimroz"] = "Nimroz",
        ["Chaghcharan"] = "Chaghcharan",
    },
}


MISSIONGCICAP.opsWings = {} -- container for master wings


function MISSIONGCICAP:Start()

    -- set trace for MISSIONGCICAP
    local traceOn = self.debug.traceOn or self.default.traceOn
    if traceOn then
        local traceLevel  = self.debug.traceLevel or self.default.traceLevel
        self:TraceOnOff(true)
        self:TraceClass(self.ClassName)
        for _key, class in pairs(self.debug.classes) do
            self:TraceClass(class)
        end
        --self:TraceLevel(traceLevel)
    end
    

    for _key, addWing in pairs(self.wings) do
            
        -- define wing properties
        local wingAlias = addWing.alias
        local airBaseName = addWing.airBaseName
        local capSpeed = addWing.capSpeed or self.default.capSpeed
        local capAlt = addWing.capAlt or self.default.capAlt
        local capDirection = addWing.capDirection or self.default.capDirection
        local capLeg = addWing.capLeg or self.default.capLeg
        local capGrouping = addWing.capGrouping or self.default.capGrouping
        local missionRange = addWing.missionRange or self.default.missionRange
        local engageRange = addWing.engageRange or self.default.engageRange
        local numberAlter5Standby = addWing.numberAlter5Standby or self.default.numberAlter5Standby
        local maxAliveMissions = addWing.maxAliveMissions or self.default.maxAliveMissions
        local repeatOnFailure = addWing.repeatOnFailure or self.default.repeatOnFailure
        local tankerAndAWACSInvisible = addWing.tankerAndAWACSInvisible or self.default.tankerAndAWACSInvisible
        local coalition = addWing.coalition
        local ewrPrefix = addWing.ewrPrefix

        self.opsWings[wingAlias] = EASYGCICAP:New(wingAlias, airBaseName, coalition, ewrPrefix)

        -- set debug options for this EASYGCICAP MASTER WING
        self.opsWings[wingAlias].debug = addWing.debug or self.default.debug
        self.opsWings[wingAlias].Monitor = addWing.Monitor or self.default.Monitor

        -- -- set defaults
        self.opsWings[wingAlias]:SetMaxAliveMissions(maxAliveMissions)
            :SetDefaultEngageRange(engageRange)
            --:SetDefaultCAPSpeed(capSpeed)
            --:SetDefaultCAPAlt(capAlt)
            --:SetDefaultCAPDirection(capDirection)
            --:SetDefaultCAPLeg(capLeg)
            --:SetDefaultCAPGrouping(capGrouping)
            --:SetDefaultMissionRange(missionRange)
            --:SetDefaultNumberAlter5Standby(numberAlter5Standby)
            --
            --:SetDefaultRepeatOnFailure(repeatOnFailure)
            --:SetTankerAndAWACSInvisible(tankerAndAWACSInvisible)
    
        -- add sub-wings
        for key, subwing in pairs(addWing.subwings) do
            local airbaseName = subwing.airBaseName
            local subWingAlias = subwing.alias
            self.opsWings[wingAlias]:AddAirwing(airbaseName, subWingAlias)
        end

        -- add squadrons
        for _index, addSquadron in pairs(addWing.squadrons) do --AddSquadron(templateName, squadName, airbaseName, airframes, skill, modex, livery)
            local templateExists = false -- flag for template found. Defaults to false (not found)
            local templateName = addSquadron.TemplateName
            local templateGroup = GROUP:FindByName(templateName)

            if templateGroup then
                _msg = string.format("%sSpawn Template %s found in mission.",
                    self.traceTitle,
                    templateName
                )
    			self:T(_msg)
                templateExists = true
            else
                if SPAWNTEMPLATES then
                    local spawnTemplate = SPAWNTEMPLATES.templates[templateName]
                    if spawnTemplate ~= nil then
                        _msg = string.format("%sCAP Template Group %s not found in mission, adding template group from SPAWNTEMPLATES.",
                            self.traceTitle,
                            templateName
                        )
                        self:T(_msg)
                        -- add template group to mission
                        local spawnCategory =  spawnTemplate.category
                        local spawnAlias = self.default.spawnAlias
                        local spawnCountryid = self.default.country
                        local spawnCoalition = self.default.coalition -- coalition.side.RED
                        local spawn = SPAWN:NewFromTemplate(spawnTemplate, templateName, nil, true)
                            :InitCountry(spawnCountryid)
                            :InitCoalition(spawnCoalition)
                            :InitCategory(spawnCategory)
                            :InitLateActivated()

                        spawn:Spawn()

                        templateExists = true
                    else
                        _msg = string.format("%sCAP Template Group %s not found in mission or in SPAWNTEMPLATES module!",
                            self.traceTitle,
                            templateName
                        )
                        self:E(_msg)
                    end
                else
                    _msg = string.format("%sCAP Template Group %s not found in mission, and SPAWNTEMPLATES module not loaded!",
                        self.traceTitle,
                        templateName
                    )
                    self:E(_msg)
                end
            end

            if templateExists then
                local type = addSquadron.type
                local squadName = addSquadron.SquadName
                local airbaseName = addSquadron.AirbaseName
                local airframes = addSquadron.Airframes
                local skill = addSquadron.Skill 
                local modex = addSquadron.Modex
                local livery = addSquadron.Livery
                
                if type == "cap" then
                    -- AddSquadron(templateName, squadName, AirbaseName, AirFrames, skill, modex, livery)
                    self.opsWings[wingAlias]:AddSquadron(templateName, squadName, airbaseName, airframes, skill, modex, livery)
                else
                    local frequency = addSquadron.Frequency
                    local modulation = addSquadron.Modulation
                    if type == "awacs" then
                        --AddAWACSSquadron(templateName, squadName, AirbaseName, AirFrames, skill, modex, livery, frequency, modulation)
                        self.opsWings[wingAlias]:AddAWACSSquadron(templateName, squadName, airbaseName, airframes, skill, modex, livery)
                    elseif type == "tkr" then
                        local tacan = addSquadron.TACAN                    
                        -- AddTankerSquadron(templateName, squadName, AirbaseName, AirFrames, skill, modex, livery, frequency, modulation, tacan)
                        self.opsWings[wingAlias]:AddTankerSquadron(templateName, squadName, airbaseName, airframes, skill, modex, livery)
                    else
                        _msg = string.format("%sSquadron TYPE %s not recognised!",
                            self.traceTitle,
                            type
                        )
                        self:E(_msg)
                    end
                end
            end
        end
        
        -- add cap patrol points
        for _index, patrolPoint in pairs(addWing.patrolPoints) do
            local type = patrolPoint.type
            local airbaseName = patrolPoint.AirbaseName
            local zoneName = patrolPoint.zoneName
            local patrolPointZone = ZONE:FindByName(zoneName)

            if patrolPointZone then
                local Coordinate = patrolPointZone:GetCoordinate()
                local Altitude = patrolPoint.Altitude or math.random(15,25)*1000
                local Speed = patrolPoint.Speed
                local Heading = patrolPoint.Heading
                local LegLength = patrolPoint.LegLength

                if self.opsWings[wingAlias].debug then
                    _msg = self.traceTitle .. wingAlias .. " |\n"
                    .. "Adding ".. type .. " Patrol Point:\n"
                    .. "Name = " ..  zoneName .. "\n"
                    .. "Alt = " .. Altitude .. "\n"
                    .. "Speed = " .. Speed .. "\n"
                    .. "Heading = " .. Heading .. "\n"
                    .. "Leg = " .. LegLength
                    self:I(_msg)
                end

                if type == "cap" then
                    self.opsWings[wingAlias]:AddPatrolPointCAP(airbaseName, Coordinate, Altitude, Speed, Heading, LegLength)
                elseif type == "tkr" then
                    self.opsWings[wingAlias]:AddPatrolPointTanker(airbaseName, Coordinate, Altitude, Speed, Heading, LegLength)
                elseif type == "awacs" then
                    self.opsWings[wingAlias]:AddPatrolPointAwacs(airbaseName, Coordinate, Altitude, Speed, Heading, LegLength)
                else
                    _msg = string.format("%sPatrol Point TYPE %s not recognised!",
                        self.traceTitle,
                        type
                    )
                    self:E(_msg)

                end
            else
                _msg = string.format("%sPatrol Point Zone %s not found!",
                        self.traceTitle,
                        zoneName
                    )
                self:E(_msg)
            end
        
        end
        
        -- add tanker squadrons

        -- add accept zones
        for _index, acceptZoneName in ipairs(addWing.acceptZones) do
            local acceptZone = ZONE:FindByName(acceptZoneName)
            if acceptZone then
                self.opsWings[wingAlias]:AddAcceptZone(acceptZone)
            else
                _msg = string.format("%sAccept Zone %s not found!",
                        self.traceTitle,
                        acceptZoneName
                    )
                self:E(_msg)
            end
        end

        -- add reject zones
        for _index, rejectZoneName in ipairs(addWing.rejectZones) do
            local rejectZone = ZONE:FindByName(rejectZoneName)
            if rejectZone then
                self.opsWings[wingAlias]:AddRejectZone(rejectZone)
            else
                _msg = string.format("%sReject Zone %s not found!",
                        self.traceTitle,
                        rejectZoneName
                    )
                self:E(_msg)
            end
        end

    end

end

