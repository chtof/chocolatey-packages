$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.1/gb-studio-windows-32bit-installer.zip'
  checksum      = '43f18369cd75b404b8b880615b6feced9b0b904df2f3b940d8d4c89a6b71585e'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.1/gb-studio-windows-64bit-installer.zip'
  checksum64    = '5f5532f771e8456cba45b10affa3eb550923642696a028ae0ea0a536dd5e7cc3'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
