$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  filetype     = 'MSI'

  url          = 'https://download.softros.com/SoftrosLANMessengerSetup.msi'
  checksum     = 'ad96ee3fc3ece964e607be6d5338a3fbedd62edcbd8ebfc3e662fbce2057e89e'
  checksumType = 'sha256'

  silentArgs   = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
