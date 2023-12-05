:update
@echo off
mode 100,80
setlocal enabledelayedexpansion

REM Set the GitHub repository link
set "repoLink=https://github.com/GIGGAhacker/GIMME-V2"

REM Set the path to your script
set "scriptPath=%~dp0"

REM Generate the repository URL by appending ".git" if not present
set "repoURL=!repoLink!"
if not "!repoURL:~-4!"=="\.git" set "repoURL=!repoURL!.git"

echo [DEBUG] repoLink: !repoLink!
echo [DEBUG] repoURL: !repoURL!

REM Check if the directory is a Git repository
if exist "%scriptPath%\.git" (
    echo [GIMME V2] Git repository found. Checking for updates...

    REM Set the working directory to the scriptPath
    pushd %scriptPath%

    REM Debugging: Capture the output of Git fetch command
    git fetch --quiet

    REM Set the working directory back to the original path
    popd

    REM Check if the update was successful
    if exist README.md (
        REM Check if any updates were found
        git -C %scriptPath% diff-index --quiet HEAD --

        REM Check if the fetch and diff commands were successful
        if %errorlevel% equ 0 (
            if %errorlevel% equ 1 (
                echo [GIMME V2] Updating...
                git -C %scriptPath% reset --hard HEAD
                echo [GIMME V2] Update successful!
                pause
                exit /b
            ) else (
                echo [GIMME V2] Already up to date.
            )
        ) else (
            echo [GIMME V2] Failed to check for updates. Please check your internet connection and try again.
        )
    ) else (
        echo [GIMME V2] Failed to update the script. Please check your internet connection and try again.
    )
) else (
    echo [GIMME V2] Not a Git repository. Exiting...
    pause
    exit /b
)

:end
endlocal
pause
goto start
