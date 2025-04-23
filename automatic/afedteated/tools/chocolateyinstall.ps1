$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'eaddb815bdfacb60cd5f6b708e22dbdb283a40bac1d58a148b062954792f88575b51e2c32770a33b1ba4e684bc2b0d570a59b2fad2e045b67fd9b230a9fbef04'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
