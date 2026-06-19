$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.26/9/64bit/OpenModelica-v1.26.9-64bit.exe'
  checksum64    = 'ede0201609835cb42d2f6d92e4087e528016f26fef23eda5e652e364f8058bee'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
