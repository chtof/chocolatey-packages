$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://build.openmodelica.org/omc/builds/windows/releases/1.27/1/64bit/OpenModelica-v1.27.1-64bit.exe'
  checksum64    = 'b7479c752e11648e7859341f986aa981a400ef3071e8e718101a8375037eaa8d'
  checksumType64= 'sha256'
  
  silentArgs	= '/S'
}

Install-ChocolateyPackage @packageArgs
