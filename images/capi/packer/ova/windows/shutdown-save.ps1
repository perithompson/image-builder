$packerWindowsDir = 'C:\Windows\packer'
New-Item -Path $packerWindowsDir -ItemType Directory -Force

# final shutdown command
$shutdownCmd = @"
netsh advfirewall firewall set rule name="WinRM-HTTP" new action=block

C:/windows/system32/sysprep/sysprep.exe /generalize /oobe /quiet /shutdown
"@

Set-Content -Path "$($packerWindowsDir)\PackerShutdown.bat" -Value $shutdownCmd

New-Item -Path 'C:\Windows\Setup\Scripts' -ItemType Directory -Force
Set-Content -path "C:\Windows\Setup\Scripts\SetupComplete.cmd" -Value $setupComplete
