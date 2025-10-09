$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20251009121613.win32.installer.exe'
  checksum       = 'da1493cd66a36bd57843bf2bcd2dbe8f0a1cd5f96af2b5a1465c0a2b4989cb90'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20251009121624.win64.installer.exe'
  checksum64     = 'e06729d01f22e710120ca9321b13884ba5823e5bb4f417be1647847f068043ef'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
