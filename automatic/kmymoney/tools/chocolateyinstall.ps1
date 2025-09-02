$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-4708-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '53f844a1f1b12a1189e2e04cae748fc6659f5632638025b6904c699f7825daf0'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
