$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.2.2/gb-studio-windows-32bit-installer.zip'
  checksum      = 'eb5832495de79193a5dbbd1fd24e173d49b38a9dca9b5b72b7d372d66f6809ee'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.2.2/gb-studio-windows-64bit-installer.zip'
  checksum64    = '412f3b90677b5dae491b18db6a64232578025a9b3f1541378561dab699f845df'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
