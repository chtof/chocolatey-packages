$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://us.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe&id=undefined'
$fileLocation = Join-Path $toolsDir 'Battle.net-Setup.exe'
$checksumType = 'sha256'

Invoke-WebRequest $url -OutFile $fileLocation -UseBasicParsing
$checksum = (Get-FileHash $fileLocation -Algorithm $checksumType).Hash

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  file          = $fileLocation
  softwareName  = 'Battle.net*'
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs    = ""
  validExitCodes= @(0, 3010, 1641)
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs

# Close AutoHotKey
$autohotkey = Get-Process AutoHotKey -ErrorAction SilentlyContinue
if ($autohotkey) { $autohotkey | Stop-Process }

Start-Sleep -s 10
Start-CheckandStop "Battle.net"