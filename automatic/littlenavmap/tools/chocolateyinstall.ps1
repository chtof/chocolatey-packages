$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.8/LittleNavmap-win32-3.0.8.zip'
  checksum32    = 'c4c76e92b1445e72ac12ae4d453f1fbf235f972ba4aca7d38d72a6d299c22f50'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.8/LittleNavmap-win64-3.0.8.zip'
  checksum64    = 'f3b32e689e4b9a80e152f7c4662adfbc3033a5cca554df0749c672e7ac50877c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
