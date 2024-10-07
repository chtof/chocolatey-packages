$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

<#if ( [environment]::OSVersion.Version.Major -ge 10 )  {
    $file64_win10 = "$toolsDir\pyzo-4.9.0-win64-windows10.exe"    
    $file64       = $file64_win10
} else {
  $file64_win7 = "$toolsDir\pyzo-4.9.0-win64-windows7.exe"
  $file64      = $file64_win7
}#>

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file64      = "$toolsDir\pyzo-4.17.0-win64.exe"
  silentArgs  = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyInstallPackage @packageArgs
