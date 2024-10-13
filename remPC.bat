:START
@echo off
set /P "OLDCompName=Please enter the OLD computer name: "
set /P "NEWCompName=Please enter the NEW computer name: "

set /P "PPASWORD=Please enter the Password: "
cls
netdom renamecomputer %OLDCompName% /newname:%NEWCompName% /userd:CLALIT\%USERNAME% /passwordd:%PPASWORD% /usero:CLALIT\%USERNAME% /passwordo:%PPASWORD% /reboot:00 /force

GOTO START