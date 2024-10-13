$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.11/LittleNavmap-win32-3.0.11.zip'
  checksum32    = '25cdbb0f13d7d4f78836252589b1f565c104f0762c66e8f615c980ee1f874864'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.11/LittleNavmap-win64-3.0.11.zip'
  checksum64    = 'baf7a12c0f151dba24204ddf07546415f8376118d8f219a8b15c353fee205e80'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
