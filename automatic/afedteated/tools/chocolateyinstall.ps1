$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = '75124930682b7ea986fd4b4f0a5639a1e8a040d34d12fe160417fc99b267f0f144d4dbaa8bfd7ce594aab40deb721c454a32e28c8b74aeb66868fb110906f779'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
