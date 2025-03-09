$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir

  url           = 'https://dl.basilisk-browser.org/basilisk-20250220144852.win32.7z'
  checksum      = 'db80912fc5e947bb799d239ffccb58a9eb8efb4dad845856093b176ebba8d450'
  checksumType  = 'sha256'
  
  url64         = 'https://dl.basilisk-browser.org/basilisk-20250220144843.win64.7z'
  checksum64    = '9a20a017a3f373de125181bc9994d62770eb9b92cf79882c1df67dfbf9054eb7'
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
