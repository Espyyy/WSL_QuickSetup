@ECHO OFF

call logo.bat

:: Attempt to launch Ubuntu and run config_Ubuntu.sh in bash
wsl -d Ubuntu -- bash -c "./config_Ubuntu.sh"

:: Check the exit code of the wsl command, if error code -1, install distro
if %ERRORLEVEL% equ -1 (
    echo Installing Ubuntu in WSL
    echo.
    echo -------------------------------------------------
    echo Setup up your UNIX account to finish instalation.
    echo -------------------------------------------------
    wsl --install -d Ubuntu --no-launch
    wsl -d Ubuntu -- bash -c "./config_Ubuntu.sh"

    goto end

) else (
    :: If 0, Successful
    if %ERRORLEVEL% equ 0 (
        goto end

    ) else (
        :: If not -1 or 0, Unknow Error
        echo Unknow Error
        pause
        exit /b 1
    )
)

:end
echo Setup was Successful
wsl -d Ubuntu