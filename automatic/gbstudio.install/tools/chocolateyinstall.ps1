$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.0.0/gb-studio-windows-32bit-installer.zip'
  checksum      = '801944a9690bf4b6e494e723c2dd38726c2957466bdc85caf93be1185632ccaa'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.0.0/gb-studio-windows-64bit-installer.zip'
  checksum64    = 'e8894cbf032823773e46501e22a59423a6809aeec891f6a8538441324247e190'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
