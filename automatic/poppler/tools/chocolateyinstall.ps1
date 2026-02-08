$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url            = 'https://github.com/oschwartz10612/poppler-windows/releases/download/v25.12.0-0/Release-25.12.0-0.zip'
$checksum       = '9499c7474e4deb41c80ef5ea4a18cc1f3843695fbfa3c247db5c46c6eab2e26f'
$checksumType   = 'sha256'

$packageArgs = @{
  packageName     = $env:ChocolateyPackageName
  unzipLocation   = $toolsDir
  Url64bit        = $url
  Checksum64      = $checksum
  ChecksumType64  = $checksumType
}
Install-ChocolateyZipPackage @packageArgs
