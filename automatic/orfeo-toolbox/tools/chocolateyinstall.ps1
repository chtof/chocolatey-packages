$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '9.1.0'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url64         = 'https://www.orfeo-toolbox.org/packages/OTB-9.1.0-Win64.zip'
  checksum64    = '5c64cc023956327f104729b55303db5572a81161a9ed36eef316bcedf466b987'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage -DisableLogging @packageArgs

# Don't create shims for other executables
$files = Get-ChildItem "$toolsDir" -Recurse -Exclude mapla.bat,monteverdi.bat
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}


$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)

$shortcutFilePath = Join-Path $programs "Orfeo Toolbox\Monteverdi.lnk"
$targetPath = Join-Path $toolsDir "OTB-$version-Win64\monteverdi.bat"
Install-ChocolateyShortcut -iconLocation "$toolsDir\orfeo-toolbox.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath

$shortcutFilePath = Join-Path $programs "Orfeo Toolbox\OTB application browser - mapla.lnk"
$targetPath = Join-Path $toolsDir "OTB-$version-Win64\mapla.bat"
Install-ChocolateyShortcut -iconLocation "$toolsDir\orfeo-toolbox.ico" -shortcutFilePath $shortcutFilePath -targetPath $targetPath
