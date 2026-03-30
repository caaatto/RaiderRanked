@echo off
REM Run standalone RaiderRanked tests.
REM Requires Lua 5.4: https://luabinaries.sourceforge.net/

where lua >/dev/null 2>&1
if %errorlevel% neq 0 (
    echo Lua not found in PATH.
    echo Install from: https://luabinaries.sourceforge.net/
    echo Or via Scoop:  scoop install lua
    echo Or via winget: winget install -e --id DEVCOM.Lua
    pause
    exit /b 1
)

lua "%~dp0test_ranksystem.lua"
pause
