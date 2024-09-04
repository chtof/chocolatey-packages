$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.1/gb-studio-windows-32bit-standalone.zip'
  checksum      = '39419f868614c080d057cacbc3991774bb146fb6349a55f69496b7e8aa050166'
  checksumType  = 'sha256'

  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.1/gb-studio-windows-64bit-standalone.zip'
  checksum64    = '76d96cd9d9283cd7f73624721fbc5c7d05243eefc0e53c89b57d30a01d778e7b'
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
