$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-4984-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'd5847f4dbf8b510b3ff9848dd7c4fc89a2bae9015e594624bdf75fda436e5e38'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
