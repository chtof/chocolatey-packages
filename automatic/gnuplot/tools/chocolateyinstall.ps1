$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file64      = "$toolsDir\gp604-win64-clang.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /MERGETASKS="modifypath"'
}

Install-ChocolateyInstallPackage @packageArgs
