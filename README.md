# Domain Computer Renamer

## Overview
This batch script automates the process of renaming a computer in a domain. It requires user input for the old computer name, new computer name, username, password, and domain. The script then uses `netdom` to perform the rename operation and reboots the computer immediately.

## Script Breakdown
1. **Start and Set Parameters:**
   Prompts the user to enter the old computer name, new computer name, username, password, and domain.
   ```batch
   @echo off
   set /P "USERNAME=Please enter the Username: "
   set /P "PASSWORD=Please enter the Password: "
   set /P "DOMAIN=Please enter the Domain: "
   cls
   ```

2. **Rename Computer Using `netdom`**: Renames the computer and reboots it to apply the changes.
   ```batch
   :START
   set /P "OLDCompName=Please enter the OLD computer name: "
   set /P "NEWCompName=Please enter the NEW computer name: "
   cls
   netdom renamecomputer %OLDCompName% /newname:%NEWCompName% /userd:%DOMAIN%\%USERNAME% /passwordd:%PASSWORD% /usero:%DOMAIN%\%USERNAME% /passwordo:%PASSWORD% /reboot:00 /force
   ```

3. **Loop**: Repeats the process for another computer name change.
   ```batch
   goto START
   ```

## Usage

1. **Run the Script**: Execute the script in an elevated Command Prompt session.
   ```batch
   .\domain-computer-renamer.bat
   ```

## License
This script is licensed under the MIT License. See the LICENSE file for details.


