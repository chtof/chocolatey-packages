$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

<#$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  destination  = "$toolsDir"
  fileFullPath = "$toolsDir\AutoDarkMode_v3_Setup.zip"  
}#>

if ( [environment]::OSVersion.Version.Major -ne 10 )  {
  Write-Warning 'Skipping installation because Auto Dark Mode supports only Windows 10.'
  return
}

#Get-ChocolateyUnzip @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\AutoDarkModeX_10.4.2.29_x86.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
