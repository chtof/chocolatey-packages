$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName

  filetype    = "MSI"
  file        = "$toolsDir\wireguard-x86-1.0.1.msi"
  file64      = "$toolsDir\wireguard-amd64-1.0.1.msi"

  silentArgs  = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" DO_NOT_LAUNCH=1"  
}

Install-ChocolateyInstallPackage @packageArgs
