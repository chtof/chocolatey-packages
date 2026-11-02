$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

# Remove zip files from previous versions
Remove-Item "$toolsDir\*.zip" -ErrorAction SilentlyContinue

$packageArgs = @{
  packageName	   = $ENV:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  file           = Get-Item -path $toolsDir\*.zip

  url			       = 'https://www.pspad.com/files/pspad/pspad553en.zip'
  checksumType	 = 'sha256'
  checksum	   	 = 'b0d40baa504ef31b00e85f30171e4658d5459d076cfbb6cb8d4517835de5df2e'

  url64          = 'https://www.pspad.com/files/pspad/pspad553en_x64.zip'
  checksumType64 = 'sha256'
  checksum64     = 'f4a5fa970e6c70a0f206fe7775b768a28efa90bb4a5040661b90dee7d3e83fb6'
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
