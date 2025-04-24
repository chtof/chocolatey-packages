$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://dl.basilisk-browser.org/basilisk-20250422154345.win32.7z'
  checksum      = '5e40b73d863c348f883ee252d25d7ea554f3aade17756d1c1d5298bc0812ff1a'
  checksumType  = 'sha256'
  
  url64         = 'https://dl.basilisk-browser.org/basilisk-20250422154345.win64.7z'
  checksum64    = '7fddd2544cedd170f02abac0bd1be8f7985652aea7936ebc5c113e4d063888c2'
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
