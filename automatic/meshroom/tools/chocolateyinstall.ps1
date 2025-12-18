$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"

  url64          = 'https://zenodo.org/records/16887472/files/Meshroom-2025.1.0-Windows.zip'
  checksum64     = '14E51F20B18015C5E821717576C092AAB257168E13583381C0EB2A00D5793C57'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs -DisableLogging

# Install start menu shortcuts
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Meshroom.lnk"
$targetPath = Join-Path $toolsDir "Meshroom-2021.1.0\Meshroom.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
