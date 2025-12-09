$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-6239-windows-cl-msvc2022-x86_64.exe'
  checksum64     = '9afc3d14ba91138e2e56eccaf48ff17ac00898c823cc06ae04ec46772a4929d7'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
