$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
    
  url            = 'https://dl.basilisk-browser.org/basilisk-20250103024423.win32.installer.exe'
  checksum       = '5dfdb22914c5b9708e36e9550daffd8ba48a100235b2e65bbcc0603b09abcf0e'
  checksumType   = 'sha256'

  url64          = 'https://dl.basilisk-browser.org/basilisk-20250103024407.win64.installer.exe'
  checksum64     = '52419c01e9af52495ede15069fd5baafaae189e32b677d0246c70b1a515d487d'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
