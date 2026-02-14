$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.2.1/gb-studio-windows-32bit-installer.zip'
  checksum      = 'aabd5c92d59fde860b7029d5fb7eb1608eeb29b221752acde6dec934399c23bf'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.2.1/gb-studio-windows-64bit-installer.zip'
  checksum64    = '3f0758d0464139c5858f268bec2975c419bbf4eb9efb77a6a68f7d47ecf105fc'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
