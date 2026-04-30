$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2125_x64_setup.exe'
  checksum64    = 'e237fb46018ff4f5182ba464cf4ad81147900b812dd801f0e01bc8c8547f494e'
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
