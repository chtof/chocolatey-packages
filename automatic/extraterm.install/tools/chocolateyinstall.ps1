﻿$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\extratermqt-setup-0.81.3.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
