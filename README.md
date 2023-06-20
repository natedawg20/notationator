# Introduction 
CLI script for taking quick time-stamped notes

# Getting Started
1. Download the latest (main/stable) release as a `.zip` file
2. Extract/Unzip the downloaded file
3. Open PowerShell and navigate to the script folder (`cd notationator/`)
4. If on Windows, verify `Execution Policy` Allows you to run scripts
   	- Open a new PowerShell window
   	- Type `Get-ExecutionPolicy`
   	- If `RemoteSigned` or `Restricted`, Type `Unblock-File ./notationator/Notationator.ps1`
   	 	- Reference [Microsoft's](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3#example-7-unblock-a-script-to-run-it-without-changing-the-execution-policy) guide for unblocking files and additional information
   	- __NEVER__ unblock a PowerShell script unless you know **__EXACTLY__** what it does!! Malicious software or scripts can be disguised as .ps1 files, so it's __dangerous__ to blindly run any scripts whether they're known or not. Always read over the script in your preferred text editor (Notepad on Windows, Notepad++, micro, vim, etc.) before running!
6. If on Windows, right-click the `notationator.ps1` file > Click `Run with PowerShell`
7. If on Linux, type `./notationator/Notationator.ps1`
8. Type your notes and press Enter for a new line
9. Once finished, type `exit` or `quit` (or one of the lines in `quit-commands` without a leading `#`) and the folder containing the notes is opened
10. Open the completed txt file to view your notes. 
   
# Contribute
Please submit issues and/or features through GitHub
