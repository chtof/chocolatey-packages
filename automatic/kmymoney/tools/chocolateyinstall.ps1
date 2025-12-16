$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-5038-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '14dfe7d68a64338c7b86e657a4613662e6d837008ef58fee2bd0adb715ce54e3'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
