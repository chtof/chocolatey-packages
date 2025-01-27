$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url           = 'https://github.com//STJr/SRB2/releases/download/SRB2_release_2.2.15/SRB2-v2215-Installer.exe'
  checksum      = 'b7d0e868a4b4a055187f2fa0cf9a93c12003e23b2548e47fdb1215476488a74d'
  checksumType  = 'sha256'
  
  
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
