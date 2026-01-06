$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://download.xnview.com/XnShellEx.zip'
  checksum      = '6076cecf861e10f3474abb72b9ec70e1b8b58840cfa99bb1914792bc569752cf'
  checksumType  = 'sha256'
  
  url64         = 'https://download.xnview.com/XnShellEx64.zip'
  checksum64    = '374bee3b88a49ab10c962acda728ba90f0a3a56d53b5a2e2dd9a2482eedfd3d1'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process 'regsvr32' -ArgumentList "/s $toolsDir\XnShellEx\XnViewShellExt64.dll"
