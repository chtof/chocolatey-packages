$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  file          = "$toolsDir\tcl-8.6.16-installer-1.16.0-x86.msi"
  filetype      = 'MSI'
  file64        = "$toolsDir\tcl-8.6.16-installer-1.16.0-x64.msi"
  filetype64    = 'MSI'

  silentArgs    = "ALLUSERS=1 APPLICATIONFOLDER=C:\Progra~1\Tcl /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyInstallPackage @packageArgs
