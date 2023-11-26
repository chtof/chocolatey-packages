﻿$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\extratermqt-setup-0.75.0.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
