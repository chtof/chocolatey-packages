$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\wsjtz-3.0.0-2.0.18-win32.exe"
  file64      = "$toolsDir\wsjtz-3.0.0-2.0.18-win64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
