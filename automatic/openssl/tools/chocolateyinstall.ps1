$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-4_0_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = '4074699a2f52d431ccc3bd3214333c7cf893539942d4b6eebd82777ce33ed2a04771759970d146cb600a4b02288b7220d76dc34027f2fed2da54fe6a433e039e'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-4_0_0.exe'
  checksumType64  = 'sha512'
  checksum64      = 'd61812a6256835d4dd1c5d99257cdd90c861fc91cec4ffd6614f2f21bad7aae2af5406b1999b94644ffe5ac881ab38a649645ac3625e68251a2032b984f2f380'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
