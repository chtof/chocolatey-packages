$ErrorActionPreference = 'Stop';

$version = 'r2022.1.0'
$baseurl = "https://cdist2.perforce.com/alm/helixalm/$version"
$url = "$baseurl/ttwinclientinstall.exe"
$checksum64 = ((Invoke-WebRequest "$baseurl/SHA256SUMS" -UseBasicParsing).RawContent.ToString().Split() | Select-String -Pattern 'ttwinclientinstall.exe' -SimpleMatch -Context 1,0 ).ToString().Trim().Split()[0]

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType	 = 'EXE'
  url            = $url
  checksum       = $checksum64
  checksumType   = 'sha256'
  silentArgs	   = "-i SILENT LAX_VM resource\jre\bin\java.exe"
}

Install-ChocolateyPackage @packageArgs
