$ErrorActionPreference = 'Stop';
 
$params = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'EXE'
  silentArgs     = '/S'   

  url64bit       = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/kdevelop-master-6257-windows-cl-msvc2022-x86_64.exe'
  checksum64     = '216f7e61b1b1f6b045d3f94a88b51b2896a238dc9106599e7bb67f32929f806f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @params
 
[array]$key = Get-UninstallRegistryKey -SoftwareName "Kdevelop*"
if ($key -ne $null) {
  Install-BinFile -Name "kdevelop" -Path $key.DisplayIcon
}
