$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$toolsDir"
  

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-6925-windows-cl-msvc2022-x86_64.7z'
  checksum64     = 'd66fa1e298ad4adfe6f511d51f1b3d753c4642900dbee6e42570694dbc3e15e2'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
 
# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "KDevelop.lnk"
$targetPath = Join-Path $toolsDir "KDevelop\bin\kdevelop.exe"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $targetPath
