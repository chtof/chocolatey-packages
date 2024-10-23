$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  
  url32           = 'https://slproweb.com/download/Win32OpenSSL-3_4_0.exe'  
  checksumType32  = 'sha512'
  checksum32      = 'e624d34b86dcf2895321ab966369b17168ded98c376bc8333ec01cf6cfde7a20057aa40a61dbb6593fb05acf3eb8d00d26f3dc4f65476297d2aa0114767e0cb2'

  url64           = 'https://slproweb.com/download/Win64OpenSSL-3_4_0.exe'
  checksumType64  = 'sha512'
  checksum64      = 'b50ee0ce50bac108959854b0e4612217abe1004936058941be757b90dc683658449cbee9b91d84e54a706982ba4ac028eff7fcf388c775b35d76cde895c4364f'
  silentArgs      = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs

$path = Get-AppInstallLocation OpenSSL-Win
Install-ChocolateyPath -PathToInstall "$path\bin"
Install-ChocolateyEnvironmentVariable -VariableName OPENSSL_CONF -VariableValue "$path\bin\openssl.cfg"

Write-Warning "OPENSSL_CONF has been set to $path\bin\openssl.cfg"
