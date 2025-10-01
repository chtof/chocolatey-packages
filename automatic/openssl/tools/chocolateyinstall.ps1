$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_5_4.exe'  
  checksumType32  = 'sha512'
  checksum32      = 'b17c2732e55e3758fa7f8dc3897916cadbf835ca331cb9a349675bf70c902773aa374b4fd5f6fba1b024a3c0656c7d1c88934ef740f4d1c227b8f2c72298e129'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_5_4.exe'
  checksumType64  = 'sha512'
  checksum64      = '535ce7f3b5b0b48155fe39fcdf874b4bfd6419c301d55902f2041413513d49d9060fc88a4c0eef039431b8b8610c5653ee651e481e05fc602b08888365707cb5'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
