$ErrorActionPreference = 'Stop'
$packageName= 'kmymoney'

$packageArgs = @{
  packageName    = $packageName    
  url64          = 'https://cdn.kde.org/ci-builds/office/kmymoney/5.2/windows/kmymoney-5.2-5888-windows-cl-msvc2022-x86_64.exe'  

  checksumType   = 'sha256'
  checksum64     = 'a99099adc3ab71fdc45b507a435134b4a18ae1769657c35878b5d23fcd247874'
  checksumType64 = 'sha256'
  
  silentArgs     = '/S'
}

Install-ChocolateyPackage @packageArgs
