$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = '/S'

$pp = Get-PackageParameters
if ($pp['DIR']){
  $silentArgs += " /D=`"$($pp['DIR'])`""
}

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'exe'
  file        = "$toolsDir\fldigi-4.2.05_setup.exe"
  silentArgs  = "$silentArgs"
}

Install-ChocolateyInstallPackage @packageArgs
