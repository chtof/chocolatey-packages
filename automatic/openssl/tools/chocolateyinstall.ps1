$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-4_0_2.exe'  
  checksumType32  = 'sha512'
  checksum32      = '51e251ad959f89f6511c81209b7eb5cf0b1f2e3455e78ed912774d7972bec130c6469086e94fb2bd4a889691efd6a4d4eaef3d012d3078caa8adf7709c9c887a'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-4_0_2.exe'
  checksumType64  = 'sha512'
  checksum64      = 'c5093b0d9dc5e55d3efed8835fa231d259b3f12e840eaeed484f3220fc8cd5793bb35e27d400c7fb7e5399478013664ded9cf7de15be81aea8d8496a0e6ab109'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin" -PathType Machine
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
