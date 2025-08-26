$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://cdn.iobit.com/dl/advanced-systemcare-setup.exe'
  checksum     = 'e34ba613daa978960902500d3023f4df8c92ccc56ae939aecf03f3b519b6af7900aade78edc921dff52ce4338cad355382c21c8bc5b2d289093f933271bd7b4e'
  checksumType = 'sha512'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
