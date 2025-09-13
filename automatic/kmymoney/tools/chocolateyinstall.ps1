$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-4767-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '7bc6f05dd837ae75de7d3ddd82f5930a14970134178c7a5f68f363d8fa35385a'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
