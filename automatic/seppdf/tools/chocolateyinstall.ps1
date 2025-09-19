$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir" 

  url           = 'https://www.ne.jp/asahi/foresth/home/spdf394.zip'
  checksum      = 'ae44de7aa6bde542ed04f402b7a7e3b064794abdf12fa6e990df67bc0345bf69'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "SepPDF.lnk"
$targetPath = Join-Path $toolsDir "SepPDF.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
