$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://www.murgee.com/auto-mouse-click/download/setup.exe'
  checksum     = '3CE997654EBC8FF8BA85BC694619BE97C1E6595EE6C24998FEF5DC5AD31F6C53'
  checksumType = 'sha256'

  silentArgs   = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs
