$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
    
  url64         = 'https://download.sublimetext.com/sublime_merge_build_2096_x64_setup.exe'
  checksum64    = 'd7897db60b13c8aa451a8e7af45853c4dc2648faad1380f9b892069159360a60'
  checksumType  = 'sha256'
  
  
  silentArgs	= "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
}

Install-ChocolateyPackage @packageArgs


[array]$key = Get-UninstallRegistryKey @packageArgs

If ($key.Count -eq 1) {
  $key | ForEach-Object {
    $submergeInstallLocation = Join-Path -Path $_.InstallLocation -ChildPath 'smerge.exe'
    Install-BinFile -Name 'smerge' -Path "$submergeInstallLocation"
  }
}
