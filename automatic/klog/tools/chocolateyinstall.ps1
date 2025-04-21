$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'KLog'
  fileType      = 'exe'
  file64        = "$ToolsDir\KLog-2.4.0-win64.exe"
  silentArgs    = "--mode unattended"
}

Install-ChocolateyPackage @packageArgs
