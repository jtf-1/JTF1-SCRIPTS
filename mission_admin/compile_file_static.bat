::
:: Compile dynamic mission script into a static file.
::

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS
SETLOCAL EnableDelayedExpansion 

:: name of this file for message output
SET me=%~n0
:: folder in which this file is being executed
SET parent=%~dp0
:: log file to output build results
SET log=%parent%logs\%me%.log


:: input path
SET input_path=%parent%dynamic\
ECHO Input path:            %input_path%
:: input file name
SET input_file_name=compile_files.txt
ECHO Output file name:      %input_file_name%
:: output path
SET output_path=%parent%static\
ECHO Output path:           %output_path%
:: output file name
SET output_file_name=mission_static.lua
ECHO Output file name:      %output_file_name%
ECHO ----------------------------

:: Initialise build file & log
ECHO STATIC FILE COMPILE STARTED: %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%T%TIME% > %log%
ECHO: >> %log%
:: initialise output file
TYPE nul > %output_path%%output_file_name% 
:: add output file header
ECHO  env.info^("[JTF-1] STATIC FILE BUILD %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%T%TIME%"^) >> %output_path%%output_file_name% 
:: compile input files into output file
for /F %%f in (%input_path%%input_file_name%) do (
    ECHO %input_path%%%f
    ECHO Adding file: %input_path%%%f >> %log%
    ECHO: >> %output_path%%output_file_name% 
    ECHO: >> %output_path%%output_file_name% 
    ECHO --------------------------------%%f-------------------------------- >> %output_path%%output_file_name%
    ECHO: >> %output_path%%output_file_name%
    ECHO: >> %output_path%%output_file_name%
    TYPE %input_path%%%f  >> %output_path%%output_file_name%
)
ECHO ----------------------------

:: Close log
ECHO. >> %log%
ECHO MISSION FILE COMPILE FINISHED: %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%T%TIME% >> %log%
ECHO Mission Compile finished.

PAUSE
EXIT /B %ERRORLEVEL%
