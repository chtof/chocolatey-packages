$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'KLog'
  fileType      = 'exe'
  file64        = "$ToolsDir\KLog-2.3.4-win64.exe"
  silentArgs    = "--mode unattended"
}

Install-ChocolateyPackage @packageArgs
