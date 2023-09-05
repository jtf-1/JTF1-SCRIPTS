env.info( "[JTF-1] missioncap.lua" )

MISSIONCAP = {}
MISSIONCAP.traceTitle = "[JTF-1 MISSIONCAP] "
MISSIONCAP.menu = {}

MISSIONCAP.default = {
	engageRange = 60000,
	capTemplates = {
		"CAP_Mig29",
		"CAP_Mig21",
		"CAP_Su27",
	},
}

function MISSIONCAP:Start()
	_msg = self.traceTitle .. "Start()"
	BASE:T(_msg)
	
	-- Add main menu for CAP Missions
	MISSIONCAP.menu = MENU_COALITION:New( coalition.side.BLUE, "Enemy CAP" )

	-- Instantiate CAP Missions
	for index, capMission in ipairs(MISSIONCAP.capMission) do
		_msg = string.format(self.traceTitle .. "Add mission %s", capMission.name)
		BASE:T({_msg, capMission})

		MISSIONCAP:AddMission(capMission, index)
	end

end

-- Add CAP mission to main menu
function MISSIONCAP:AddMission(capMission, index)
	_msg = self.traceTitle .. "AddMission()"
	BASE:T({_msg, capMission})

	local capName = capMission.name

	capMission.spawn = SPAWN:New( capMission.spawnTemplate )
	capMission.spawnZone = ZONE:FindByName(capMission.spawnZone)
	capMission.patrolZone = ZONE:FindByName(capMission.patrolZone) or ZONE_POLYGON:FindByName(capMission.patrolZone)
	capMission.engageZone = ZONE:FindByName(capMission.engageZone) or ZONE_POLYGON:FindByName(capMission.engageZone) -- nil if an engage zone is not defined
	capMission.engageRange = capMission.engageRange or MISSIONCAP.default.engageRange

	-- if trace is on, draw the zones on the map
--[[ 	
	if BASE:IsTrace() and capMission.engageZone then 
		_msg = string.format(self.traceTitle .. "Draw engage zone %s.", capMission.engageZone:GetName())
		BASE:T(_msg)
		-- draw mission zone on map
		capMission.engageZone:DrawZone()
	else
		_msg = string.format(self.traceTitle .. "No engage zone for mission %s defined.", capName)
		BASE:T(_msg)
	end
 --]]
	_msg = string.format(self.traceTitle .. "Add Menus for mission %s.", capName)
	BASE:T(_msg)
	
	self.menu[index] = MENU_COALITION:New( coalition.side.BLUE, capName, MISSIONCAP.menu )
	self.menu[index][1] = MENU_COALITION_COMMAND:New( coalition.side.BLUE,"Add Single", self.menu[index], self.SpawnCap, self, capMission, 1) -- Spawn CAP 1 aircraft
	self.menu[index][2] = MENU_COALITION_COMMAND:New( coalition.side.BLUE,"Add Pair", self.menu[index], self.SpawnCap, self, capMission, 2) -- Spawn CAP 2 aircraft
	self.menu[index][3] = MENU_COALITION_COMMAND:New( coalition.side.BLUE,"Add Four", self.menu[index], self.SpawnCap, self, capMission, 4) -- Spawn CAP 4 aircraft
	self.menu[index][4] = MENU_COALITION_COMMAND:New( coalition.side.BLUE,"Remove Oldest " .. capName .. " CAP", self.menu[index], self.RemoveSpawn, self, capMission ) -- Remove the oldest CAP flight for location

end

--XXX ## Spawning CAP flights
-- max 8x CAP aircraft can be spawned at each location
function MISSIONCAP:SpawnCap( capMission, qty ) -- spawnobject, spawntable { spawn, spawnZone, templates, patrolzone, aicapzone, engagerange }
	_msg = self.traceTitle .. "SpawnCap()"
	BASE:T({_msg, capMission, qty})

	if capMission.patrolZone then
		if capMission.spawnZone then
			capMission.spawn:InitLimit(8,0) -- max 8x cap sections alive   
			:InitGrouping(qty)
			:InitCleanUp(60) -- remove aircraft that have landed
			:OnSpawnGroup(
				function ( SpawnGroup )
					AICapZone = AI_CAP_ZONE:New( capMission.patrolZone , 3000, 9000)
					AICapZone:SetControllable( SpawnGroup )
					if capMission.engageZone then
						AICapZone:SetEngageZone( capMission.engageZone )
					elseif capMission.engageRange then -- use engage range if engage zone is not defined
						AICapZone:SetEngageRange( capMission.engageRange )
					end
					AICapZone:__Start( 1 ) -- start patrolling in the PatrolZone.
				end
				,capMission.patrolZone, capMission.engageZone, capMission.engageRange
			)
			:SpawnInZone( capMission.spawnZone, true, 3000, 6000 )
		else
			_msg = string.format(self.traceTitle .. "SpawnCap(). Spawn zone %s for CAP Mission %s is not found", capMission.spawnZone:GetName(), capMission.name)
			BASE:E(_msg)
		end
	else
		_msg = string.format(self.traceTitle .. "SpawnCap(). Patrol zone %s for CAP Mission %s is not found", capMission.patrolZone:GetName(), capMission.name)
		BASE:E(_msg)

	end

end --function

-- Remove oldest spawn in a mission
function MISSIONCAP:RemoveSpawn( capMission )
	_msg = self.traceTitle .. "RemoveSpawn()"
	BASE:T({_msg, capMission})

	--local RemoveSpawnGroupTable = _args[1]

	local FirstSpawnGroup, Index = capMission.spawn:GetFirstAliveGroup()
	if FirstSpawnGroup then
		FirstSpawnGroup:Destroy( false )
	else
		_msg = string.format(self.traceTitle .. "RemoveSpawn(). No spawn found for CAP Mission %s.", capMission.name)
		BASE:E(_msg)
	end

end --function

-- CAP spawn templates for random spawns
MISSIONCAP.CapTemplates = {
	"Russia_Mig29",
	"Russia_Mig21",
	"Russia_Su27"
}