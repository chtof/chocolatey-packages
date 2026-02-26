$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-5332-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'dc997c232657e14a908ce31a46403d8eb5502c7ec197765a0abda7b48f67529d'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
