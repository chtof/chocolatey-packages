$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.2.1/gb-studio-windows-32bit-standalone.zip'
  checksum      = '10dcd07cef0f7d751598b015e5ae25a156e8218596ac6c58dacbcecf11d8c492'
  checksumType  = 'sha256'

  url64         = 'https://github.com//chrismaltby/gb-studio/releases/download/v4.2.1/gb-studio-windows-64bit-standalone.zip'
  checksum64    = '10b56fb4f2edfb3ac849a0a7b265ec548b7bfcdfc8baaf3b399067440649e556'
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
