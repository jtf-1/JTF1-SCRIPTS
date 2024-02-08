env.info( "[JTF-1] missionatis.lua" )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN ATIS SECTION
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- NELLIS 270.100
-- CREECH 290.450
-- GROOM LAKE 123.500
-- TONOPAH TEST RANGE 113.000
MISSIONATIS = {}

-- inherit methods,  properties etc from BASE for event handler, trace etc
MISSIONATIS = BASE:Inherit( MISSIONATIS, BASE:New() )

MISSIONATIS.ClassName = "MISSIONATIS"
MISSIONATIS.version = "0.1"
MISSIONATIS.traceTitle = "[JTF-1]"

-- container for airfield ATIS
MISSIONATIS.atis = {}

-- default settings. Can be overwritten by values in missionatis_data.lua
MISSIONATIS.default = {
    srsPath = "C:/Program Files/DCS-SimpleRadio-Standalone",
    srsPort = 5002,
    sex = "male",
    nationality = "en-US",
    transmitOnlyWithPlayers = false,
    transmitInterval = 60
}


function MISSIONATIS:Start()

    _msg = string.format("%s Starting MISSIONATIS version %s", 
        self.traceTitle,
        self.version
    )
    self:T(_msg)

    -- setup SRS
    -- initialise SRS in standalone
    self.srsPath = self.srsPath or self.default.srsPath
    self.srsPort = self.srsPort or self.default.srsPort
    if JTF1.useSRS then
        -- MISSIONSRS module is active so override the intialisation
        self.srsPath = JTF1.srsPath
        self.srsPort = JTF1.srsPort
    end

    _msg = string.format("%s SRS Config:\nPath: %s\nPort: %d\n",
        MISSIONATIS.traceTitle,
        MISSIONATIS.srsPath, 
        MISSIONATIS.srsPort
    )
    self:I(_msg)

    -- set if ATIS should transmit only when players are present
    self.transmitOnlyWithPlayers = self.transmitOnlyWithPlayers or self.default.transmitOnlyWithPlayers
    -- set default transmit interval
    self.transmitInterval = self.transmitInterval or self.default.transmitInterval

    -- add ATIS for each airfield defined in MISSIONATIS.airfields
    for index, airfield in ipairs(self.airfields) do
        self:AddAtis(airfield)
    end

end

-- add ATIS for the airfield
function MISSIONATIS:AddAtis(airfield)

    _msg = string.format("%s adding ATIS for airfield: %s.", 
        self.traceTitle, 
        airfield.name
    )
    self:T(_msg)

    local atisSrsPath = self.srsPath
    local atisSrsPort = self.srsPort
    local atisSex = airfield.sex or self.default.sex
    local atisNationality = airfield.nationality or self.default.nationality
    local transmitInterval = airfield.transmitInterval or self.transmitInterval

    -- create new ATIS object for airfield
    self.atis[airfield.name] = ATIS:New(airfield.name, airfield.frequency, airfield.modulation)

    -- add SRS to airfield
    self.atis[airfield.name]:SetSRS(atisSrsPath,atisSex,atisNationality,nil,atisSrsPort)

    -- set interval between ATIS transmissions
    self.atis[airfield.name]:SetQueueUpdateTime(transmitInterval)
    
    -- set takeoff runway
    if airfield.activeRunwayTakeoff then
        local activeRunwayTakeoffPreferLeft = airfield.activeRunwayLandingPreferleft or nil
        self.atis[airfield.name]:SetActiveRunwayTakeoff(airfield.activeRunwayTakeoff, activeRunwayTakeoffPreferLeft)
    end
    
    -- set landing runway
    if airfield.activeRunwayLanding then
        local activeRunwayLandingPreferLeft = airfield.activeRunwayLandingPreferLeft or nil
        self.atis[airfield.name]:SetActiveRunwayLanding(airfield.activeRunwayLanding, activeRunwayLandingPreferLeft)
    end
    
    -- set ILS
    if airfield.ILS then
        local ILSName = airfield.ILSName or nil
        self.atis[airfield.name]:AddILS(airfield.ILSFreq, ILSName)
    end
    
    -- set TACAN
    if airfield.TACAN then
        self.atis[airfield.name]:SetTACAN(airfield.TACAN)
    end
    
    -- set tower freq(s)
    self.atis[airfield.name]:SetTowerFrequencies(airfield.towerFrequencies)
    
    -- report in metric units
    if airfield.metricUnits then
        self.atis[airfield.name]:SetMetricUnits()
    end

    -- report pressure mB
    if airfield.reportmBar then
        self.atis[airfield.name]:SetReportmBar()
    end
    
    -- set additional information
    if airfield.additionalInformation then
        self.atis[airfield.name]:SetAdditionalInformation(airfield.additionalInformation)
    end
    
    -- set whether to only transmit when players are present
    self.atis[airfield.name]:SetTransmitOnlyWithPlayers(self.transmitOnlyWithPlayers)
    
    -- start the airfield ATIS
    self.atis[airfield.name]:Start()

end
