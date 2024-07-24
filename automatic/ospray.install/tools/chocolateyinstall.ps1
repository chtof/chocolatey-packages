$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  filetype    = 'MSI'
  file        = "$toolsDir\ospray-3.2.0.x86_64.windows.msi"
  silentArgs  = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyInstallPackage @packageArgs

$packageArgs.file -match "ospray-(?<majorVersion>\d+)\..*" | Out-Null
Install-ChocolateyPath -PathToInstall "$env:ProgramFiles\Intel\OSPRay v$($matches.majorVersion)\bin"
