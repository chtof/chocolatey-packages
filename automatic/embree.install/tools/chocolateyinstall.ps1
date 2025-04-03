$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  filetype    = 'ZIP'
  destination = "$toolsDir"
  file64      = "$toolsDir\embree-4.4.0.x64.windows.zip"  
}

Get-ChocolateyUnzip @packageArgs
Remove-Item -Path $packageArgs.file64
