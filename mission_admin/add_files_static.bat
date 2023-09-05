::
:: Copy Files from dynamic to static folders
::

ECHO OFF
SETLOCAL ENABLEEXTENSIONS

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
SET input_file_name=static_files.txt
ECHO Input file name:      %input_file_name%
:: output path
SET output_path=%parent%static\
ECHO Output path:           %output_path%
ECHO ----------------------------

:: Initialise build file & log
ECHO STATIC FILE COPY STARTED: %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%T%TIME% > %log%
ECHO: >> %log%
:: Copy dynamic files
for /F %%f in (%input_path%%input_file_name%) do (
    ECHO Adding file: %input_path%%%f >> %log%
    COPY %input_path%%%f %output_path%%%f
)
ECHO ----------------------------

:: Close log
ECHO: >> %log%
ECHO STATIC FILE COPY FINISHED: %DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%T%TIME% >> %log%
ECHO Copy complete.

PAUSE
EXIT /B %ERRORLEVEL%
