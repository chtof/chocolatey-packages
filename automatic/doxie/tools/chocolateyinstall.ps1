$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://download.getdoxie.com/DoxieSetup-3.5.1.exe'
  checksum     = '53c54fb513da08cf5143e8b56d2a0a5b30927bbb73b13f959e28e6f34de049a4'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
