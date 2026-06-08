$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.0/gb-studio-windows-32bit-installer.zip'
  checksum      = 'a0e9f60937ae4d74a9060c41363ca7c90f63c2e3d89fc809f0b5d7cec4d28698'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.0/gb-studio-windows-64bit-installer.zip'
  checksum64    = 'f12f1106a0b375484855b1d6f2bfab69ee9911be3e73ce63c7beee1ed74fff18'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
