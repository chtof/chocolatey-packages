$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  destination    = "$toolsDir"
  filefullpath   = "$toolsDir\dnscrypt-proxy-win32-2.1.6.zip"
  filefullpath64 = "$toolsDir\dnscrypt-proxy-win64-2.1.6.zip"
}

Get-ChocolateyUnzip @packageArgs

# Start service after upgrade
$serviceName = "dnscrypt-proxy"

Write-Warning "Start the dnscrypt-proxy service..."
Start-Service "$serviceName" -ErrorAction SilentlyContinue
