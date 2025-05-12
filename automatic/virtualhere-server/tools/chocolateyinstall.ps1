$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath   = "$toolsDir\vhusbdwin$(Get-OSArchitectureWidth).exe"

  url64          = 'https://virtualhere.com/sites/default/files/usbserver/vhusbdwin64.exe'
  checksum64     = '92d16c27d2027e0545a69964c70f9458e1e61eac64da596cc2ae114efc806e92'
  checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Install start menu shortcut
$programs = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutFilePath = Join-Path $programs "Virtual Here USB Server.lnk"
Install-ChocolateyShortcut -shortcutFilePath $shortcutFilePath -targetPath $packageArgs.fileFullPath
