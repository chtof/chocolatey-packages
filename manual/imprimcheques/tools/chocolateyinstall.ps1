$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'ImprimChèques *'

  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = "$toolsDir\\imprimcheques\\Install_ImprChq.exe"
  
  url           = 'https://lalimacefolle.com/download/imprimcheques.zip'  
  checksum      = '19f2aa876a1ddf91a167d66b0ea07efd03f0566cd6116b8d7090cac997a5b5d0'
  checksumType  = 'sha256'
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

# ImprimChèques needs "Print Spooler" enabled and running to be installed
if ((Get-WmiObject -Query "Select StartMode From Win32_Service Where Name='Spooler'").StartMode -eq "Disabled") {
  Write-Warning "The Windows service `"Print Spooler`" is being enabled (Needed to install ImprimCheques)"
  Set-Service -Name 'Spooler' -StartupType Automatic
}
if ((Get-Service -Name 'Spooler').Status -ne "Running") {
  Write-Warning "The Windows service `"Print Spooler`" is being started (Needed to install ImprimCheques)"  
  Start-Service -Name 'Spooler'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs