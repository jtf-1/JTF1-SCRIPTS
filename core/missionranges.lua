env.info( "[JTF-1] activeranges.lua" )
--
-- Creates dynamic ranges using group objects with names prefixed with ""ACTIVE_"
-- each object acts as a template and MUST be set to LATE ACTIVATED in the Mission Editor
--
-- Two files are used by this module;
--     activeranges.lua
--     activeranges_data.lua
--
-- 1. activeranges.lua
-- Core file. Contains functions, key values and GLOBAL settings.
--
-- 2. activeranges_data.lua
-- Contains settings that are specific to the miz.
-- Optional. If not use, uncomment MISSIONRANGES:Start() at the end of this file.
-- If used, MISSIONRANGES:Start() in this file MUST be commented out.
--
-- For custom settings to be used, load order in miz MUST be;
--     1. activeranges.lua
--     2. activeranges_data.lua
--
-- If the activeranges_data.lua is not used the defaults in activeranges.lua will be used.
--

MISSIONRANGES = {}

MISSIONRANGES.traceTitle = "[JTF-1] "
MISSIONRANGES.version = "0.1"
MISSIONRANGES.ClassName = "MISSIONRANGES"


MISSIONRANGES.default = {
  rangeRadio = "377.8",
  useSRS = true,
}
local _msg
local useSRS

MISSIONRANGES.menu = {}
--MISSIONRANGES.rangeRadio = "377.8"
MISSIONRANGES.menu.menuTop = MENU_COALITION:New(coalition.side.BLUE, "Active Ranges")
  
function MISSIONRANGES:Start()	
	_msg = "[JTF-1 MISSIONRANGES] Start()."
	BASE:T(_msg)
	self.rangeRadio = self.rangeRadio or self.default.rangeRadio
	self.SetInitActiveRangeGroups = SET_GROUP:New():FilterPrefixes("ACTIVE_"):FilterOnce() -- create list of group objects with prefix "ACTIVE_"
	self.SetInitActiveRangeGroups:ForEachGroup(
		function(group)
			MISSIONRANGES:initActiveRange(group, false) -- [group] group object for target, [true/false] refresh or create
		end
	)
end

--- Spawn ACTIVE range groups.
-- @function initActiveRange
-- @param #table rangeTemplateGroup Target spawn template GROUP object
-- @param #string refreshRange If false, turn off target AI and add menu option to activate the target
function MISSIONRANGES:initActiveRange(rangeTemplateGroup, refreshRange)
	local initGroupName = rangeTemplateGroup:GetName()
	_msg = "[JTF-1 MISSIONRANGES] initActiveRange()."
	BASE:T({_msg, initGroupName, refreshRange})

	local rangeTemplate = rangeTemplateGroup.GroupName
	local activeRange = SPAWN:New(rangeTemplate)

	if refreshRange == false then 
		activeRange:InitAIOnOff(false) -- turn off AI if we're not resfreshing an already active target
	end

	activeRange:OnSpawnGroup(
		function (spawnGroup)
			local rangeName = spawnGroup:GetName()
			local rangePrefix = string.sub(rangeName, 8, 12)
			if refreshRange == false then
				MISSIONRANGES:addActiveRangeMenu(spawnGroup, rangePrefix)
			end
		end
		, refreshRange 
	)

	local rangeGroup = activeRange:Spawn()

	--local rangeGroup = activeRange:GetLastAliveGroup()
	rangeGroup:OptionROE(ENUMS.ROE.WeaponHold)
	rangeGroup:OptionROTEvadeFire()
	rangeGroup:OptionAlarmStateGreen()
	rangeGroup:SetAIOnOff(false)
	return rangeGroup
end

--- Add menus for range target.
-- @function addActiveRangeMenu
-- @param #table rangeGroup Target group object
-- @param #string rangePrefix Range prefix
function MISSIONRANGES:addActiveRangeMenu(rangeGroup, rangePrefix)
	_msg = "[JTF-1 MISSIONRANGES] addActiveRangeMenu()."
	BASE:T(_msg)

	local rangeIdent = string.sub(rangePrefix, 1, 2)
	
	if MISSIONRANGES.menu["rangeMenuSub_" .. rangeIdent] == nil then
		MISSIONRANGES.menu["rangeMenuSub_" .. rangeIdent] = MENU_COALITION:New(coalition.side.BLUE, "R" .. rangeIdent, MISSIONRANGES.menu.menuTop)
	end
	
	MISSIONRANGES.menu["rangeMenu_" .. rangePrefix] = MENU_COALITION:New(coalition.side.BLUE, rangePrefix, MISSIONRANGES.menu["rangeMenuSub_" .. rangeIdent])
	MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate " .. rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.activateRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], false )
	
	local samTemplate = "SAM_" .. rangePrefix
	
	if GROUP:FindByName(samTemplate) ~= nil then
		MENU_COALITION_COMMAND:New(coalition.side.BLUE, "Activate " .. rangePrefix .. " with SAM" , MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.activateRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], true )
	end
	
	--return MISSIONRANGES.menu["rangeMenu_" .. rangePrefix]

end

