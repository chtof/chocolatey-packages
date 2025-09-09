$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-4746-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'b6736da18903e2a4b945158a6b4eca436f938f8b82831f2487b0f22de90f24b4'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
