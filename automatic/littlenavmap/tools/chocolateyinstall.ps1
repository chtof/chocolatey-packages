$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.9/LittleNavmap-win32-3.0.9.zip'
  checksum32    = '43823fbe25fdea202894bd7d2b19149ee5ca0912fdf57971c9625a2b99b6298f'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.9/LittleNavmap-win64-3.0.9.zip'
  checksum64    = '6a0f8ee79a440403d85cec0b1844daf83fcf0f0b51a8606843d99a486c420a5c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
