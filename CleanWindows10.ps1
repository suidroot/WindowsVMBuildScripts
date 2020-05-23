function Pin-App { 
    param(
        [string]$appname,
        [switch]$unpin
    )
    try {
        if ($unpin.IsPresent) {
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'From "Start" UnPin|Unpin from Start'} | %{$_.DoIt()}
            return "App '$appname' unpinned from Start"
        } else {
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'To "Start" Pin|Pin to Start'} | %{$_.DoIt()}
            return "App '$appname' pinned to Start"
        }
    } catch {
        Write-Error "Error Pinning/Unpinning App! (App-Name correct?)"
    }
}

function Pin-Taskbar-App { 
    param(
        [string]$appname,
        [switch]$unpin
    )
    try {
        if ($unpin.IsPresent){
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'From "Taskbar" UnPin|Unpin from taskbar'} | %{$_.DoIt()}
            return "App '$appname' unpinned from Taskbar"
        } else {
            ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'To "Taskbar" Pin|Pin to taskbar'} | %{$_.DoIt()}
            return "App '$appname' pinned to Taskbar"
        }
    } catch {
        Write-Error "Error Pinning/Unpinning App! (App-Name correct?)"
    }
}

Write-Host "Disable Store Autoupdate"
reg add HKLM\SOFTWARE\Policies\Microsoft\WindowsStore /v AutoDownload /t REG_DWORD /d 2
#Restart-Computer

Write-Host "Uninstall Builtin Apps"
Get-AppxPackage *3dbuilder* | Remove-AppxPackage
Get-AppxPackage *windowsalarms* | Remove-AppxPackage
Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage
Get-AppxPackage *windowscamera* | Remove-AppxPackage
Get-AppxPackage *officehub* | Remove-AppxPackage
Get-AppxPackage *skypeapp* | Remove-AppxPackage
Get-AppxPackage *getstarted* | Remove-AppxPackage
Get-AppxPackage *zunemusic* | Remove-AppxPackage
Get-AppxPackage *windowsmaps* | Remove-AppxPackage
Get-AppxPackage *bingfinance* | Remove-AppxPackage
Get-AppxPackage *zunevideo* | Remove-AppxPackage
Get-AppxPackage *bingnews* | Remove-AppxPackage
Get-AppxPackage *onenote* | Remove-AppxPackage
Get-AppxPackage *people* | Remove-AppxPackage
Get-AppxPackage *windowsphone* | Remove-AppxPackage
Get-AppxPackage *photos* | Remove-AppxPackage
Get-AppxPackage *bingsports* | Remove-AppxPackage
Get-AppxPackage *soundrecorder* | Remove-AppxPackage
Get-AppxPackage *bingweather* | Remove-AppxPackage
Get-AppxPackage *xboxapp* | Remove-AppxPackage
Get-AppxPackage *sway* | Remove-AppxPackage
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage *Whiteboard* | Remove-AppxPackage
Get-AppxPackage *Todos* | Remove-AppxPackage
Get-AppxPackage *MixedReality* | Remove-AppxPackage
Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
Get-AppxPackage *NetworkSpeedTest* | Remove-AppxPackage
Get-AppxPackage *YourPhone* | Remove-AppxPackage
Get-AppxPackage *Microsoft3DViewer* | Remove-AppxPackage
Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage
Get-AppxPackage *XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxPackage *XboxGameOverlay* | Remove-AppxPackage
Get-AppxPackage *Print3d* | Remove-AppxPackage
Get-AppxPackage *MicrosoftStickyNotes* | Remove-AppxPackage
Get-AppxPackage *GetHelp* | Remove-AppxPackage
Get-AppxPackage *OfficeLens* | Remove-AppxPackage

Write-Host "Remove Start Items"
Pin-App "Mail" -unpin
#Pin-App "Store" -unpin
Pin-App "Calendar" -unpin
Pin-App "Microsoft Edge" -unpin
Pin-App "Photos" -unpin
Pin-App "Cortana" -unpin
Pin-App "Weather" -unpin
#Pin-App "Phone Companion" -unpin
#Pin-App "Music" -unpin
#Pin-App "xbox" -unpin
Pin-App "movies & tv" -unpin
Pin-App "microsoft solitaire collection" -unpin
#Pin-App "money" -unpin
#Pin-App "get office" -unpin
#Pin-App "onenote" -unpin
#Pin-App "news" -unpin
Pin-App "Sway" -unpin
Pin-App "Microsoft To Do" -unpin
Pin-App "OneNote for Windows 10" -unpin
Pin-App "Network Speed Test" -unpin
Pin-App "Microsoft News" -unpin
Pin-App "Remote Desktop" -unpin
Pin-App "Microsoft Whiteboard" -unpin
Pin-App "Calculator" -unpin
Pin-App "Maps" -unpin
Pin-App "Groove Music" -unpin
Pin-App "Xbox Console Companion" -unpin
Pin-App "Office Lens" -unpin
Pin-App "Office" -unpin
Pin-App "Microsoft Store" -unpin
Pin-App "Voice Recorder" -unpin
Pin-App "Alarms & Clock" -unpin
Pin-App "Sticky Notes" -unpin
Pin-App "Skype" -unpin

Write-Host "Remove Taskbar items"
Pin-Taskbar-App "Microsoft Store" -unpin
Pin-Taskbar-App "Mail" -unpin


#Restart-Computer