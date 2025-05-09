$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url64          = 'https://www.ocenaudio.com/downloads/index.php/ocenaudio_windows64.exe'
  checksum64     = '3a8d80a904b37103ec03d0226acfa75addc287201e02def009cd0c7f32b57586'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
