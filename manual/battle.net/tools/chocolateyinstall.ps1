$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'Battle.net-Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Battle.net*'
  checksum      = 'B32A976B66110524B7CC94C056E678617045D36DE80ABB5E798C2F91E91C5DA8'
  checksumType  = 'sha256'
  silentArgs    = ""
  validExitCodes= @(0, 3010, 1641)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }

Start-Sleep -s 5
Start-CheckandStop "Battle.net"