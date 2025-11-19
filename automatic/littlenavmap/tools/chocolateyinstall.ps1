$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  
  url32         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.18/LittleNavmap-win32-3.0.18.zip'
  checksum32    = 'b1c893fe2413a7bbce676037abaffe71e9e28a3e5821ccd2193ffddd3b6f2ca0'
  url64         = 'https://github.com//albar965/littlenavmap/releases/download/v3.0.18/LittleNavmap-win64-3.0.18.zip'
  checksum64    = '4a56358980b253c5876df8c8f7a7bab0873ca006c705eba20571a05e99adbc6f'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
#Remove-Item -Path $packageArgs.file64, $packageArgs.file64

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs 'Little Navmap.lnk'
$targetPath = Join-Path $toolsDir 'Little Navmap\littlenavmap.exe'
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
