$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.8.1.exe'
  checksum     = '3aad0784f5d63247dd1b6a104731facda499cb4d46bb5da9c74b5c316ca5a193'
  checksumType = 'sha256'
  
  silentArgs   = '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
