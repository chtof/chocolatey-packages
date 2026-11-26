$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64bit       = 'https://www.kafkatool.com/download4/offsetexplorer_64bit.exe'
  checksum64     = 'b74aff3e9a38771bcda0963c80b3bd2e84595ea573e41f9735075ff9504f83fd'
  checksumType64 = 'sha256'

  silentArgs     = '-q'
}

Install-ChocolateyPackage @packageArgs
