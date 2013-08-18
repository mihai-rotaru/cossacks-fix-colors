:: Start Cossacks with Mod 1 enabled and colors fixed

@ECHO OFF
set COSSACKS_DIR=%~dp0

taskkill /f /im explorer.exe

START /wait "" "%COSSACKS_DIR%"\clancher.exe modmode=cmo

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
