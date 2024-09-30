::    WSL_QuickSetup
::    Copyright (C) 2024  Maurício Sardinha
::
::    This program is free software: you can redistribute it and/or modify
::    it under the terms of the GNU General Public License as published by
::    the Free Software Foundation, either version 3 of the License, or
::    (at your option) any later version.
::
::    This program is distributed in the hope that it will be useful,
::    but WITHOUT ANY WARRANTY; without even the implied warranty of
::    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
::    GNU General Public License for more details.
::
::    You should have received a copy of the GNU General Public License
::    along with this program.  If not, see <https://www.gnu.org/licenses/>.

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