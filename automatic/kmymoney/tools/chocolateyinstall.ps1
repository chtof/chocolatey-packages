$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-4652-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = '29e76e327ee4d9c1c7d5313704edf3bfdc396937dd73c54fa78660e9538cf89d'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
