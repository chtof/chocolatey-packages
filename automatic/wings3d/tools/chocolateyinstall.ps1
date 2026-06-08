$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName  
  file        = "$toolsDir\wings-2.4.1.exe"    
  file64      = "$toolsDir\wings-x64-2.4.1.exe"    
  silentArgs  = '/S'
}

Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
Write-Warning "OpenGL 2.1 for Windows is needed to launch Wings3D. See https://www.khronos.org/opengl/wiki/Getting_Started#Downloading_OpenGL"
