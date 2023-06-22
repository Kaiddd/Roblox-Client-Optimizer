@echo off

echo.
echo RCO was created and is maintained by L8X.
echo (C) L8X 2022 - Present, All Rights Reserved.
echo.

echo.
echo Starting RCO installation...
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://roblox-client-optimizer.simulhost.com/ClientAppSettings.json', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS: RCO installation completed!
) else (
    echo Failed to download ClientAppSettings.json. Please report this issue in the #help-me channel of the Discord server.
    echo.
    echo ERROR: RCO installation failed!
)

echo.
echo NOTE:
echo.
echo 1. Run this script every time there is an update announcement in the Discord server or when Roblox updates!
echo.
echo 2. If you need help, use the #help-me channel in the Discord server!
echo.
echo 3. To uninstall RCO at any time, run RCO-Uninstaller.cmd!
echo.
echo.
echo Press any key to continue... & pause >nul