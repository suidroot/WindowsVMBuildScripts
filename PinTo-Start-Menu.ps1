
# Original function from: https://appuals.com/pin-unpin-application-windows-10/
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

Pin-App "Windows PowerShell"
Pin-App "CMDer"
Pin-App "x32dbg"
Pin-App "x64dbg"
Pin-App "Ghidra"
Pin-App "procexp"
Pin-App "procmon"
Pin-App "dnSpy"
Pin-App "dnSpy-x86"
Pin-App "die"
Pin-App "HxD"
Pin-App "Sublime Text 3"

Pin-Taskbar-App "cmder"

New-Item -ItemType SymbolicLink -Target "C:\Program Files\x64dbg" -Path "C:\Users\IEUser\Desktop\x64bdg_directory"
mkdir C:\Users\IEUser\Desktop\GhidraDb

cd C:\Users\IEUser\Desktop
rm eula.lnk
rm README.txt
rm -rf PS_Transcripts