
MISSIONAUTOCAP = {}

MISSIONAUTOCAP = BASE:Inherit(MISSIONAUTOCAP, BASE:New())
MISSIONAUTOCAP.ClassName = "MISSIONAUTOCAP"
MISSIONAUTOCAP.traceTitle = "[JTF-1] "
MISSIONAUTOCAP.version = "0.1"

-- Default values for CAP settings
MISSIONAUTOCAP.default = {
    resurrection = 900,
    capSpeed = 350,
    capAlt = 25000,
    capDirection = 90,
    capLeg = 20,
    capGrouping = 2,
    missionRange = 100,
    engageRange = 50,
    numberAlter5Standby = 2,
    maxAliveMissions = 6,
    repeatOnFailure = 3,
    tankerAndAWACSInvisible = true,
}

-- container for wings
MISSIONAUTOCAP.wings = {}

function MISSIONAUTOCAP:Start()

    for wingIndex, wing in pairs(self.wings) do
            
        -- define wing properties
        local alias = wing.alias
        local airBaseName = wing.airBaseName
        local coalition = wing.coalition
        local ewrName = wing.ewrName
        local acceptZones = wing.acceptZones
        local rejectzones = wing.rejectZones
        local patrolPoints = wing.patrolPoints
        local squadrons = wing.squadrons
        -- use wing/mission default/module default values
        local capSpeed = wing.capSpeed or self.default.capSpeed
        local capAlt = wing.capAlt or self.default.capAlt
        local capDirection = wing.capDirection or self.default.capDirection
        local capLeg = wing.capLeg or self.default.capLeg
        local capGrouping = wing.capGrouping or self.default.capGrouping
        local missionRange = wing.missionRange or self.default.missionRange
        local engageRange = wing.engageRange or self.default.engageRange
        local numberAlter5Standby = wing.numberAlter5Standby or self.default.numberAlter5Standby
        local maxAliveMissions = wing.maxAliveMissions or self.default.maxAliveMissions
        local repeatOnFailure = wing.repeatOnFailure or self.default.repeatOnFailure
        local tankerAndAWACSInvisible = wing.tankerAndAWACSInvisible or self.default.tankerAndAWACSInvisible

        -- create main WING
        wing.cap = EASYGCICAP:New(alias, airBaseName, coalition, ewrName)
        
        -- set WING defaults
        wing.cap:SetDefaultCAPSpeed(capSpeed)
        wing.cap:setDefaultCAPAlt(capAlt)
        wing.cap:SetDefaultCAPDirection(capDirection)
        wing.cap:SetDefaultCAPLeg(capLeg)
        wing.cap:SetDefaultCAPGrouping(capGrouping)
        wing.cap:SetMissionRange(missionRange)
        wing.cap:SetDefaultEngageRange(engageRange)
        wing.cap:SetDefaultNumberAlter5Standby(numberAlter5Standby)
        wing.cap:SetMaxAliveMissions(maxAliveMissions)
        wing.cap:SetDefaultRepeatOnFailure(repeatOnFailure)
        wing.cap:SetTankerAndAWACSInvisible(tankerAndAWACSInvisible)
        
        -- set cap patrol points
        for _index, patrolPoint in pairs(patrolPoints) do
            local zone = ZONE:FindByName(patrolPoint)
            local coordinate zone:GetCoordinate()
            wing.cap:AddPatrolPointCAP(airBaseName, coordinate, capAlt, capSpeed, capDirection, capLeg)
        end

        -- set tanker patrol point

        -- add squadron
        for _index, squadron in pairs(squadrons) do
            local templatename = squadron.templatename
           -- wing.cap:AddSquadron(squadron.)
        end

        -- add tanker squadron

        -- add accept zones

        -- add reject zones


    end


end