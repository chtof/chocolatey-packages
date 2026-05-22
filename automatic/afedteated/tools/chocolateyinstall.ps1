$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '868d24207e845fa378a481e97b0a16527944784e1c4ddf04450dbe862b839b63e526de3b069aca6358e4ed4161ea36186bb83bee344ef55f67b1314aaab3794c'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
