
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- BEGIN MARK SPAWN
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
-- Sourced from Virtual 57th. Minor refactoring of original script
--

BASE:T("[MARK_SPAWN] VERSION 0.12")

MARKSPAWN = {

  -- DEFAULT VALUES
  DEFAULT_BLUE_COUNTRY = 2, -- USA
  DEFAULT_RED_COUNTRY = 0, -- RUSSIA
  radioPresets = {},
  MLSpawnedGroups = {},
  MLDefaultAirAlt = 280, -- altitude in metres
  MLDefaultHdg = 000,
  MLDefaultSkill = "AVERAGE",
  MLDefaultDistance = 0,
  MLDefaultROE = "FREE",
  MLDefaultROT = "EVADE",
  MLDefaultFreq = 251,
  MLDefaultNum = 1,
  MLDefaultAirSpeed = 425,
  MLTgtArray = {},
    
}

  -- SPAWNABLE GROUP TYPES
MARKSPAWN.spawnTypes = { -- types available for spawning
    { spawn = "BVR_MIG23",  txt = "MIG23" ,   category = "air",     type = "CAP" },
    { spawn = "BVR_SU25",   txt = "SU25" ,    category = "air",     type = "CAP" },
    { spawn = "BVR_MIG29A", txt = "MIG29" ,   category = "air",     type = "CAP" },
    { spawn = "BVR_SU27",   txt = "SU27" ,    category = "air",     type = "CAP" },
    { spawn = "BVR_F4",     txt = "F4" ,      category = "air",     type = "CAP" },
    { spawn = "SA6",    txt = "SA6BTY" ,  category = "ground",  type = "SAM" },
    { spawn = "SA8",    txt = "SA8BTY" ,  category = "ground",  type = "SAM" },
    { spawn = "SA10",   txt = "SA10BTY" , category = "ground",  type = "SAM" },
    { spawn = "SA11",   txt = "SA11BTY" , category = "ground",  type = "SAM" },
    { spawn = "SA15",   txt = "SA15BTY" , category = "ground",  type = "SAM" },
}


--MARKSPAWN.markEvent = EVENTHANDLER:New()
--MARKSPAWN.markEvent:HandleEvent(EVENTS.MarkChange)

local DEFAULT_BLUE_COUNTRY = 2 --The USA
local DEFAULT_RED_COUNTRY = 0 -- RUSSIA
  
local spawnerOptions = {

  { spawn = SPAWN:New(  "BVR_MIG23"  ), txt = "MIG23" , category = "air", type = "CAP" },
  { spawn = SPAWN:New(  "BVR_SU25"  ), txt = "SU25" , category = "air", type = "CAP" },
  { spawn = SPAWN:New(  "BVR_MIG29A"  ), txt = "MIG29" , category = "air", type = "CAP" },
  { spawn = SPAWN:New(  "BVR_SU27"  ), txt = "SU27" , category = "air", type = "CAP" },
  { spawn = SPAWN:New(  "BVR_F4"  ), txt = "F4" , category = "air", type = "CAP" },

  { spawn = SPAWN:New(  "SA2"  ), txt = "SA2" , category = "ground", type = "SAM" },
  { spawn = SPAWN:New(  "SA6"  ), txt = "SA6" , category = "ground", type = "SAM" },
  { spawn = SPAWN:New(  "SA8"  ), txt = "SA8" , category = "ground", type = "SAM" },
  { spawn = SPAWN:New(  "SA10"  ), txt = "SA10" , category = "ground", type = "SAM" },
  { spawn = SPAWN:New(  "SA11"  ), txt = "SA11" , category = "ground", type = "SAM" },
  { spawn = SPAWN:New(  "SA15"  ), txt = "SA15" , category = "ground", type = "SAM" },
}

local radioPresets = {}

local MLSpawnedGroups = {}

local MLAirSpawn
local MLGroundSpawn
local MLNavalSpawn
local MLSetROE
local MLSetTask
local MLSetAlarm
local MLSideComparator
local MLConvertMarkPos
local parseMark
local MLRadioPreset
local MLFindWaypoints
local MLListSpawnOptions
local MLDeleteGroup
local MLWxReport
local MLSkillCheck
local split
local comparator
local deleteDeterminator
local magVarDeterminator
local MLSetROT
local MLRemoveMark
--local MLRadioSpawn
local MLSongParser
--local MLRadioStatic = STATIC:FindByName("PIRATERADIO","CUCKS")
--local MLRadio = RADIO:New(MLRadioStatic)
local _Heading
local MLTgtArray = {}
local MLCreateTGT
local MLPopulateTGT
local MLReturnTGT
local MLTgtArrayAdd
local MLTgtArrayRemove
local MLDefaultAirAlt = 280 -- altitude in metres
local MLDefaultHdg = 000
local MLDefaultSkill = "AVERAGE"
local MLDefaultDistance = 0
local MLDefaultROE = "FREE"
local MLDefaultROT = "EVADE"
local MLDefaultFreq = 251
local MLDefaultNum = 1
local MLDefaultAirSpeed = 425
local MLDefaultAlert = "RED"

-----------------
-- MARK POINT EVENT HANDLER
-----------------

local markEvent = EVENTHANDLER:New()
markEvent:HandleEvent(EVENTS.MarkChange)

-- IF MARK IS A "CMD", SEND MARK DATA TO PARSER
function markEvent:OnEventMarkChange( EventData )
  BASE:T("[MARK_SPAWN] MARK CHANGE EVENT")
  local text = EventData.text
  local x, _ = string.find(text, "CMD")
  if(x ~= nil) then
    parseMark(EventData)
    MLRemoveMark(EventData.idx)
  else
    return
  end
