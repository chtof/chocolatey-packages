$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://clockify.me/downloads/clockify-setup.msi'
  checksum      = 'd5ead03c397c67adb1c9061a6394bf50997c2243a076e96ce18ee1ebb63000f382b1fe366dec5d1fa665f50c96dfa032b942d51f5e99c7b5210d89583cbd443b'
  checksumType  = 'sha512'

  fileType      = 'MSI'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs