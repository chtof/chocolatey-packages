$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://download.softros.com/SoftrosLANMessengerSetup.msi'
  checksum     = 'c534fee4fe7ec928d352e24e0b64324e64f803ef3d51d85853b87a067369c09b'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
