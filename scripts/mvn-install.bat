@ECHO OFF
cls

ECHO. [%time%] - MVN INSTALL
CD %~dp0
SET CURRENT_APP_DIR=%~dp0
ECHO. [%time%] - CURRENT DIRECTORY: %~dp0
%~d0

CALL D:\app-dev\configure-env.bat

cd /D %CURRENT_APP_DIR%
cd ..
set MAVEN_BATCH_PAUSE=on
mvn install
