$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'

  url32         = 'https://www.adobe.com/go/Connect11_32msi'
  checksum32    = '4e9811cd975f6ee9a415db5b9d8bd3a4beaa4546700c1031d5b26395492e2548'
  url64         = 'https://www.adobe.com/go/Connect11msi'
  checksum64    = 'b1b7390c0122618593bf5c4af867f7f0849ec2d39126d29a3a6390ee0db1aaef'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$env:TEMP\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Install-ChocolateyPackage @packageArgs
