$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\dexed-0.9.7-win.zip"
}

Get-ChocolateyUnzip @packageArgs

$exe_file = (Get-ChildItem -Recurse $toolsDir\dexed-*-win.exe).fullname | Select -First 1

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName  
  fileFullPath = "$exe_file"
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
