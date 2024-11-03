$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.12/LittleNavmap-win32-3.0.12.zip'
  checksum32    = '76bf1ad5bbe792fa2797cf90c058536b1eeb3cbc00238cc50047203d696fe2c7'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.12/LittleNavmap-win64-3.0.12.zip'
  checksum64    = 'c0d8b0110423ce45b0ab52781618ace507498978b0edf0a46e1713cca6743885'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
