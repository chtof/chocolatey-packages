$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$pp = Get-PackageParameters
$DesktopShortcutPath = "$env:PUBLIC\Desktop\SteaScree.lnk"
$url       = 'https://steascree.download/steascree-1.5.4-windows.exe'
$checksum  = 'ddeb40de6538f47a6666a656c867261d3349ca01d8f5dd1145b8e74574f270d4'

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  fileType       = 'EXE'
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'
  silentArgs     = '--mode unattended'
}
Install-ChocolateyPackage @packageArgs


function InstallShortcut {
  param (
    $ShortcutPath
  )

  $installLocation = "${env:ProgramFiles(x86)}\SteaScree"

  $shortcutArgs = @{
    shortcutFilePath = $ShortcutPath
    workingDirectory = "$installLocation"
    targetPath       = "$installLocation\SteaScree.exe"
  }

  Install-ChocolateyShortcut @shortcutArgs
}

if ($pp['DesktopShortcut']) {
    InstallShortcut $DesktopShortcutPath
}
