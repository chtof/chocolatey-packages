$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"

  url64         = 'https://ftpmirror.gnu.org/octave/windows/octave-9.4.0-w64-installer.exe'
  checksum64    = 'ea26f0acfe93181a61950b94aa0485d45851a751952358db53384d2ea35db203'
  checksumType64= 'sha256'

  # Note: silentArgs doesn't work as expected for octave.install
  # An autohotkey script is used as workaround.
  # silentArgs	= "/S"
}

# Don't create shims for any executables
$files = Get-ChildItem "$toolsDir"  -Recurse -Include *.exe -Exclude 'octave-cli.exe'
foreach ($file in $files) {
    New-Item "$file.ignore" -type file -force | Out-Null
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
