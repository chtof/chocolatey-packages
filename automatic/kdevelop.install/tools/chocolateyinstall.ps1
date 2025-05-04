$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-5510-windows-cl-msvc2022-x86_64.exe'
  checksum64     = '6b476eefd3c35dc72369f300c26d8ccde2a8520521b8e27b4aea2e380d36ce15'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
