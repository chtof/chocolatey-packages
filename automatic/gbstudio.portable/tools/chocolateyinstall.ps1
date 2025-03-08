$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.3/gb-studio-windows-32bit-standalone.zip'
  checksum      = '9fcf5da32097cf3ac28160c981099764563db6c985cb89da6538e0f89be4733d'
  checksumType  = 'sha256'

  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.1.3/gb-studio-windows-64bit-standalone.zip'
  checksum64    = '217211315ba84a30b029aeba2e950a1d6d59e6dbeda0229092cccb91266abd1a'
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
