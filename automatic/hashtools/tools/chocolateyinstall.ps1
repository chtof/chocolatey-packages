$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://binaryfortressdownloads.com/Download/BFSFiles/109/HashToolsSetup-4.8.3.exe'
  checksum     = '6597c2050e1555d617bea96e2dcfaa10493a55af41889bf96c3a7d3e96700e98'
  checksumType = 'sha256'
  
  silentArgs   = '/VERYSILENT /SILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components=""'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs
