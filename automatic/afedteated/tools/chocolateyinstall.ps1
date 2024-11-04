$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '67a836501bddbf9345993ecdaf0abf1fe06dafc462f33df1a05e7df102b33b1ef880895d8d1a6aad9793a1cabf7e10d30200f506e6edf00fee0df0bed97c7af9'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
