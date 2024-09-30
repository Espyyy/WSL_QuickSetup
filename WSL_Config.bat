@ECHO OFF

call logo.bat

:: Attempt to run a basic wsl command to check if WSL is installed
wsl --list >nul 2>&1

:: Check the exit code of the wsl command
if %ERRORLEVEL% neq 0 (
    echo Installing WSL-Ubuntu
    echo.
    echo -------------------------------------------------------------------------------------
    echo Please complete the installation in the WSL terminal by setting up your UNIX account
    echo After defining your UNIX username and password, RUN THE UNIX 'logout' COMMAND!
    echo -------------------------------------------------------------------------------------
    wsl --install -d Ubuntu
    wsl ./config_Ubuntu.sh

    goto end

) else (
    echo WSL-Ubuntu is already installed, booting up
    echo.
    wsl ./config_Ubuntu.sh
    echo.
    echo WSL Ready!
    echo.
)
:end
wsl