$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://dl.basilisk-browser.org/basilisk-20260123012755.win32.7z'
  checksum      = 'b0998a0e957c6b66adb91fe55cf52310af5143164b29b581c5d180447168552d'
  checksumType  = 'sha256'
  
  url64         = 'https://dl.basilisk-browser.org/basilisk-20260123020224.win64.7z'
  checksum64    = '2768c17c5a046f2bc34ac81bf9c265857d02d82f71848f3f1fa71c3d89822d71'
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
