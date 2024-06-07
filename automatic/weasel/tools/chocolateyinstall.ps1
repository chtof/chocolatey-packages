$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = '/S'

$pp = Get-PackageParameters

# /T - install as a Traditional Chinese IME (zh_TW locale)
if ($pp['T'] -eq 'true') { $silentArgs += ' /T' }

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\weasel-0.16.1.0-installer.exe"
  silentArgs  = "$silentArgs"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
