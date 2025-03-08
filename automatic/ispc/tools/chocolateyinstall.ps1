$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

<#$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType    = 'MSI'

  file        = "$toolsDir\ispc-v1.25.1-windows.zip"
  silentArgs   = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOOC=0"
}#>

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  destination = "$toolsDir"
  file        = "$toolsDir\ispc-v1.25.1-windows.zip"  
}

Get-ChocolateyUnzip @packageArgs
