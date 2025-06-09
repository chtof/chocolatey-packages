$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file64      = "$toolsDir\gp603-win64-mingw.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /MERGETASKS="modifypath"'
}

Install-ChocolateyInstallPackage @packageArgs
