$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2135_x64_setup.exe'
  checksum64    = '0699f64279d6c12a2976a83bf65bf92f3e87ab13d0c71e717b3f4dc8ebbca917'
  checksumType  = 'sha256'
   
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs


[array]$key = Get-UninstallRegistryKey -softwareName 'Sublime Merge'

If ($key.Count -eq 1) {
  $key | ForEach-Object {
    $submergeInstallLocation = Join-Path -Path $_.InstallLocation -ChildPath 'smerge.exe'
    Install-BinFile -Name 'smerge' -Path "$submergeInstallLocation"
  }
}
