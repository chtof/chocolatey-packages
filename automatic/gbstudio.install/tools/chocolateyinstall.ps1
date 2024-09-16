$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.3/gb-studio-windows-32bit-installer.zip'
  checksum      = '4a54fce94b8ffb90887c2d27d9ed7695f94934b85415ee2d69f00e246dcc83e9'
  checksumType  = 'sha256'
  
  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.3/gb-studio-windows-64bit-installer.zip'
  checksum64    = '51611cb8eb2255fc3931c24e31eb10ca252d35550672445059650affdc7a6eb1'
  checksumType64= 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = (Get-ChildItem "$toolsDir\*\GB Studio-* Setup.exe").FullName
  silentArgs  = '--silent'
}
Install-ChocolateyInstallPackage @packageArgs
