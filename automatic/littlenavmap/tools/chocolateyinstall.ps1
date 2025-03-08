$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.16/LittleNavmap-win32-3.0.16.zip'
  checksum32    = 'db306d103f9426fb7ce056749b316190b9812622e98f9f398a39640494500b96'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.16/LittleNavmap-win64-3.0.16.zip'
  checksum64    = '64989bb7ed706dd7d21b7264bf93be26f22129f7567963700271ea99b16ef304'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
