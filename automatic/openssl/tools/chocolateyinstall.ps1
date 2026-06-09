$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-4_0_1.exe'  
  checksumType32  = 'sha512'
  checksum32      = 'a33b93624afd421052faccd9431b9c55ad56251279e1d4c8d6941dafb2728b77335e2d0f2da9b96f2c410e36e56591eb2869da485b7352d2258f9ee02fda4975'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-4_0_1.exe'
  checksumType64  = 'sha512'
  checksum64      = 'c4d9182774c5c9b36e658eb0644b62710b281747048c24e63931d9697a56d914f304842283443c3cb72c0b54f4a4ceb94e4a48c30ab1f33d68e620bf38f6f54f'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
