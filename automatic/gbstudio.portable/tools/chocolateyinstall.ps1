$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.2/gb-studio-windows-32bit-standalone.zip'
  checksum      = '12b33de1a4bee199b903b11e58e342f6700512a055abf8a29ecc74fdbc193a02'
  checksumType  = 'sha256'

  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.3.2/gb-studio-windows-64bit-standalone.zip'
  checksum64    = '9afea7d8f3920991c3562fd69fa8a98aed7f29d231aa468bb4dbcf123b60db80'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Prevent chocolatey from creating shims for supplementary executables
New-Item -path $toolsDir -name "Update.exe.ignore" -type File -force | Out-Null

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "GB Studio.lnk"
$targetPath = Join-Path $toolsDir "gb-studio.exe"
Install-ChocolateyShortcut -RunAsAdmin -shortcutFilePath $shortcutFilePath -targetPath $targetPath
