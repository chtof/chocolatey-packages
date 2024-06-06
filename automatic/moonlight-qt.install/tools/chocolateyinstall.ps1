$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\MoonlightSetup-6.0.0.exe"  
  silentArgs	= '/S'
}

Install-ChocolateyInstallPackage @packageArgs
