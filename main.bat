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
if not "!pass!"=="aids" goto end

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
echo                             ║ (1) Log Book          (4) Trace IP     ║
echo                             ║                                        ║
echo                             ║ (2) Ip Ping           (5) My Ip        ║
echo                             ║                                        ║
echo                             ║ (3) Doxxing Tools     (6) Trace DNS    ║
echo                             ║                                        ║
echo                             ╠════════════════════════════════════════╣
echo                             ║ (0) Exit  (R) Next Page   (99) Update  ║
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
if "%input%"=="r" goto start2
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
echo                             ║ (3) Dox Page Maker                     ║
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
if "%input%"=="3" goto doxmaker
if "%input%"=="r" goto start
goto Doxxing


:start2
cls
mode 100,35
title GIMME V2
call :banner
echo                             ╔════════════════════════════════════════╗
echo                             ║ (1) Coming soon!                       ║
echo                             ║                                        ║
echo                             ║                                        ║
echo                             ║                                        ║
echo                             ║                                        ║
echo                             ║                                        ║
echo                             ╠════════════════════════════════════════╣
echo                             ║ (0) Exit  (R) Prev. Page               ║
echo                             ╚════════════════════════════════════════╝                                 
echo.
echo.
set /p input=">> "
if "%input%"=="0" exit
if "%input%"=="1" goto discorselfbot
if "%input%"=="r" goto start
goto start2






rem FUNTIONS --------------------------------------------


Rem FIX THIS -----------------------------------------------------

:update
mode 100,80
setlocal

REM Set the repository URL
set "repoURL=https://github.com/GIGGAhacker/GIMME-V2.git"

REM Set the path to your script
set "scriptPath=%~dp0"

REM Check if the directory is a Git repository
cd %scriptPath%
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo [[96mGIMME V2[0m] Not a Git repository. Cloning...
    rmdir /s /q %scriptPath%
    git clone %repoURL% %scriptPath%
) else (
    echo [[96mGIMME V2[0m] Git repository found. Checking for updates...
    git fetch --quiet

    REM Check if the update was successful
    cd %scriptPath%
    if exist README.md (
        echo [[96mGIMME V2[0m] Your script is up to date
    ) else (
        echo [[96mGIMME V2[0m] Failed to update the script. Please check your internet connection and try again.
        goto end
    )

    REM Check if any updates were found
    git diff-index --quiet HEAD --
    if errorlevel 1 (
        REM Prompt user for update confirmation
        echo [[96mGIMME V2[0m] Do you want to update? This will lose log data. [Y or N]
        set /p choice= 
        if /i "%choice%"=="Y" (
            echo [[96mGIMME V2[0m] Updating...
            git reset --hard HEAD
            echo [[96mGIMME V2[0m] Update successful!
        ) else (
            echo [[96mGIMME V2[0m] Update canceled. Exiting...
            goto end
        )
    ) else (
        echo [[96mGIMME V2[0m] You are all up to date.
    )
)

:end
endlocal
pause
goto start



rem ------------------------------------------------------------------

:doxmaker
cls
call :banner
echo                              ╔═════════════════════════════╗
echo                              ║  please answer all questions║
echo                              ╚═════════════════════════════╝
echo.
echo [[96mGIMME V2[0m] Hello! Enter the name of the target
set /p targetname="[%Username%]>> "
echo [[96mGIMME V2[0m] Do you have %targetname%'s IP? [Y or N]
set /p y-n="[%Username%]>> "
if "%y-n%"=="n" goto con1
echo [[96mGIMME V2[0m] Enter %targetname%'s IP
set /p ip="[%Username%]>> "
:con1
echo [[96mGIMME V2[0m] Perfect! Do you have other info on %targetname% [Y or N]
set /p y/n="[%Username%]>> "
if "%y/n%"=="n" goto show
mode 100,50
echo [[96mGIMME V2[0m] Ok. Type a combination of these numbers. Enter every number for info you have.
echo 1 = Roblox info
echo 2 = Discord info
echo 3 = Zip/Postal code
echo 4 = address
echo 5 = credit card info
echo 6 = phone number 
echo 7 = photos
echo Example (127) You have to enter the info for the numbers
echo.
set /p combination="[%Username%]>> "

:: Handle all combinations using a loop and conditional statements
setlocal enabledelayedexpansion
for /L %%i in (0, 1, 6) do (
    set "char=!combination:~%%i,1!"

    if !char! equ 1 (
        echo [[96mGIMME V2[0m] Enter Roblox username and password like "User:sadqwfsd Pass:1234"
        set /p robloxinfo="[%Username%]>> "
    )
    if !char! equ 2 (
        echo [[96mGIMME V2[0m] Enter Discord Username like "username or username#1234"
        set /p discordname="[%Username%]>> "   
    )
    if !char! equ 3 (
        echo [[96mGIMME V2[0m] Enter %targetname%'s Zip/Postal code like "90210" - that's Beverly Hills
        set /p zip/postal="[%Username%]>> "    
    )
    if !char! equ 4 (
        echo [[96mGIMME V2[0m] Enter %targetname%'s Address like "230 buckweet dr"
        set /p address="[%Username%]>> "    
    )
    if !char! equ 5 (
        echo [[96mGIMME V2[0m] Enter %targetname%'s credit card info like "1312336216123 CVV:123"
        set /p cc="[%Username%]>> "    
    )
    if !char! equ 6 (
        echo [[96mGIMME V2[0m] Enter %targetname%'s phone number like "415394824485"
        set /p pn="[%Username%]>> "    
    )
    if !char! equ 7 (
        echo [[96mGIMME V2[0m] Enter %targetname%'s pic like "link.com"
        set /p photo="[%Username%]>> "   
    )
)

endlocal



mode 100,35

:show
cls
echo.
echo.
echo [[96mGIMME V2[0m] This is the completed dox! Feel free to copy and paste this.
echo.
echo. 
echo                      ██████╗  ██████╗ ██╗  ██╗██╗  ██╗███████╗██████╗ 
echo                      ██╔══██╗██╔═══██╗╚██╗██╔╝╚██╗██╔╝██╔════╝██╔══██╗
echo                      ██║  ██║██║   ██║ ╚███╔╝  ╚███╔╝ █████╗  ██║  ██║ 
echo                      ██║  ██║██║   ██║ ██╔██╗  ██╔██╗ ██╔══╝  ██║  ██║ 
echo                      ██████╔╝╚██████╔╝██╔╝ ██╗██╔╝ ██╗███████╗██████╔╝
echo                      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ 
echo                         Made with github.com/GIGGAhacker/GIMME-V2
echo.
echo Name: %targetname%
echo IP: %ip%
echo Roblox Info: %robloxinfo%
echo Discord Name: %discordname%
echo Zip/Postal Code: %zip/postal%
echo Address: %address%
echo Credit Card Info: %cc%
echo Phone Number: %pn%
echo Photo: %photo%
echo.
echo.
pause 
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
mode 100,35
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
