$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file64      = "$toolsDir\Release-26.02.0-0.zip"  
}
Get-ChocolateyUnzip @packageArgs

Remove-Item $packageArgs.file64