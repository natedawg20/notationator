# Notes with Timestamp
# Use this script to take notes, and add a date and timestamp to each new line


$Host.ui.RawUI.WindowTitle="The Notationator"   # Names the running Powershell window
$Date = Get-Date -Format "MM-dd-yyyy HHmm"      # Variable used for the file 'Header'. Might make that a user-changable feature
Clear-Host
Write-Host -ForegroundColor Green $Date
$StartTime = (Get-Date -Format "hh:mm tt MM-dd-yyyy")  # Start time for the $Duration calculation at the end (line 42), DIFFERENT from the "$Date" variable above
if ((Test-Path .\Notes) -like $false)                  # Tests if 'Notes' folder exists in the current directory of the script...
{                                                      
    New-Item -ItemType Directory .\Notes > $null       # If it is, it continues. If not, it creates a new folder called 'Notes'
    Write-Output "Created folder called 'Notes'"
}
else 
{
    Write-Output "'Notes' Folder already exists...Continuing`n"
}
Write-Output "Enter your notes, and hit ENTER for a new line.
Type 'q' or 'exit' then press ENTER to quit`n"

$FileName = ".\Notes\$([Environment]::UserName) Notes - $Date.txt"
Get-Date -Format "(MM-dd-yyyy)`n" | Out-File -NoNewline -Append "$FileName"
try
{
    while($true)                                        # maybe change $true to a variable that can be set/unset as needed in the program?
    {
        ${Note} = Read-Host -Prompt "Enter your note"    # Variable used to store user's note/input. Stored in {} to force pwsh to ignore special characters
        if ($Note -in (Get-Content .\quit-commands))
        {
			break
        }
        Get-Date -Format "hh:mm tt CST - "| Out-File -NoNewline -Append "$FileName"
        Write-Output $Note                | Out-File -NoNewline -Append "$FileName"
        Write-Output "`n"                 | Out-File -NoNewline -Append "$FileName"
    }
}
finally
{
    $EndTime = (Get-Date -Format "hh:mm tt MM-dd-yyyy") # Used for '$Duration' calculation as the final "footer" line. Start time is at the top
    $Duration = New-TimeSpan -Start $StartTime -End $EndTime
    Write-Output "`n`n=============== End of Notes! ===============`n`nStart time: $StartTime`nEnd time: $EndTime`n`nDuration is $($Duration.Hours) Hours $($Duration.Minutes) Minutes" | Tee-Object -Append -FilePath $FileName
    # ^^ Line above is used to write an "End of Notes" footer message at the very bottom of the notes file. Also writes total time the script was open
    Write-Host "Opening location where notes are stored"
    Start-Process explorer.exe .\Notes
}
