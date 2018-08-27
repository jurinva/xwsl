# Install X server
Invoke-WebRequest -Uri https://datapacket.dl.sourceforge.net/project/xming/Xming/6.9.0.31/Xming-6-9-0-31-setup.exe -OutFile $env:USERPROFILE\Downloads\Xming-6-9-0-31-setup.exe
cd $env:USERPROFILE\Downloads
Xming-6-9-0-31-setup.exe /silent /norestart
C:\Program Files (x86)\Xming\XLaunch.exe

# Enable WSL and restart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
restart-computer

# Get Appx
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing

