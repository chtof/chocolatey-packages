$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url64          = 'https://downloads.firestormviewer.org/release/windows/Phoenix-FirestormOS-Releasex64_AVX2-7-2-4-80712_Setup.exe'                   
  checksum64     = '218ba2fd1a70914bb30046d899863f36c27cca06a7d6e82642e43511679f6a7e'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
