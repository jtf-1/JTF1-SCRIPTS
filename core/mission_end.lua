env.info( "*** [JTF-1] MISSION SCRIPTS END ***" )

if MISSIONINIT then 
    _msg = "MISSIONINIT object already exists!"
    BASE:E(_msg)
end
