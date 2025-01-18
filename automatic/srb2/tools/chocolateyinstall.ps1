$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com//STJr/SRB2/releases/download/SRB2_release_2.2.14/SRB2-v2214-Installer.exe'
  checksum      = '3f0725fbc19acfb4c05cb73d50058c7d64855adcacfc7ba757802ad468b20013'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
