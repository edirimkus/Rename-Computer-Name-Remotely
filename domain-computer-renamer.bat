@echo off
REM Prompt for username, password, and domain at the beginning
set /P "USERNAME=Please enter the Username: "
set /P "PASSWORD=Please enter the Password: "
set /P "DOMAIN=Please enter the Domain: "
cls

:START
REM Prompt for old and new computer names
set /P "OLDCompName=Please enter the OLD computer name: "
set /P "NEWCompName=Please enter the NEW computer name: "
cls

REM Check if any of the inputs are empty
if "%OLDCompName%"=="" (
    echo Old computer name cannot be empty.
    goto START
)
if "%NEWCompName%"=="" (
    echo New computer name cannot be empty.
    goto START
)

REM Rename the computer using netdom with specified domain
netdom renamecomputer %OLDCompName% /newname:%NEWCompName% /userd:%DOMAIN%\%USERNAME% /passwordd:%PASSWORD% /usero:%DOMAIN%\%USERNAME% /passwordo:%PASSWORD% /reboot:00 /force

REM Clear screen and output status
cls
echo Computer %OLDCompName% renamed to %NEWCompName% and rebooted.

REM Repeat process
goto START
