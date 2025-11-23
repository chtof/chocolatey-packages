$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']){
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\flrig-2.0.09_setup.exe"
  silentArgs  = $silentArgs
}

Install-ChocolateyInstallPackage @packageArgs
