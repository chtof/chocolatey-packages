$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  file         =  'bping.exe'

  url           = 'https://gizmoware.net/bping/bping.zip'
  checksum      = '266b391e2166f3059f17f7ed0499e64377bba1c8afd0a7f9ab7a11a03781940c'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
