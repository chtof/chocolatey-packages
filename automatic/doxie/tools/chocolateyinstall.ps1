$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
    
  url          = 'https://download.getdoxie.com/DoxieSetup-3.5.exe'
  checksum     = '576ed65363d4cb244ad8228e2c0d1bf597472398790510f45742d8ca95f72040'
  checksumType = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
