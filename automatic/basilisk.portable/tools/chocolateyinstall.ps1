$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://dl.basilisk-browser.org/basilisk-20250703133412.win32.7z'
  checksum      = 'c7a6bd733cacfe9f4c21f012cdf5cab54ef2fef165c6b9ff77547ccaf756b690'
  checksumType  = 'sha256'
  
  url64         = 'https://dl.basilisk-browser.org/basilisk-20250703133404.win64.7z'
  checksum64    = '1d0b55471a477862903b09ac2d3642fcbac4afd5f3e879ca34618a6490114140'
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
