@echo off
chcp 65001 >nul
mode 100,35
cd files >nul


:administratorCheck
cls
@echo off
:: Check if the script is run as administrator
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"

:: If the error level is 0, the script is run as administrator
if %errorlevel% EQU 0 (
    goto Password
    
) else (
	mode 100,30
	color 6
	echo.
	echo.
    echo Run it as administrator lil bro. 
	echo.
	echo (Right click "main.bat" then "Run as administrator"
	echo.
	echo.
	echo.
    pause
    exit
)



rem PASSWORD PROTECTION --------------------------

:Password
if exist "%~dp0files\PasswordCorrect.txt" goto start


:Passwordcheck
title Password
mode 55,3
cls
color 07
echo.
set /p "pass=What's the password lil bro: "
if not "!pass!"=="aids" goto :FAIL
goto :end

:FAIL
cls
echo.
echo.
echo (type "i suck" to retry the pass or any key to CLOSE)
set /p input=
if /i "%input%"=="i suck" goto Password
exit

:end
cls
echo.
echo Logged in as [%Username%]
timeout /nobreak /t 1 >nul
goto setup

if not exist "%~dp0files\" (
	echo Wait lil bro I gotta set everything up 
	timeout /nobreak /t 1 >nul
	goto setup
) else (
    goto start
)

