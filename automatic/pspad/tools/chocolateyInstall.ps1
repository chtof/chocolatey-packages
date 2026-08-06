$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad552_setup.exe'
  checksum       = 'e68f988ce73b0b208579ec99ff0ae52dcf5087d21a402dd5a12f3bc1e26e16b2'
  checksumType   = 'sha256'

  url64          = 'https://www.pspad.com/files/pspad/pspad552_x64_setup.exe'
  checksum64     = '29b0dd4e5568037fa31934e48e539710efdbd96fb8845c5c4ea85e0fecdf411a'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
