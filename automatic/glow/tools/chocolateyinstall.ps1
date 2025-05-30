$ErrorActionPreference = 'Stop';
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\glow_2.1.1_Windows_i386.zip"
  file64        = "$toolsDir\glow_2.1.1_Windows_x86_64.zip"
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file
Remove-Item -Path $packageArgs.file64
