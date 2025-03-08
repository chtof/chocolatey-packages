$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'PSPad editor'
  fileType       = 'exe'

  url            = 'https://www.pspad.com/files/pspad/pspad551_setup.exe'
  checksum       = '14e1b29a83c03134e25e8312748584d292ec0d7adb2be2368baecf3326e92469'
  checksumType   = 'sha256'

  url64          = 'https://www.pspad.com/files/pspad/pspad551_x64_setup.exe'
  checksum64     = 'bcb4ede2f4e37a167eb50af4a67f80bd6d99be79a3d4c0d2e0e784205a97567e'
  checksumType64 = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
