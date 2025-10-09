$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://dl.basilisk-browser.org/basilisk-20251009121613.win32.7z'
  checksum      = 'e202731cb51de86bdb95782c7cde9a452feec14040df49b014844cea7fecea5e'
  checksumType  = 'sha256'
  
  url64         = 'https://dl.basilisk-browser.org/basilisk-20251009121624.win64.7z'
  checksum64    = 'c59ea307fbf350ba27ce501a61ffb16c64f78ee24f1d08e82be00bc6b1f45c36'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Include *.exe -Exclude basilisk.exe
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Basilisk.lnk"
$targetPath = Join-Path $toolsDir "basilisk\basilisk.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
