$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.1/gb-studio-windows-32bit-installer.zip'
  checksum      = '3cb73b4f56f1ef81b06e65707b2e24ccb90fc93aabac6f9e17dfb694c0f7ef63'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.1/gb-studio-windows-64bit-installer.zip'
  checksum64    = 'de2701ca0e56dc3880584184f674d2517ed2b5e2ed0a11bb454c28d02009a3db'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
