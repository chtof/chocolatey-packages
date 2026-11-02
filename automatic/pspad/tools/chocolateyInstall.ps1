$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad553_setup.exe'
  checksum       = '0464faadcf9ee973740ff7298d8c6645528d54de908e756f8dff7fc009b5ed5c'
  checksumType   = 'sha256'

  url64          = 'https://www.pspad.com/files/pspad/pspad553_x64_setup.exe'
  checksum64     = 'eee12c64267547fd414c1d5e18d15dfe032cff719243c15dd4f6fc4cf47b4219'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
