$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.17/LittleNavmap-win32-3.0.17.zip'
  checksum32    = '4c2c4767f36fe1141f3df128b32de9d3fb39fb776f958ae3aa4449c718ca3d3c'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.17/LittleNavmap-win64-3.0.17.zip'
  checksum64    = '39359e01302d6b2d078443985522f499b06c7a076f28b393583cdccaa27a6979'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
