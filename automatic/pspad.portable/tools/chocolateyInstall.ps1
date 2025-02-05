$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# Remove zip files from previous versions
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName	   = $ENV:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  file           = Get-Item -path $toolsDir\*.zip

  url			       = 'https://www.pspad.com/files/pspad/pspad551en.zip'
  checksumType	 = 'sha256'
  checksum	   	 = '47027e3deb57d71d41ed5bbd6e862e107018ad4d5939374e4a6d5de06b35250d'

  url64          = 'https://www.pspad.com/files/pspad/pspad551en_x64.zip'
  checksumType64 = 'sha256'
  checksum64     = 'b5458eb2eb9b410aaf670c0c8fb22e7f04842e69c9e077489285224ded003cb4'
}

# prevent chocolatey from creating shims for supplementary executables
foreach ( $file in 'phpCB.exe', 'TiDy.exe' ) {
  New-Item -path $toolsDir -name "$file.ignore" -type File -force | Out-Null
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "PSPad.lnk"
$targetPath = Join-Path $toolsDir "PSPad.exe"
Install-ChocolateyShortcut -shortcutFilePath "$shortcutFilePath" -targetPath "$targetPath"
