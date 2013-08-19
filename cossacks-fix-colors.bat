:: Start Cossacks with Mod 1 enabled and colors fixed

@ECHO OFF

net session >nul 2>&1
if %errorLevel% == 0 (
    GOTO ADMIN_OK
) else (
    GOTO NO_ADMIN
)

:NO_ADMIN
echo Error: file run without administartor permissions.
echo Please right-click on the script and select "Run as administrator"
PAUSE
exit

:ADMIN_OK
echo Success: Administrative permissions confirmed.

set COSSACKS_DIR=%~dp0

taskkill /f /im explorer.exe

START /wait "" "%COSSACKS_DIR%"\clancher.exe

:LOOP
tasklist /nh /fi "IMAGENAME eq dmcr.exe" | find /i "dmcr.exe" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO CONTINUE
) ELSE (
  SLEEP 2
  GOTO LOOP
)

:CONTINUE
start explorer.exe
