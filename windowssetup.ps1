# Install X server
# if you want to start all command in one line use semicolon as separator
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$path = Invoke-WebRequest "https://sourceforge.net/projects/xming/best_release.json" | ConvertFrom-Json | select -expand platform_releases | select -expand windows | select -ExpandProperty filename
#e.g. $path = Xming/6.9.0.31/Xming-6-9-0-31-setup.exe
Invoke-WebRequest -Uri https://datapacket.dl.sourceforge.net/project/xming/$path -OutFile $env:USERPROFILE\Downloads\Xming-setup.exe
cd $env:USERPROFILE\Downloads
.\Xming-setup.exe /silent /norestart
C:\Program Files (x86)\Xming\XLaunch.exe

# Enable WSL and restart
Enable-WindowsOptionalFeature -NoRestart -Online -FeatureName Microsoft-Windows-Subsystem-Linux
restart-computer

# Get Appx
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing
