$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file64      = "$toolsDir\davmail-7.0.0-4403-setup64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