end

 scheduler, schedulerID = SCHEDULER:New( nil,
   function(foo)
    BASE:T({"[MARK_SPAWN] scheduler:", markEvent} )
   end,
 {}, 300, 300)

-----------------
-- CMD PARSER
-----------------

function parseMark (mark)

  BASE:T({"[MARK_SPAWN] mark: ", mark} )

  local cmdOption = false
  local text = mark.text
  local pos = mark.pos
  
  -----------------
  -- CMD AIR GROUP
  -----------------

  --check if there is an air spawn command, if so run through the spawn logic
  local i, _, spawnValue = string.find(text, "ASPAWN: (%w+)")
  if(i ~= nil) then
    cmdOption = true
    if(spawnValue:upper() == "OPTIONS") then
      MLListSpawnOptions("air", mark)
    else
      local _, _, heading = string.find(text, "HDG: (%d+)")
      local _, _, altitude = string.find(text, "ALT: (%d+)")
      local _, _, task = string.find(text,"TASK: (%w+)")
      local _, _, skill = string.find(text,"SKILL: (%w+)")
      local _, _, distance = string.find(text,"DIST: (%d+)")
      local _, _, ROE = string.find(text, "ROE: (%w+)")
      local _, _, WPS = string.find(text, "WPS: {(.*)}")
      local _, _, freq = string.find(text, "FREQ: (%d[%d.]+)")
      local _, _, num = string.find(text, "NUM: (%d+)")
      local _, _, speed = string.find(text, "SPD: (%d+)")
      local _, _, side = string.find(text, "SIDE: (%w+)")
      local _, _, formation = string.find(text, "FORM: (%w+)")
      local _, _, base = string.find(text, "BASE: (%w+)")
      local _, _, groupName = string.find(text, "NAME: (%w+)")
      local _, _, ROT = string.find(text, "ROT: (%w+)")

      local spawnTable = {
        type = spawnValue,
          heading = heading,
          altitude = altitude,
          task = task, 
          skill = skill, 
          distance = distance, 
          roe = ROE, 
          WP = WPS, 
          pos = pos, 
          freq = freq, 
          num = num, 
          speed = speed,
          side = side, 
          formation = formation,
          base = base,
          groupName = groupName,
          rot = ROT,
        }

        BASE:T({"[MARK_SPAWN] spawnTable: ", spawnTable})

      MLAirSpawn(spawnTable)
    end
  end
  
  -----------------
  -- CMD GROUND GROUP
  -----------------

  local j, _, spawnValue = string.find(text, "GSPAWN: (%w+)")
  if(j ~= nil) then
    cmdOption = true
    if(spawnValue:upper() == "OPTIONS") then
      MLListSpawnOptions("ground", mark)
    else
      local _, _, heading = string.find(text, "HDG: (%d+)")
      local _, _, skill = string.find(text,"SKILL: (%w+)")
      local _, _, distance = string.find(text,"DIST: (%d+)")
      local _, _, ROE = string.find(text, "ROE: (%w+)")
      local _, _, WP = string.find(text, "WPS: {(.*)}")
      local _, _, alert = string.find(text, "ALERT: (%w+)")
      local _, _, speed = string.find(text, "SPD: (%d+)")
      local _, _, side = string.find(text, "SIDE: (%w+)")
      local _, _, formation = string.find(text, "FORM: (%w+)")  
      local _, _, groupName = string.find(text, "NAME: (%w+)")
      local _, _, tgtName = string.find(text, "TGT: (%w+)")

      local spawnTable = {
        type = spawnValue,
          heading = heading,
          skill = skill, 
          distance = distance, 
          roe = ROE, 
          WP = WP, 
          pos = pos,
          speed = speed,
          coalition = side,
          formation = formation,
          alert = alert,
          side = side,
          groupName = groupName,
          tgt = tgtName
        }

        BASE:T({"[SPAWN_MARK] GSPAWN: ",  spawnTable})
      MLGroundSpawn(spawnTable)
    end
  end
    
  -----------------
  -- CMD RADIO
  -----------------

  local k, _, spawnValue = string.find(text, "RADIO: (%w+)")
  if(k ~= nil) then
    cmdOption = true
    BASE:T("[MARK_SPAWN] SpawnValue: " .. spawnValue)
    BASE:T("[MARK_SPAWN] Other Text: " .. k)
    local _, _, freq = string.find(text, "FREQ: (%d+)")
    local _, _, band = string.find(text,"BAND: (%w+)")
    local _, _, power = string.find(text,"PWR: (%d+)")
    
    local spawnTable = {
      song = spawnValue,
      freq = freq,
      band = band, 
      power = power, 
    }

    BASE:T({"[MARK_SPAWN] RADIO: ", spawnTable})
    --MLRadioSpawn(spawnTable)
  end
  
  -----------------
  -- CMD NAVY GROUP
  -----------------

  --spawn a naval group
  local l, _, spawnValue = string.find(text, "NSPAWN: (%w+)")
  if(l ~= nil) then
    cmdOption = true
    if(spawnValue:upper() == "OPTIONS") then
      MLListSpawnOptions("naval", mark)
    else
      local _, _, heading = string.find(text, "HDG: (%d+)")
      local _, _, skill = string.find(text,"SKILL: (%w+)")
      local _, _, distance = string.find(text,"DIST: (%d+)")
      local _, _, ROE = string.find(text, "ROE: (%w+)")
      local _, _, WP = string.find(text, "WPS: {(.*)}")
      local _, _, alert = string.find(text, "ALERT: (%w+)")
      local _, _, speed = string.find(text, "SPD: (%d+)")
      local _, _, side = string.find(text, "SIDE: (%w+)")
      local _, _, formation = string.find(text, "FORM: (%w+)")  
      local _, _, groupName = string.find(text, "NAME: (%w+)")
      local _, _, tgtName = string.find(text, "TGT: (%w+)")
      
      local spawnTable = {
        type = spawnValue,
          heading = heading,
          skill = skill, 
          distance = distance, 
          roe = ROE, 
          WP = WP, 
          pos = pos,
          speed = speed,
          coalition = side,
          formation = formation,
          alert = alert,
          side = side,
          groupName = groupName,
          tgt = tgtName
        }

      BASE:T({"[MARK_SPAWN] NSPAWN: ", spawnTable})
      MLNavalSpawn(spawnTable)
    end
  end
  
  -----------------
  -- CMD DELETE GROUP
  -----------------

  --Delete one or more groups
  local l, _, deleteCMD = string.find(text, "DELETE: (%w+)")
  if(l ~= nil) then
    cmdOption = true
    local _, _, category = string.find(text, "CAT (%w+)")
    local _, _, side = string.find(text,"SIDE (%w+)")
    local _, _, radius = string.find(text,"RAD (%d+)")
    local _, _, template = string.find(text,"TYPE (%w+)")
    local _, _, groupName = string.find(text, "GROUP (.+)")
      
      local spawnTable = {
          cmd = deleteCMD,
          category = category,
          side = side,
          radius = radius,
          template = template,
          groupName = groupName,
        }
    MLDeleteGroup(spawnTable, mark)
  end

  -----------------
  -- CMD WX REPORT
  -----------------

  local m, _, repoString = string.find(text, "WXREPORT: (.*)")
  if(m ~= nil) then
    cmdOption = true
    MLWxReport(repoString, mark)
  end

  if not cmdOption then
    BASE:E("[MARK_SPAWN] ERROR! CMD not found.")
  end