:setup
mode 100,35
title Setup
set success=[92m[+][0m
set warning=[91m[!][0m
set info=[94m[*][0m
set servicename=winrm%random%
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
mkdir "%~dp0files\"
echo. > "%~dp0files\IPLogs.txt"
echo. > "%~dp0files\symbols.txt"
echo GIMME V2 password = %pass% > "%~dp0files\PasswordCorrect.txt"
mkdir "%~dp0files\symbols"

(
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠋⠉⠉⠉⠉⠙⠛⠛⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⢀⡠⠴⠒⠚⠙⠒⠢⢤⡀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⡴⠋⢠⣾⣦⡀⣠⣿⣧⡀⠹⡄⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⢸⠀⢀⣿⣿⢿⣿⣿⣿⣿⣷⡀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⣼⣿⡏⠀⠙⠃⠈⣿⣿⣷⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢣⣙⣛⣁⣀⣀⣀⣀⣈⣉⣁⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠓⠢⢤⡀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⢀⣠⠖⠋⠀⠀⢀⣀⣠⣤⠤⠤⠤⠤⠤⢤⣄⣀⣀⠀⠀⠀⠈⠓⢦⡀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⡴⠋⠀⢀⡤⠒⠋⣉⣀⣤⣤⠴⠶⠶⠶⠶⠶⢶⣤⣬⣍⡓⠦⢄⡀⠀⠙⣦⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⡞⠀⠠⠚⠁⣠⣾⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⡿⢦⣄⠀⠀⠘⣇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠸⡇⠀⢀⣴⢿⡿⠛⠉⠉⠛⠿⡄⠀⠀⠀⠀⠀⡾⠛⠉⠀⠀⠙⢿⠀⠉⠳⣄⠀⢸⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⢧⣴⠋⠀⠈⠀⠀⡴⠋⣉⡑⠌⠀⠀⠀⠀⠀⡴⣛⣉⠙⢦⡀⠀⠀⠀⠀⠈⣿⠎⠀⣀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠛⢦⠀⠸⡀⠀⠀⠀⢸⠀⣼⡋⠉⣿⡀⠀⠀⠀⢀⡟⠉⢻⣧⠀⠇⠀⠀⠀⠀⢀⠇⢠⡞⠋⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠤⠠⣄⡆⠀⢇⠀⠀⠀⢸⠀⣿⣿⣿⣿⠧⠀⠀⠀⠼⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⡜⠀⢸⣧⠔⠂⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⢀⣨⣧⠀⠸⡄⠀⠀⠀⠃⠘⠿⠋⠀⠀⠀⠀⠀⠀⠀⠙⢿⠏⠀⠀⠀⠀⠀⠀⠣⡄⢸⣯⢄⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠈⠀⠹⡼⠛⠁⢰⣶⣄⡀⢀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣆⠀⠀⠱⡾⠁⠀⠀⣼⣿⣿⠿⠛⠻⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⠋⠀⠀⠙⣿⣿⣿⣿⣆⠀⠀⡀⠀⠀⢻⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢀⣴⣿⣿⠃⠀⠀⠀⠘⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣶⣿⠀⠀⠀⠛⠿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⡟⠋⠁⠀⠀⢠⣷⣶⣿⣿⣿⣿⠀⠀⠀⠀⢠⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠙⠻⠿⠿⢿⣶⣶⣶⣶⣶⣾⣿⣿⠿⠿⠛⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠘⢍⣉⡉⡉⣉⣋⠩⠁⠀⠀⠀⠀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⣸⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢿⠟⠛⠛⣿⣿⣿⣿⣿⣿⣿⠿⠶⢤⡀⠀⠀⠀⠌⣉⣉⣉⠠⠆⠀⠀⢀⣠⢴⣿⣿⣿⣿⣿⣿⣿⠉⠉⠉⢻⠀⠀⠀⠀⠟⢿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠛⠻⡟⠉⠀⢘⠀⠀⠀⢸⠓⠦⣄⡀⠀⠀⠀⠀⣀⣤⠶⠋⠀⠈⡇⠈⠉⢻⠋⠉⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⡇
echo    ⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⡀⠀⡇⠀⠀⠀⠀⡀⠀⠀⠉⠉⠛⠋⠉⠉⢸⠀⠀⠀⠀⢱⠀⠀⡎⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇
echo    ⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⡇⠀⠀⠀⠀⣇⣀⡀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠘⡄⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⡇
echo    ⣿⣿⣿⣿⣷⡄⠀⠰⡀⢳⡐⣆⠀⠀⠀⠀⠀⢀⡇⠀⣷⠞⠉⠳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠟⠙⠲⣧⠀⢱⡀⠀⠀⠀⠀⠀⡼⠀⡟⢀⠆⠀⢀⣾⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠁⠈⠀⠀⠀⠀⡠⢾⣀⡼⠿⣄⣀⣴⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣄⣀⣠⡿⢆⡈⣟⠢⡀⠀⠀⠀⠁⠈⠀⠈⣀⣴⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣤⣄⣀⣀⣥⣴⣿⣿⠃⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠉⠀⠈⢿⣿⣷⣦⣤⣤⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠁⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣤⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
echo    ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
) > "%~dp0files\symbols\mariowithdubblemiddlefinger.txt"


rem Menus  -----------------------------------------

:start
cls
mode 100,35
title GIMME V2
call :banner
echo                             ╔════════════════════════════════════════╗
echo                             ║ (1) Log Book          (4) IP Info      ║
echo                             ║                                        ║
echo                             ║ (2) Ip Ping           (5) My Ip        ║
echo                             ║                                        ║
echo                             ║ (3) Doxxing Tools     (6) Trace DNS    ║
echo                             ║                                        ║
echo                             ╠════════════════════════════════════════╣
echo                             ║ (0) Exit   (R) Restart    (99) Update  ║
echo                             ╚════════════════════════════════════════╝                                 
echo.
echo.
set /p input=">> "
if "%input%"=="0" exit
if "%input%"=="1" goto logBook
if "%input%"=="2" goto IPping
if "%input%"=="3" goto Doxxing
if "%input%"=="4" goto iplookup
if "%input%"=="5" ( 
	start "" "https://ipinfo.io/json"
	goto start
)
if "%input%"=="6" goto tracedns
if "%input%"=="r" goto start
if "%input%"=="99" goto update


goto start

:Doxxing
cls
title Doxxing Tools
call :banner 
echo                             ╔════════════════════════════════════════╗
echo                             ║ (1) Dox Text Conv.                     ║
echo                             ║                                        ║
echo                             ║ (2) Symbols                            ║
echo                             ║                                        ║
echo                             ║                                        ║
echo                             ║                                        ║
echo                             ╠════════════════════════════════════════╣
echo                             ║ (0) Exit  (R) Main Menu   (99) Credits ║
echo                             ╚════════════════════════════════════════╝                                 
echo.
echo.
set /p input=">> "
if "%input%"=="0" exit
if "%input%"=="1" goto doxtext
if "%input%"=="2" goto doxsymbols
if "%input%"=="r" goto start


goto Doxxing



rem FUNTIONS --------------------------------------------

:update
set gitcommit=b50f73163262e121a55ba2b2a967fd14331b7687
set GimmeVersion=%gitcommit%/main
set project=Gimme V2

set your_update_source=https://raw.githubusercontent.com/GIGGAhacker/GIMME-V2/main

powershell -nologo -noprofile -command "Invoke-WebRequest '%your_update_source%/updates.txt' -OutFile '%CD%\files\path\updates.txt'"
set /p updatescommit=<"%CD%\files\path\updates.txt"

if not !updatescommit! == %gitcommit% (
    goto updatereliant
) else (
    echo [%project%] No updates found, starting %project%...
    goto checks
)

:updatereliant
powershell -nologo -noprofile -command "Invoke-WebRequest '%your_update_source%/GIMME.bat' -OutFile '%CD%\files\path\GIMME-New.bat'"
powershell -nologo -noprofile -command "Invoke-WebRequest '%your_update_source%/changelog.txt' -OutFile '%CD%\Files\changelog.txt'"REM Changed the path to save changelog.txt in %~dp0Files\

echo [%project%] Update Downloaded, restarting...
if exist "files\settings\update.txt" (
    break>"files\settings\update.txt"
    echo 1 >> "files\settings\update.txt"
)
del "files\path\updates.txt"
start cmd /k "GIMME-New.bat"
timeout /t 3 /nobreak >nul
del "files\path\GIMME.bat"
exit

:checks
title %project% (%GimmeVersion%)
if exist "files\settings\" (
    del /f "files\path\updates.txt"
    goto welcome
) else (
    goto setup
    del "files\path\updates.txt"
)

goto start



:tracedns
cls
call :banner
echo                                          ╔══════╗
echo                                          ║  IP  ║
echo                                          ╚══════╝
set /p ip=">> "
cls
call :banner
for /f "tokens=2 delims= " %%a in ('nslookup %ip% ^| find "Name"') do set dns=%%a
echo                                      ╔══════════════╗
echo                                      ║  Domain Name ║
echo                                      ╚══════════════╝
echo.
echo.
echo : %dns%
echo.
pause
goto start




:doxsymbols
cls
call :banner
echo                              ╔══════════════════════════════╗
echo                              ║ Type the corresponding code  ║
echo                              ║  for the symbol. "b" = back  ║
echo                              ╚══════════════════════════════╝
echo.
echo.
echo ============================================================
echo     "01" for Mario with double middle finger
echo ============================================================
echo.
echo.
set /p input=">> "

if "%input%"=="01" (
	mode 100,70
	call :banner 
	type "%~dp0files\symbols\mariowithdubblemiddlefinger.txt"
	echo.
	echo Copy and past the text where ever you want 
	pause 
	echo.
	goto doxsymbols
)

goto Doxxing


:doxtext
cls
call :banner
echo                           ╔══════════════════════════════════════╗
echo                           ║        Enter text to convert         ║ 
echo                           ║  (On website you can change font or  ║
echo                           ║ enter "y" when asked for ANSI Shadow)║
echo                           ╚══════════════════════════════════════╝
echo.
echo.
echo                                          ╔══════╗
echo                                          ║ Text ║
echo                                          ╚══════╝
set /p name=">> " 
if "%name%"=="b" goto Doxxing
echo.
echo Do you want "%name%" in ANSI Shadow font?
set /p font="[Y or N] " (
if "%font%"=="y" goto run
) ELSE (
  goto runsimple
)

:run
set "font=ANSI Shadow"
set "url=https://patorjk.com/software/taag/#p=display&f=%font%&t=%name%"
start "" "%url%"
goto Doxxing

:runsimple
set "url=https://patorjk.com/software/taag/#p=display&f=Graffiti&t=%name%"
start "" "%url%"
goto Doxxing



:IPping
cls 
title Ip Ping
call :banner
echo                                             ╔══════╗
echo                                             ║  IP  ║
echo                                             ╚══════╝
echo.
set /p IP=">> "
if "%IP%"=="b" goto start
call :loading
cls
title Ip Ping
call :banner
:pingg
PING -n 1 %IP% | FIND "TTL=">nul
IF ERRORLEVEL 1 goto e
IF NOT ERRORLEVEL 1 goto a

:e
echo  [41;37m%IP%[40;35m is offline
goto pingg

:a
echo  [41;37m%IP%[40;32m is online
goto pingg





:logBook
cls
title Log Book
call :banner
echo                               ╔═════════════════════════════════════╗
echo                               ║  Enter "1" to open Logs, "b" to go  ║
echo                               ║      back, and "t" for Tutorial     ║
echo                               ╚═════════════════════════════════════╝
echo.                              
echo.                              
echo                                             ╔══════╗
echo                                             ║ Name ║
echo                                             ╚══════╝
set /p name=">> "                  
echo.                              
if %name% == 1 goto open           
if %name% == b goto start          
echo.                              
echo.                                            ╔══════╗      
echo                                             ║  IP  ║
echo                                             ╚══════╝
echo.                              
set /p IP=">> "                    
if %IP% == b goto logBook           
echo.                              
echo.                              
echo                                           ╔══════════╗
echo                                           ║ Preview? ║
echo                                           ╚══════════╝
echo.
set /p preview="[Y or N] "
if /i "%preview%"=="y" (
	echo --------------------------------------------------------------------------------
    echo --  %name%  //  %IP%  \\  -  //  %date%  at  %time%  \\
	echo --------------------------------------------------------------------------------
    set /p confirm="Save? [Y or N] "
    if /i "%confirm%"=="y" goto saveEntry
)  

:saveEntry
echo --  %name%  //  %IP%  \\  -  //  %date%  at  %time%  \\>> "%~dp0Files\IPLogs.txt"
echo.
echo {+}- %name%'s Info Saved in Your Database -{+}
echo {+}- Press Any Key to Restart IP Logs -{+}
pause >nul
goto logBook


:open
cls
call :banner
type "%~dp0Files\IPLogs.txt"
echo.
echo.
echo                                 ╔══════════════════════════════════╗
echo                                 ║ Type "b" to go back to Main Menu ║
echo                                 ╠══════════════════════════════════╣
echo                                 ║      Clear all data? [Y or N]    ║  
echo                                 ╚══════════════════════════════════╝
echo.
echo.
set /p input=">> "
if "%input%"=="b" goto start
echo.
set /p final="[41mAre you sure?[0m [Y or N] "
if /i "%final%"=="y" (
    echo. > "%~dp0Files\IPLogs.txt"
)
goto start

:iplookup
cls
echo.
call :banner
echo.
echo.
echo                                   ╔══════════════════════╗
echo                                   ║ Type an IP to lookup ║
echo                                   ╚══════════════════════╝
set ip=127.0.0.1
set /p ip=">> " 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs


:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
rem echo Msgbox HTTPGET,vbSystemModal+vbOKOnly+vbInformation, "IP Info" >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
set /a requests=%requests% + 1
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menu
:response_exist
cls
echo.
echo.
call :banner
echo.
for /f "delims= 	" %%i in ('findstr /i "ip hostname city region country loc org postal" %temp%\response.txt') do (
	set data=%%i
	set data=!data:,=!
	set data=!data:""=Not Listed!
	set data=!data:"=!
	set data=!data:ip:=IP:		!
	set data=!data:hostname:=Hostname:	!
	set data=!data:city:=City:		!
	set data=!data:region:=State:	!
	set data=!data:country:=Country:	!
	set data=!data:loc:=Location:	!
	set data=!data:org:=ISP:		!
	set data=!data:postal:=Postal:	!
	echo !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
goto start




rem CALL FUNCTIONS ---------------------------------------

:banner
echo.
echo.
echo [96m                   ██████╗ ██╗███╗   ███╗███╗   ███╗███████╗    ██╗   ██╗██████╗ 
echo [96m                  ██╔════╝ ██║████╗ ████║████╗ ████║██╔════╝    ██║   ██║╚════██╗
echo [96m                  ██║  ███╗██║██╔████╔██║██╔████╔██║█████╗      ██║   ██║ █████╔╝
echo [96m                  ██║   ██║██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝      ╚██╗ ██╔╝██╔═══╝ 
echo [96m                  ╚██████╔╝██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗     ╚████╔╝ ███████╗
echo [96m                   ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝      ╚═══╝  ╚══════╝
echo.                        
echo [96m                       ---------------------------------------------------[0m
echo                         ░ ▒▓ ░▒▓░░ ▒▓ ░▒▓░░ ▒▓ ░▒▓░░ ▒▓ ░▒▓░░ ▒▓ ░▒▓░░ ▒▓ 
echo                           ░▒ ░ ▒░  ░▒ ░ ▒░  ░▒ ░ ▒░  ░▒ ░ ▒░  ░▒ ░ ▒░  ░▒  
echo                           ░░   ░   ░░   ░   ░░   ░   ░░   ░   ░░   ░   ░░   
echo                            ░        ░        ░        ░        ░        ░        
echo.                             
echo.
exit /b

:loading
title Loading
call :l1
timeout /nobreak /t 1 >nul
title Loading.
call :l2
timeout /nobreak /t 1 >nul
title Loading..
call :l3
timeout /nobreak /t 1 >nul
title Loading...                             
exit /b                                    

:l1                                        
cls                                        
call :banner                                     
echo                                             loading.
exit /b                                    

:l2                                        
cls                                        
call :banner                                      
echo                                             loading..
exit /b                                     

:l3                                        
cls                                        
call :banner                                      
echo                                             loading...
exit /b                           