$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-6063-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '97dd4a85a03669514a115b6466705d6744282dff5ccc2dd536252ca946878357'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
