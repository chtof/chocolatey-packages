$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file64        = "$toolsDir\SpeedCrunch-1.1-windows-x64.exe"
  silentArgs	  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