end
  
-----------------
-- SPAWN AIR GROUP(S)
-----------------

function MLAirSpawn(SpawnTable)
  local type = SpawnTable.type
  local heading = tonumber(SpawnTable.heading) or MLDefaultHdg
  local altitude = tonumber(SpawnTable.altitude) or MLDefaultAirAlt
  altitude = UTILS.FeetToMeters(altitude * 100)
  local task = SpawnTable.task or "C"
  local skill = MLSkillCheck(SpawnTable.skill) or MLDefaultSkill
  local distance = tonumber(SpawnTable.distance) or MLDefaultDistance
  local ROE = SpawnTable.roe or MLDefaultROE
  local ROT = SpawnTable.rot or MLDefaultROT
  local freq = tonumber(SpawnTable.freq) or MLDefaultFreq
  local num = tonumber(SpawnTable.num) or MLDefaultNum
  local speed = tonumber(SpawnTable.speed) or MLDefaultAirSpeed
  local form = SpawnTable.formation or nil
  local base = SpawnTable.base or nil
  local spawnCoord = COORDINATE:NewFromVec3(SpawnTable.pos):SetAltitude(altitude,true)
  local spawner = comparator(type)

  if(spawner == nil) then
    return
  end

  local template = GROUP:FindByName( spawner.SpawnTemplatePrefix )
  local waypointNameString = SpawnTable.WP or nil
  
  -- switch country/coalition if desired
  local coal, country
  if(SpawnTable.side) then
    coal, country = MLSideComparator(SpawnTable.side, template)
  else
    coal = template:GetCoalition()
    country = template:GetCountry()
  end
  local group
  
  -- spawn the group
  if(base) then
    local airbase
    if(base == "NEAREST") then 
      BASE:T("[MARK_SPAWN] learn 2 spell, scrub")
      local theater = env.mission.theatre
      local distance = 0
    else
      airbase = AIRBASE:FindByName(base)
      if(airbase == nil) then 
        airbase = AIRBASE:GetAllAirbases()[1]
      end
    end
    group = spawner:InitGrouping(num):InitSkill(skill):InitCoalition(coal):InitCountry(country):InitHeading(heading):SpawnAtAirbase(airbase,SPAWN.Takeoff.Cold,nil)
  else
    BASE:T("[MARK_SPAWN] ASPAWN: " .. coal .. " " .. country)
    group = spawner:InitGrouping(num):InitSkill(skill):InitCoalition(coal):InitCountry(country):InitHeading(heading):SpawnFromVec3(spawnCoord:GetVec3())
    _groupName = group.GroupName
    BASE:T("[MARK_SPAWN] ASPAWN: " .. _groupName)
  end
  
  MLSpawnedGroups[#MLSpawnedGroups + 1] = {group = group, category = "air", side = coal}
  -- set ROE
  MLSetROE(ROE,group)
  -- set ROT
  MLSetROT(ROT,group)
  --if no distance, then we orbit
  if(waypointNameString) then
    local waypointCoords = MLFindWaypoints(waypointNameString)
    if(#waypointCoords > 0) then
      BASE:T('[MARK_SPAWN] MORE WAYPOINTS')
      local route = {}
      route[#route + 1] = spawnCoord:WaypointAir(POINT_VEC3.RoutePointAltType.BARO,POINT_VEC3.RoutePointType.TurningPoint,POINT_VEC3.RoutePointAction.TurningPoint,UTILS.KnotsToKmph(speed),true)
      for idx, waypoint in pairs(waypointCoords) do
        route[#route + 1] = waypoint:SetAltitude(altitude,true):WaypointAir(POINT_VEC3.RoutePointAltType.BARO,POINT_VEC3.RoutePointType.TurningPoint,POINT_VEC3.RoutePointAction.TurningPoint,UTILS.KnotsToKmph(speed),true)
      end
      group:Route(route)
    else
      local orbitEndPoint = spawnCoord:Translate(UTILS.NMToMeters(15),heading)
      local orbit = { 
        id = 'Orbit', 
        params = { 
          pattern = AI.Task.OrbitPattern.RACE_TRACK,
          point = spawnCoord:GetVec2(),
          point2 = orbitEndPoint:GetVec2(),
          speed = UTILS.KnotsToMps(speed),
          altitude = altitude
        } 
      }

      group:SetTask( orbit, 2 )
    end
  elseif(distance == 0) then
    local orbitEndPoint = spawnCoord:Translate(UTILS.NMToMeters(15),heading)
    local orbit = { 
      id = 'Orbit', 
      params = { 
        pattern = AI.Task.OrbitPattern.RACE_TRACK,
        point = spawnCoord:GetVec2(),
        point2 = orbitEndPoint:GetVec2(),
        speed = UTILS.KnotsToMps(speed),
        altitude = altitude
      } 
    }

    group:SetTask( orbit, 2 )
  --if distance, we create a waypoint way the fuck out in the boonies
  elseif(distance > 0) then
    local WP1 = spawnCoord:Translate(UTILS.NMToMeters(distance),heading)
    :WaypointAir(POINT_VEC3.RoutePointAltType.BARO,POINT_VEC3.RoutePointType.TurningPoint,POINT_VEC3.RoutePointAction.TurningPoint,UTILS.KnotsToKmph(speed),true)
    local WP2 = spawnCoord:Translate(UTILS.NMToMeters(distance),heading * 2)
    :WaypointAir(POINT_VEC3.RoutePointAltType.BARO,POINT_VEC3.RoutePointType.TurningPoint,POINT_VEC3.RoutePointAction.TurningPoint,UTILS.KnotsToKmph(speed),true)
    
    local route = {WP1, WP2}
    group:Route(route)
  else
    BASE:T("[MARK_SPAWN] We Fucked Up")
  end
  local taskTable = {}
  if(task ~= "NOTHING") then
    taskTable = MLSetTask(task,group)
    group:PushTask ( group:TaskCombo( MLSetTask(task,group) ) , 3 )
  end
  --set group frequency
  if(freq) then
    if(freq <= 20) then
      freq = MLRadioPreset(freq)
    end
    BASE:T("[MARK_SPAWN] freq:".. freq)
    freq = freq * 1000000
    local SetFrequency = { 
      id = 'SetFrequency', 
      params = { 
        frequency = freq, 
        modulation = 0, 
      }
    }
    group:SetCommand(SetFrequency)
  end

 end

-----------------
-- SPAWN GROUND GROUP(S)
-----------------

function MLGroundSpawn(SpawnTable)
  local type = SpawnTable.type
  local heading = tonumber(SpawnTable.heading) or 000
  local task = SpawnTable.task or "NOTHING"
  local skill = MLSkillCheck(SpawnTable.skill) or "AVERAGE"
  local distance = tonumber(SpawnTable.distance) or 0
  local ROE = SpawnTable.roe or "FREE"
  local freq = tonumber(SpawnTable.freq) or 251
  local speed = tonumber(SpawnTable.speed) or 21
  local form = SpawnTable.formation or nil
  local alert = SpawnTable.alert or MLDefaultAlert
  local spawnCoord = COORDINATE:NewFromVec3(SpawnTable.pos)
  --local tgt = nil
  local spawner = comparator(type)
  --local tgt = MLCreateTGT(SpawnTable.tgt,SpawnTable.pos)or nil

  if(spawner == nil) then
    BASE:E("[MARK_SPAWN] ERROR! spawner not found in spawnOptions.")
    return
  end

  local template = GROUP:FindByName( spawner.SpawnTemplatePrefix )
  local waypointNameString = SpawnTable.WP or nil
  
  --local spawnCoord = COORDINATE:NewFromVec3(SpawnTable.pos)
  local coal, country

  if(SpawnTable.side) then
    coal, country = MLSideComparator(SpawnTable.side, template)
  else
    coal = template:GetCoalition()
    country = template:GetCountry()
  end

  
  local group = spawner:InitSkill(skill):InitCoalition(coal):InitCountry(country):SpawnFromVec3(spawnCoord:GetVec3())

  local _group = group.GroupName
  BASE:T("[MARK_SPAWN] GSPAWN: " .. _group)
  
  MLSpawnedGroups[#MLSpawnedGroups + 1] = {group = group, category = "ground", side = coal}
  
  MLSetROE(ROE,group)
  MLSetAlarm(alert,group)
  -- add waypoints
  --if no distance, then we orbit
  if(waypointNameString) then
    local waypointCoords = MLFindWaypoints(waypointNameString)
    BASE:T('MORE WAYPOINTS')
    local route = {}
    for idx, waypoint in pairs(waypointCoords) do
      route[#route + 1] = waypoint:WaypointGround(UTILS.KnotsToKmph(speed),form)
    end
    group:Route(route)
  elseif(distance > 0) then
    local WP = spawnCoord:Translate(UTILS.NMToMeters(distance),heading)
    group:RouteGroundTo(WP, speed, form, 1)
  end
end
  
-----------------
-- SPAWN NAVY GROUP(S)
-----------------

function MLNavalSpawn(SpawnTable)
  local type = SpawnTable.type
  local heading = tonumber(SpawnTable.heading) or 000
  local task = SpawnTable.task or "NOTHING"
  local skill = MLSkillCheck(SpawnTable.skill) or "AVERAGE"
  local distance = tonumber(SpawnTable.distance) or 0
  local ROE = SpawnTable.roe or "FREE"
  local freq = tonumber(SpawnTable.freq) or 251
  local speed = tonumber(SpawnTable.speed) or 30
  local form = SpawnTable.formation or nil
  local alert = SpawnTable.alert or "AUTO"
  local spawnCoord = COORDINATE:NewFromVec3(SpawnTable.pos)
  local spawner = comparator(type)
  local tgt = nil
  --local tgt = MLCreateTGT(SpawnTable.tgt,SpawnTable.pos) or nil
  if(spawner == nil) then
    return
  end
  local template = GROUP:FindByName( spawner.SpawnTemplatePrefix )
  local waypointNameString = SpawnTable.WP or nil
  
  local spawnCoord = COORDINATE:NewFromVec3(SpawnTable.pos)
  local coal, country
  if(SpawnTable.side) then
    coal, country = MLSideComparator(SpawnTable.side, template)
  else
    coal = template:GetCoalition()
    country = template:GetCountry()
  end

  local group = spawner:InitSkill(skill):InitCoalition(coal):InitCountry(country):InitHeading(heading):SpawnFromVec3(spawnCoord:GetVec3())
  MLSpawnedGroups[#MLSpawnedGroups + 1] = {group = group, category = "naval", side = coal}

  MLSetROE(ROE,group)
  --MLSetAlarm(alert,group)
  -- LETS DO WAYPOINTS YE JAMMY FOOKERS!
  --if no distance, then we orbit
  if(waypointNameString) then
    local waypointCoords = MLFindWaypoints(waypointNameString)
    BASE:T('MORE WAYPOINTS')
    local route = {}
    for idx, waypoint in pairs(waypointCoords) do
      route[#route + 1] = waypoint:WaypointGround(UTILS.KnotsToKmph(speed),nil)
    end
    group:Route(route)
  elseif(distance >= 0) then
    local WP = spawnCoord:Translate(UTILS.NMToMeters(distance),heading)
    group:RouteGroundTo(WP, speed, nil, 1)
  end
end
  
-----------------
-- DELETE SPAWN GROUP
-----------------

function MLDeleteGroup(spawnTable,mark)

  local deleteCMD = spawnTable.cmd:upper()
  
  BASE:T("[MARK_SPAWN] DELETE:" .. deleteCMD)

  
  local coal = spawnTable.side or "RED"
  local type = spawnTable.category or "ALL"

  type = type:upper()

  local radius =  spawnTable.radius or 5
  radius = UTILS.NMToMeters(radius)

  local template = spawnTable.template or nil

  if template then
    template = template:upper()
  end
  
  if(coal:upper() == "RED") then 
    coal = 1 else coal = 2 
  end
  
  BASE:T("[MARK_SPAWN] DELETE OPTIONS CMD: " .. deleteCMD .. " SIDE: " .. coal .. " Type: " .. type .. " Radius: " .. radius)
  
  if(deleteCMD == "GROUP") then
    BASE:T("[MARK_SPAWN] DELETE GROUP")
    local groupName = spawnTable.groupName --string.find(deleteCMD, "NAME: (%w+)")
    BASE:T("[MARK_SPAWN] groupName: " .. groupName)
    local victim = GROUP:FindByName(groupName) or nil
    if victim then
      victim:Destroy(false)
    else
      BASE:T("[MARK_SPAWN] Delete groupName not found!")
    end
  
  elseif(deleteCMD == "AREA") then
    BASE:T("[MARK_SPAWN] Doing Radius Stuff")
    local deleteZone = ZONE_RADIUS:New("DeleteZone",COORDINATE:NewFromVec3(mark.pos):GetVec2(),radius)
    BASE:T({"[MARK_SPAWN] Marker Pos: ", mark.pos, " Zone Pos: ", deleteZone:GetVec2(), "Radius: ", deleteZone:GetRadius()})
    for idx, entry in pairs (MLSpawnedGroups) do
      if entry.group:IsAlive() then 
        local groupPos = entry.group:GetVec2()
        local zoneVec2 = deleteZone:GetVec2()
        local isThere = ((groupPos.x - zoneVec2.x )^2 + ( groupPos.y - zoneVec2.y ) ^2 ) ^ 0.5 <= tonumber(deleteZone:GetRadius())
        BASE:T("[MARK_SPAWN] BREASTS: " .. ((groupPos.x - zoneVec2.x )^2 + ( groupPos.y - zoneVec2.y ) ^2 ) ^ 0.5)
        if(isThere) then
          BASE:T("[MARK_SPAWN] Group in zone")
          if(type and (entry.category:upper() == type:upper() or type:upper() == "ALL")) then
          BASE:T("[MARK_SPAWN] Type correct")
          BASE:T("[MARK_SPAWN] Function Side: " .. coal .. "Group Side: " .. entry.side)
            if(coal and (entry.side == coal)) then
              BASE:T("[MARK_SPAWN] Side correct")
              local victim = entry.group
              victim:Destroy(false)
              MLSpawnedGroups[idx] = nil
            end
          end
        else
          BASE:T("[MARK_SPAWN] Group out of Zone")
        end
      else
        BASE:T("[MARK_SPAWN] Group omae wa mo shindeiru")
        MLSpawnedGroups[idx] = nil
      end
    end
  elseif(deleteCMD == "NEAREST") then
    BASE:T("[MARK_SPAWN] Close Stuff")
  local minDistance = -1
  local closest = 1
  local markPos = COORDINATE:NewFromVec3(mark.pos):GetVec2()
  if(MLSpawnedGroups[1].group:IsAlive()) then
    local groupPos = MLSpawnedGroups[1].group:GetVec2()
  minDistance = ((groupPos.x - markPos.x )^2 + ( groupPos.y - markPos.y ) ^2 ) ^ 0.5
  for idx, entry in pairs (MLSpawnedGroups) do
        if entry.group:IsAlive() then 
          local groupPos = entry.group:GetVec2()
          local currentDistance = ((groupPos.x - markPos.x )^2 + ( groupPos.y - markPos.y ) ^2 ) ^ 0.5
          if(currentDistance < minDistance) then
      minDistance = currentDistance
      closest = idx
    end
        else
          BASE:T("[MARK_SPAWN] Group omae wa mo shindeiru")
          MLSpawnedGroups[idx] = nil
        end
      end
  local closestEntry = MLSpawnedGroups[closest]
  if(type and (closestEntry.category:upper() == type:upper() or type:upper() == "ALL")) then
    BASE:T("[MARK_SPAWN] Type correct")
    BASE:T("[MARK_SPAWN] Function Side: " .. coal .. "Group Side: " .. closestEntry.side)
    if(coal and (closestEntry.side == coal)) then
      BASE:T("[MARK_SPAWN] Side correct")
    local victim = closestEntry.group
    victim:Destroy(false)
    MLSpawnedGroups[closest] = nil
      end
  end
  end
  elseif(deleteCMD == "KIND") then
    for idx, entry in pairs (MLSpawnedGroups) do
      if entry.group:IsAlive() and template then 
    if(entry.template == template) then
      if(type and (entry.category:upper() == type:upper() or type:upper() == "ALL")) then
        BASE:T("[MARK_SPAWN] Type correct")
        BASE:T("[MARK_SPAWN] Function Side: " .. coal .. "Group Side: " .. entry.side)
        if(coal and (entry.side == coal)) then
          BASE:T("[MARK_SPAWN] Side correct")
        local victim = entry.group
        victim:Destroy(false)
        MLSpawnedGroups[idx] = nil
          end
    end
        end
      else
        BASE:T("[MARK_SPAWN] Group omae wa mo shindeiru")
        MLSpawnedGroups[idx] = nil
  end
    end
  elseif(deleteCMD == "ALL") then
    for idx, entry in pairs (MLSpawnedGroups) do
      if entry.group:IsAlive() then
        BASE:T("[MARK_SPAWN] Side correct")
        local victim = entry.group
        victim:Destroy(false)
        MLSpawnedGroups[idx] = nil
      else
        MLSpawnedGroups[idx] = nil
      end
    end
  end
end

-----------------
-- WX REPORT
-----------------

function MLWxReport (repoString, mark)
  local qfe = false
  local metric = false
  local options = split(repoString, ",")
  BASE:T({options})
  for idx, option in pairs (options) do
    option = option:gsub("%s+", "")
    BASE:T(option)
    if(option:upper() == "METRIC") then
      metric = true
    elseif(option:upper() == "QFE") then
      qfe = true
    end
  end
  
  local wxPos = COORDINATE:NewFromVec3(MLConvertMarkPos(mark.pos))
  local heading, windSpeedMPS = wxPos:GetWind(wxPos:GetLandHeight())
  heading = _Heading(heading + 180)
  local windSpeedKnots = UTILS.MpsToKnots(windSpeedMPS)
  local temperature = wxPos:GetTemperature()
  
  local pressure_hPa,pressure_inHg
  if(qfe) then
    pressure_hPa = wxPos:GetPressure(wxPos:GetLandHeight())
  else
    pressure_hPa = wxPos:GetPressure(0)
  end
  pressure_inHg = pressure_hPa * 0.0295299830714
  BASE:T("[MARK_SPAWN] " .. pressure_hPa .. ", " .. pressure_inHg)
  
  local coal
  if(mark.initiator) then
    coal = UNIT:Find(mark.initiator):GetGroup():GetCoalition()
  else
    coal = mark.coalition
  end

  local msg = ""
  if(metric) then
    msg = msg .. string.format("Wind is from %3d Degrees at %3d Mps\n",windSpeedMPS,heading)
    if(qfe) then
      msg = msg .. string.format("QFE is %4.2f hPa\n", pressure_hPa)
    else
      msg = msg .. string.format("QNH is %4.2f hPa\n", pressure_hPa)
    end
  else
    msg = msg .. string.format("Wind is from %3d Degrees at %3d Knots\n",windSpeedKnots,heading)
    if(qfe) then
      msg = msg .. string.format("QFE is %4.2f inHg\n", pressure_inHg)
    else
      msg = msg .. string.format("QNH is %4.2f inHg\n", pressure_inHg)
    end
  end
  msg = msg .. string.format("Temperature is %3d Degrees C", temperature)
  wxPos:MarkToCoalition(msg,coal,false,nil)
end

-----------------
-- REMOVE CMD MARK POINT
-----------------

function MLRemoveMark (markId)
  local allMarks = world.getMarkPanels()
  for idx, mark in pairs(allMarks) do
    if markId == mark.idx then
      trigger.action.removeMark(markId)
      allMarks[idx] = nil
      return
    end
  end
end

-- function MLRadioSpawn(SpawnTable)
--   local song = SpawnTable.song
--   local freq = tonumber(SpawnTable.freq) or 251

--   local band = SpawnTable.band or "AM"
--   if(band == "FM") then
--     band = 1
--   else
--     band = 0
--   end
--   local power = tonumber(SpawnTable.power) or 1200
--   local loop = SpawnTable.loop

--   BASE:T(freq)
--   BASE:T(band)
--   BASE:T(power)

--   local radioPositionable = SpawnTable.group
--   if(radioPositionable) then

--     local pirateRadio = RADIO:New(radioPositionable)
--     pirateRadio:NewGenericTransmission(song,freq,band,power,false)
--     pirateRadio:Broadcast()
--     BASE:T("[MARK_SPAWN] boobs")
--   else
--     MLRadio:NewGenericTransmission(song,freq,band,power,false)
--     MLRadio:Broadcast()
--     BASE:T("[MARK_SPAWN] tatas")
--   end
  

-- end
  
function comparator (type)
  for idx, val in pairs(spawnerOptions) do
    if string.upper(type) == string.upper(val.txt) then
      BASE:T("[MARK_SPAWN] Type: " .. val.type)
      BASE:T("[MARK_SPAWN] Value: " .. val.txt)
      return val.spawn
    end
  end
  return nil
end

function MLSetROE(ROEString, group)
  local text = string.upper(ROEString)
  if(text == "FREE") then 
    group:OptionROEWeaponFree()
  elseif (text == "RETURN") then
    group:OptionROEReturnFire()
  elseif (text == "HOLD") then
    group:OptionROEHoldFire()
  end
end
  
function MLSetROT(ROTString, group)
  local text = string.upper(ROTString)
  if(text == "EVADE") then
    group:OptionROTEvadeFire()
  elseif (text == "PASSIVE") then
    group:OptionROTPassiveDefense()
  elseif (text == "NONE") then
    group:OptionROTNoReaction()
  end
end
  
function MLSetAlarm(alarmString, group)
  local text = string.upper(alarmString)
  if(text == "GREEN") then 
    group:OptionAlarmStateGreen()
  elseif (text == "RED") then
    group:OptionAlarmStateRed()
  elseif (text == "AUTO") then
    group:OptionAlarmStateAuto()
  end
end

function MLSetTask(TaskString, group)
    local text = string.upper(TaskString)
    local taskTable = {}
  
    if(text == "CAP") then 
    local EngageTargets = { 
      id = 'EngageTargets', 
      params = { 
        maxDist = UTILS.NMToMeters(40), 
        targetTypes = {"Air"},
        priority = 0 
      } 
    }
    taskTable[1] = EngageTargets
  
  elseif (text == "REFUELING" or text == "TANKER") then
    local task = group:EnRouteTaskTanker()
    taskTable[1] = task
  
  elseif (text == "CAS") then
    local EngageTargets = { 
      id = 'EngageTargets', 
      params = { 
        maxDist = UTILS.NMToMeters(25), 
        targetTypes = {"Ground Units","Light armed ships","Helicopters"},
        priority = 0 
      } 
    }
  
  elseif (text == "SEAD") then
    local EngageTargets = { 
      id = 'EngageTargets', 
      params = {
        maxDist = UTILS.NMToMeters(25), 
        targetTypes = {"Air Defence"},
        priority = 0 
      } 
    }
    taskTable[1] = EngageTargets
  
  elseif (text == "TASMO") then
    local EngageTargets = { 
      id = 'EngageTargets', 
      params = { 
        maxDist = UTILS.NMToMeters(100), 
        targetTypes = {"Ships"},
        priority = 0 
      } 
    }
    taskTable[1] = EngageTargets
  
  elseif (text == "AWACS") then
    local task = group:EnRouteTaskAWACS()
    local EPLRS = { 
      id = 'EPLRS', 
      params = { 
        value = true,
      } 
    }
    group:SetCommand(EPLRS)
    taskTable[1] = task
  
  elseif (text == "AFAC") then
    local task = group:EnRouteTaskFAC(UTILS.NMToMeters(10), 0)
    taskTable[1] = task
  
  end
  
  return taskTable
end
  
  
function MLSideComparator (side, template)
  local coal
  local country = template:GetCountry()
  if(side == "BLUE") then
    coal = coalition.side.BLUE
    if(coal ~= template:GetCoalition()) then
      country = DEFAULT_BLUE_COUNTRY
    end
  elseif(side == "RED") then
    coal =  coalition.side.RED
    if(coal ~= template:GetCoalition()) then
      country = DEFAULT_RED_COUNTRY
    end
  else
    coal = template:GetCoalition()
    country = template:GetCountry()
  end
  
  BASE:T(coal .. " " .. country)
  return coal, country
end
  
function MLRadioPreset (channel)
  return radioPresets[channel]
end
  
function MLConvertMarkPos (pos)
  local newPos = UTILS.DeepCopy(pos)
  local zVal = pos.x
  local xVal = pos.z
  newPos.z = zVal
  newPos.x = xVal
  return newPos
end
  
function MLFindWaypoints(waypointNameList)
  BASE:T("[MARK_SPAWN] WAYPOINTS MODE TURN ON")
  local waypointNames={}
  local waypointCoords = {}
  --waypoints:gsub("%w*",function(name) table.insert(waypointNames,name) end)
  --for k, v in waypointNameList:gmatch("(%w*)") do
  --  table.insert(waypointNames,k)
  --end
  
  waypointNames = split(waypointNameList,",")
  local allMarks = world.getMarkPanels()
  for idx, name in pairs(waypointNames) do
    for idy, mark in pairs(allMarks) do
      BASE:T("[MARK_SPAWN] name: " .. name)
      BASE:T("[MARK_SPAWN] mark: " .. mark.text)
      if string.upper(name) == string.upper(mark.text) then
        waypointCoords[#waypointCoords + 1] = COORDINATE:NewFromVec3(mark.pos)
        break
      end
    end
  end
  return waypointCoords
end
  
function split(s, delimiter)
  local result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
      table.insert(result, match);
  end
  return result;
end
  
function MLListSpawnOptions(category, mark)
  local messageString = ""
  for idx, value in pairs(spawnerOptions) do
    --list name, role, maybe default coalition
    if(category:upper() == value.category:upper()) then
      local name = value.txt
      local role = value.type
      local defaultCoalition = GROUP:FindByName( value.spawn.SpawnTemplatePrefix ):GetCoalition()
      local coal
      if(defaultCoalition == 1) then coal = "Red" elseif defaultCoalition == 2 then coal = "Blue" else coal = "How the fuck did you make a neutral?" end
      local line = "Type: " .. name .. ", Role: " .. role .. ", Coalition: " .. coal .. "\n"
      messageString = messageString .. line 
    end
  end
  BASE:T("[MARK_SPAWN] OPTIONS: " .. messageString)
  local DCSUnit = mark.initiator
  if(DCSUnit) then
    --local group = unit:GetGroup()
    local unit = UNIT:Find(DCSUnit)
    local group = unit:GetGroup()
    MESSAGE:New(messageString,30):ToGroup(group)
  else
    local coal = mark.coalition
    BASE:T(coal)
    MESSAGE:New(messageString,30):ToCoalition(coal)
  end
end

--stolen from moose, cred to them
function _Heading(course)
  local h
  if course<=180 then
    h=math.rad(course)
  else
    h=-math.rad(360-course)
  end
  return h 
end
  
function MLSkillCheck(skill)
  if(skill == nil) then
    return nil
  end

  skill = skill:upper()
  if(skill == "AVERAGE") then
    return skill
  elseif(skill == "NORMAL") then
    return skill
  elseif(skill == "GOOD") then
    return skill
  elseif(skill == "HIGH") then
    return skill
  elseif(skill == "EXCELLENT") then
    return skill
  elseif(skill == "RANDOM") then
    return skill
  else
    return nil
  end

end
  
--[[ 

function deleteDeterminator(stringCompare, considerCoal, entry)
  if(stringCompare) then
    if(considerCoal) then
      if(considerCoal == entry.group:GetCoalition()) then
        --BASE:T("[MARK_SPAWN] string/coal compare pass")
        return true
      else
        --BASE:T("[MARK_SPAWN] Coal compare fail")
        return false
      end
    else
      --BASE:T("[MARK_SPAWN] String Compare, no coalition")
      return true
    end
  else
    -- BASE:T("[MARK_SPAWN] String Compare Fail")
    return false  
  end
end
  
function magVarDeterminator()
  local magVar = 0
  local theater = env.mission.theatre
  if(theater == "Caucasus") then
    --is Georgia
    magVar = -6
  elseif(theater == "Nevada") then
    --is Nevada
    magVar = -12
  elseif(theater == "Normandy") then
    --is Normandy
    magVar = 2
  elseif(theater == "PersianGulf") then
    --is Persian Gulf
    magVar = -2
  else
    magVar = 0
  end
  return magVar
end
  
function MLCreateTGT(tgtName,pos,radius)
  local tgt = {}
  tgt.name = tgtName
  tgt.pos = pos
  tgt.radius = radius or 100
  tgt.zone = ZONE_RADIUS:New( tgtName .. "Zone", COORDINATE:NewFromVec3(SpawnTable.pos):GetVec2(), tgt.radius )
  tgt.units = MLPopulateTGT(tgt)
  MLTgtArrayAdd(tgt)
end
  
function MLPopulateTGT(tgt)
  local zone = tgt.zone
  local curratedUnits
  zone:scan(1)
  local units = zone:GetScannedUnits()
  BASE:T({units})
  for idx, unit in pairs(units) do
    local unitCategory = unit:GetDCSObject():GetCategory()
    if(unitCategory == "UNIT") then
      local unitSensors = unit:GetDCSObject():getSensors()
      local hasRadar = false
      for idx, sensor in pairs(unitSensors) do
        if(sensor.type == 1) then
          hasRadar = true
        end
      end
      if(hasRadar and unit:IsAlive()) then
        curratedUnits:insert({unit = unit, radarUnit = true})
      end
    elseif(unitCategory == "FORTIFICATION" and unit:IsAlive()) then
      curratedUnits:insert({unit = unit, structure = true})
    end
  end
    
  return curratedUnits
end
  
function MLReturnTGT(tgt)
  
end
  
function MLTgtArrayAdd(tgt)
  MLTgtArray:insert(tgt)
  if(#MLTgtArray > 5) then
    table.remove(MLTgtArray, 1)
  end
end
  
function MLTgtArrayRemove(tgt)

end

s = "MLCMD SPAWN: MIG27, ALT: 180, HDG: 180, TASK: CAP, SKILL: GOOD"
_, _, value, value2 , value3 = string.find(s, "SPAWN:%s(%w*)")
print(value, value2, value3)
_, _, value = string.find(s, "HDG: (%d+)")
print(value)

--  ]]

--- END MARK SPAWN