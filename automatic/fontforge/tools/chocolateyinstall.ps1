$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file64        = "$toolsDir\FontForge-2025-10-09-Windows-x64.exe"
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}


$installed = Get-UninstallRegistryKey -SoftwareName 'FontForge version *'

If ($installed) {
  # Upgrade
  Write-Host "Upgrading..."
  Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyUpgrade.ahk`""  
}

Install-ChocolateyInstallPackage @packageArgs  




