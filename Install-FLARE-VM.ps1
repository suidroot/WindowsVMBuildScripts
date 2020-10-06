#####################
#
# Install FLARE-VM
# This Script Starts in the FLARE-VM Install
# - Intended to be run by Vagrant
# - There will be errors displayed by Vagrant at the end when the Reboot is called
#####################
	
## Setup Auto logon
#$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
#$DefaultUsername = "IEUser"
#$DefaultPassword = "Passw0rd!"
#Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String 
#Set-ItemProperty $RegPath "DefaultUsername" -Value "$DefaultUsername" -type String 
#Set-ItemProperty $RegPath "DefaultPassword" -Value "$DefaultPassword" -type String

## Start Flare Install
$flare_download = "https://github.com/fireeye/flare-vm/archive/master.zip"
$password = "Passw0rd!"
$working_dir=$PWD
#$working_dir = "C:\Users\IEUser\Desktop"
$download_file = "$working_dir\flare.zip"

Write-Host "Downloading $flare_download"
(New-Object Net.WebClient).DownloadFile($flare_download, $download_file);

Write-Host "Extracting $download_file to $working_dir"
Expand-Archive $download_file -DestinationPath $working_dir

Write-Host "Setting Execution Policy"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process -Force

Write-Host "Running FLARE-VM Installer"
cd "$working_dir\flare-vm-master"
.\install.ps1 -password $password 


