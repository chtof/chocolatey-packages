$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\LyX-240-Installer-1-x64.exe"
  file64      = "$toolsDir\LyX-240-Installer-1-x64.exe"
  silentArgs  = '/S'
}

Install-ChocolateyInstallPackage @packageArgs
