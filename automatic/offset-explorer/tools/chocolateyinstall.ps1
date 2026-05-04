$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.kafkatool.com/download3/offsetexplorer.exe'
  checksum      = '120014bcaa5882bca5e8f3bbb4f0090e2523f662991af22d0676dfeae00786a6'
  checksumType  = 'sha256'

  url64bit      = 'https://www.kafkatool.com/download3/offsetexplorer_64bit.exe'
  checksum64    = '0128445b0b579792f78f761c45dd201e298d21cb0db6e2376b24ccccc3c6d251'
  checksumType64= 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
