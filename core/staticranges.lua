env.info( "[JTF-1] staticranges.lua" )

--
-- Add static bombing and strafing range(s)
--
-- Two files are used by this module;
--     staticranges.lua
--     staticranges_data.lua
--
-- 1. staticranges.lua
-- Core file. Contains functions, key values and GLOBAL settings.
--
-- 2. staticranges_data.lua
-- Contains settings that are specific to the miz.
-- Settings in staticranges_data.lua will override the defaults in the core file.
--
-- Load order in miz MUST be;
--     1. staticranges.lua
--     2. staticranges_data.lua
--

STATICRANGES = {}
STATICRANGES.traceTitle = "[JTF-1 STATICRANGES] "

local _msg

STATICRANGES.default = {
	strafeMaxAlt             = 1525, -- [5000ft] in metres. Height of strafe box.
	strafeBoxLength          = 3050, -- [10000ft] in metres. Length of strafe box.
	strafeBoxWidth           = 366, -- [1200ft] in metres. Width of Strafe pit box (from 1st listed lane).
	strafeFoullineDistance   = 305, -- [1000ft] in metres. Min distance for from target for rounds to be counted.
	strafeGoodPass           = 20, -- Min hits for a good pass.
	--rangeSoundFilesPath      = "Range Soundfiles/" -- Range sound files path in miz
}

function STATICRANGES:Start()
	_msg = self.traceTitle .. "Start()."
	BASE:T(_msg)
	-- set defaults
	self.strafeMaxAlt = self.strafeMaxAlt or self.default.strafeMaxAlt
	self.strafeBoxLength = self.strafeBoxLength or self.default.strafeBoxLength
	self.strafeBoxWidth = self.strafeBoxWidth or self.default.strafeBoxWidth
	self.strafeFoullineDistance = self.strafeFoullineDistance or self.default.strafeFoullineDistance
	self.strafeGoodPass = self.strafeGoodPass or self.default.strafeGoodPass
	-- Parse STATICRANGES.Ranges and build each range
	if self.Ranges then
		_msg = self.traceTitle .. "Add ranges."
		BASE:T({_msg,self.Ranges})
		self:AddStaticRanges(self.Ranges)
	else
		_msg = self.traceTitle .. "No Ranges defined!"
		BASE:E(_msg)
	end
end

function STATICRANGES:AddStaticRanges(ranges)
	_msg = self.traceTitle .. "AddStaticRanges()."
	BASE:T(_msg)
	for rangeIndex, rangeData in ipairs(ranges) do

		-- create RANGE object
		local range = RANGE:New(rangeData.rangeName)
			:DebugOFF()
			:SetMaxStrafeAlt(self.strafeMaxAlt)
			:SetDefaultPlayerSmokeBomb(false)

		-- add range zone if defined
		local rangeZone = ZONE:FindByName(rangeData.rangeZone) or ZONE_POLYGON:FindByName(rangeData.rangeZone)
		if not rangeZone then
			_msg = string.format(self.traceTitle .. "Range Zone for %s not defined!", rangeData.rangeName)
			BASE:E(_msg)
		else
			_msg = string.format(self.traceTitle .. "Add Range Zone %s for %s.", rangeZone:GetName(), rangeData.rangeName)
			BASE:T(_msg)
			range:SetRangeZone(rangeZone)
		end

		-- add groups of targets
		if rangeData.groups ~= nil then 
			_msg = string.format(self.traceTitle .. "Add range groups for %s.", rangeData.rangeName) 
			BASE:T(_msg)
			for tgtIndex, tgtName in ipairs(rangeData.groups) do
				range:AddBombingTargetGroup(GROUP:FindByName(tgtName))
			end
		end
		
		-- add individual targets
		if rangeData.units ~= nil then 
			_msg = string.format(self.traceTitle .. "Add range units for %s.", rangeData.rangeName)
			BASE:T(_msg)
			for tgtIndex, tgtName in ipairs(rangeData.units) do
				range:AddBombingTargets( tgtName )
			end
		end
		
		-- add strafe targets
		if rangeData.strafepits ~= nil then 
			_msg = string.format(self.traceTitle .. "Add range strafe pits for %s.", rangeData.rangeName)
			BASE:T(_msg)
			for strafepitIndex, strafepit in ipairs(rangeData.strafepits) do
				range:AddStrafePit(strafepit, self.strafeBoxLength, self.strafeBoxWidth, nil, true, self.strafeGoodPass, self.strafeFoullineDistance)
			end  
		end

		-- add range radio
		if rangeData.rangeControlFrequency ~= nil then
			_msg = string.format(self.traceTitle .. "Range Control frequency = %.3f for %s.", rangeData.rangeControlFrequency, rangeData.rangeName)
			BASE:T(_msg)
		end

		-- Start the Range
		range:Start()
	end
end

--- END STATIC RANGES