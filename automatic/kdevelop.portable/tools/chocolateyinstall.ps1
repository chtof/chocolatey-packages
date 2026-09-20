$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-6942-windows-cl-msvc2022-x86_64.7z'
  checksum64     = '68e2ed1d456d54d3a38da6b07bceec541f7f36d9af7b8c92efef608bb661d42a'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
 
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "KDevelop.lnk"
$targetPath = Join-Path $toolsDir "KDevelop\bin\kdevelop.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
