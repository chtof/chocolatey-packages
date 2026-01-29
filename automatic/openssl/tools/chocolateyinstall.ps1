$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_6_1.exe'  
  checksumType32  = 'sha512'
  checksum32      = '1f877eac8aa79a63679e5fe9522b47b431a609f6331f7b90ee9677a0238d95e7d39541e63a87165621447a6f1da2ca610d2a5cad58ddc7c9b7603b38eec6505f'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_6_1.exe'
  checksumType64  = 'sha512'
  checksum64      = '190ad19fa2186a0095a920c0b19583e4f324893fdc2e95b9b01eab0ae029b8af646ded2fcebab9c09eec5c2afc8289ced70d47b9d3ff55b881b03d58c88b1580'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
