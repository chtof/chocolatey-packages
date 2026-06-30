$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file64      = "$toolsDir\davmail-6.8.1-4210-setup64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