--- Activate selected range target.
-- @function activateRangeTarget
-- @param #table rangeGroup Target GROUP object.
-- @param #string rangePrefix Range name prefix.
-- @param #table rangeMenu Menu that should be removed and/or to which sub-menus should be added
-- @param #boolean withSam Spawn and activate associated SAM target
-- @param #boolean refreshRange True if target is to being refreshed. False if it is being deactivated.
function MISSIONRANGES:activateRangeTarget(rangeGroup, rangePrefix, rangeMenu, withSam, refreshRange)
	_msg = "[JTF-1 MISSIONRANGES] activateRangeTarget()."
	BASE:T(_msg)
	if refreshRange == nil then
		rangeMenu:Remove()
	MISSIONRANGES.menu["rangeMenu_" .. rangePrefix] = MENU_COALITION:New(coalition.side.BLUE, "Reset " .. rangePrefix, MISSIONRANGES.menu.menuTop)
	end
	rangeGroup:OptionROE(ENUMS.ROE.WeaponFree)
	rangeGroup:OptionROTEvadeFire()
	rangeGroup:OptionAlarmStateRed()
	rangeGroup:SetAIOnOff(true)
	local deactivateText = "Deactivate " .. rangePrefix
	local refreshText = "Refresh " .. rangePrefix
	local samTemplate = "SAM_" .. rangePrefix
	if withSam then
		local activateSam = SPAWN:New(samTemplate)
		activateSam:OnSpawnGroup(
			function (spawnGroup)
			MENU_COALITION_COMMAND:New(coalition.side.BLUE, deactivateText , MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.resetRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], spawnGroup, false)
			MENU_COALITION_COMMAND:New(coalition.side.BLUE, refreshText .. " with SAM" , MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.resetRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], spawnGroup, true)
			local msg = "All players, dynamic target " .. rangePrefix .. " is active, with SAM."
			if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
				MISSIONSRS:SendRadio(msg, MISSIONRANGES.rangeRadio)
			else -- otherwise, send in-game text message
				MESSAGE:New(msg):ToAll()
			end
			--MESSAGE:New("Target " .. rangePrefix .. " is active, with SAM."):ToAll()
			spawnGroup:OptionROE(ENUMS.ROE.WeaponFree)
			spawnGroup:OptionROTEvadeFire()
			spawnGroup:OptionAlarmStateRed()
			end
			, rangeGroup, rangePrefix, rangeMenu, withSam, deactivateText, refreshText
		)
	:Spawn()
	else
		MENU_COALITION_COMMAND:New(coalition.side.BLUE, deactivateText , MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.resetRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], withSam, false)
	if GROUP:FindByName(samTemplate) ~= nil then
		MENU_COALITION_COMMAND:New(coalition.side.BLUE, refreshText .. " NO SAM" , MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.resetRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], withSam, true)
	else
		MENU_COALITION_COMMAND:New(coalition.side.BLUE, refreshText , MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], MISSIONRANGES.resetRangeTarget, MISSIONRANGES, rangeGroup, rangePrefix, MISSIONRANGES.menu["rangeMenu_" .. rangePrefix], withSam, true)
	end
	local msg = "All players, dynamic target " .. rangePrefix .. " is active."
	if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
		MISSIONSRS:SendRadio(msg, MISSIONRANGES.rangeRadio)
	else -- otherwise, send in-game text message
		MESSAGE:New(msg):ToAll()
	end
	-- MESSAGE:New("Target " .. rangePrefix .. " is active."):ToAll()
	end
end

--- Deactivate or refresh target group and associated SAM
-- @function resetRangeTarget
-- @param #table rangeGroup Target GROUP object.
-- @param #string rangePrefix Range nname prefix.
-- @param #table rangeMenu Parent menu to which submenus should be added.
-- @param #bool withSam Find and destroy associated SAM group.
-- @param #bool refreshRange True if target is to be refreshed. False if it is to be deactivated. 
function MISSIONRANGES:resetRangeTarget(rangeGroup, rangePrefix, rangeMenu, withSam, refreshRange)
	_msg = "[JTF-1 MISSIONRANGES] resetRangeTarget()."
	BASE:T(_msg)
	if rangeGroup:IsActive() then
		rangeGroup:Destroy(false)
		if withSam then
			withSam:Destroy(false)
		end
		if refreshRange == false then
			rangeMenu:Remove()
			local reactivateRangeGroup = self:initActiveRange(GROUP:FindByName("ACTIVE_" .. rangePrefix), false )
			reactivateRangeGroup:OptionROE(ENUMS.ROE.WeaponHold)
			reactivateRangeGroup:OptionROTEvadeFire()
			reactivateRangeGroup:OptionAlarmStateGreen()
			local msg = "All players, Target " .. rangePrefix .. " has been deactivated."
			if MISSIONSRS.Radio then -- if MISSIONSRS radio object has been created, send message via default broadcast.
				MISSIONSRS:SendRadio(msg, MISSIONRANGES.rangeRadio)
			else -- otherwise, send in-game text message
				MESSAGE:New(msg):ToAll()
			end
			--MESSAGE:New("Target " .. rangePrefix .. " has been deactivated."):ToAll()
		else
			local refreshRangeGroup = self:initActiveRange(GROUP:FindByName("ACTIVE_" .. rangePrefix), true)
			self.activateRangeTarget(refreshRangeGroup, rangePrefix, rangeMenu, withSam, true)      
		end
	end
end

MISSIONRANGES:Start()

--- END ACTIVE RANGES