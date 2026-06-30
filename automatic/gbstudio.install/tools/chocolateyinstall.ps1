$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.2/gb-studio-windows-32bit-installer.zip'
  checksum      = '332eb2b9bad8c8c7952c160d8110983b028b9363e4a14f6809f9a2b2d474f8cf'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.2/gb-studio-windows-64bit-installer.zip'
  checksum64    = '980eb4a336cf2f14c00e9055e5d50b5c9d334ba5338e3980093b3806a05b6c26'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
