$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-5087-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'ff100f3a17916fe72bbd430806b09b94122678402ad13e00bc76bfd32002588a'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
