$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url           = 'https://github.com/asciidocfx/AsciidocFX/releases/download/v1.8.10/AsciidocFX_Windows.exe'
  checksum      = '97407be0621bc1d82b83eb95ed29b473dc8f4e02da79d00486b45987169f9431'
  checksumType  = 'sha256'

  silentArgs    = '-q'
}

Install-ChocolateyPackage @packageArgs
