$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\GNS3-2.2.48.1-all-in-one.exe"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs

$process = Get-Process gns3 -ErrorAction SilentlyContinue
if ($process) { $process | Stop-Process }
