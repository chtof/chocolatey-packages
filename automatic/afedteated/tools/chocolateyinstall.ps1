$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '618eec541f5c3f2283514e64836acb33586b2ba4cc91a1e293af2f4ad1e827c27c33abeafcf7dd19dd75075bd3c13952f64b4e8a403a18af1f001aae1f95c91f'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
