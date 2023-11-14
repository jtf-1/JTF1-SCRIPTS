env.info( "[JTF-1] missionsrs.lua" )
--
-- Send messages through SRS using STTS
--
-- Two files are used by this module;
--     missionsrs.lua
--     missionsrs_data.lua
--
-- 1. missionsrs.lua
-- Core file. Contains functions, key values and GLOBAL settings.
--
-- 2. missionsrs_data.lua
-- Contains settings that are specific to the miz.
-- Optional. If not use, uncomment MISSIONSRS:Start() at the end of this file.
-- If used, MISSIONSRS:Start() in this file MUST be commented out.
--
-- For custom settings to be used, load order in miz MUST be;
--     1. missionsrs.lua
--     2. missionsrs_data.lua
--
-- If the missionsrs_data.lua is not used the defaults for srs_path and srs_port will be used.
--
-- Message text will be formatted as a SOUNDTEXT object.
-- 
-- Use MISSIONSRS:SendRadio() to transmit on SRS
--
-- msgText        - [required] STRING. Text of message. Can be plain text or a MOOSE SOUNDTEXT obkect
-- msfFreqs       - [optional] STRING. frequency, or table of frequencies (without any spaces). Default freqs AND modulations will be applied if this is not specified.
-- msgModulations - [optional] STRING. modulation, or table of modulations (without any spaces) if multiple freqs passed. Ignored if msgFreqs is not defined. Default modulations will be applied if this is not specified
--

MISSIONSRS = {}

MISSIONSRS = {
  srsPath = "C:/PROGRA~1/DCS-SimpleRadio-Standalone", -- default path to SRS install directory if setting file is not avaialable "C:/Program Files/DCS-SimpleRadio-Standalone"
  srsPort = 5002,                                          -- default SRS port to use if settings file is not available
  msg = "No Message Defined!",                             -- default message if text is nil
  freqs = {243,251,327,377.8,30},                          -- transmit on guard, CTAF, NTTR TWR, NTTR BLACKJACK and 30FM as default frequencies
  modulations = {AM,AM,AM,AM,FM},                          -- default modulation (count *must* match qty of freqs)
  vol = "1.0",                                             -- default to full volume
  name = "Server",                                         -- default to server as sender
  coalition = 0,                                           -- default to spectators
  vec3 = nil,                                              -- point from which transmission originates
  speed = 2,                                               -- speed at which message should be played
  gender = "female",                                       -- default gender of sender
  culture = "en-US",                                       -- default culture of sender
  voice = "",                                              -- default voice to use
}

local _msg

function MISSIONSRS:Start()
  local useSRS = JTF1.useSRS
  if useSRS == false then
    _msg = "[JTF-1 MISSIONSRS] Server SRS is OFF!"
    BASE:E(_msg)
  end
  self.srsPath = JTF1.srsPath or self.srsPath
  self.srsPort = JTF1.srsPort or self.srsPort
  self:AddRadio()
  BASE:T({"[JTF-1 MISSIONSRS]",{self}})
end

function MISSIONSRS:AddRadio()
  self.Radio = MSRS:New(self.srsPath, self.freqs, self.modulations)
  self.Radio:SetPort(self.srsPort)
  self.Radio:SetGender(self.gender)
  self.Radio:SetCulture(self.culture)
  self.Radio.name = self.name
  self.Radio.active = true
end

function MISSIONSRS:SendRadio(msgText, msgFreqs, msgModulations)

  BASE:T({"[JTF-1 MISSIONSRS] SendRadio", {msgText}, {msgFreqs}, {msgModulations}})
  if msgFreqs then
    BASE:T("[JTF-1 MISSIONSRS] tx with freqs change.")
    if msgModulations then
      BASE:T("[JTF-1 MISSIONSRS] tx with mods change.")
    end
  end
  if msgText == (nil or "") then 
    msgText = self.msg
  end
  local text = msgText
  local tempFreqs = msgFreqs or self.freqs
  local tempModulations = msgModulations or self.modulations
  if not msgText.ClassName then
    BASE:T("[JTF-1 MISSIONSRS] msgText NOT SoundText object.")
    text = SOUNDTEXT:New(msgText) -- convert msgText to SOundText object
  end
  self.Radio:SetFrequencies(tempFreqs)
  self.Radio:SetModulations(tempModulations)
  self.Radio:PlaySoundText(text)
  self.Radio:SetFrequencies(self.freqs) -- reset freqs to default
  self.Radio:SetModulations(self.modulations) -- rest modulation to default

end

--MISSIONSRS:Start() -- uncomment if missionsrs_data.lua is not used
