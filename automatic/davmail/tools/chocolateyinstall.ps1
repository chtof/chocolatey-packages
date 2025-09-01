$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\davmail-6.4.0-3755-setup.exe"
  file64      = "$toolsDir\davmail-6.4.0-3755-setup64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
