$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$PackageParameters = Get-PackageParameters
[array]$arr_tasks = @()

### PARAMETERS
If ($PackageParameters.DisableRunAtStartup) {
  $arr_tasks += '!runatstartup'
  Write-Host 'You requested to do not run Laragon when Windows start.' -ForegroundColor Cyan
} Else {
  $arr_tasks += 'runatstartup'
}

If ($PackageParameters.DisableAutoVirtualHosts) {
  $arr_tasks += '!autovirtualhosts'
  Write-Host 'You requested to disable auto virtual hosts (Your app will not get a pretty url --> http://app.test).' -ForegroundColor Cyan
} Else {
  $arr_tasks += 'autovirtualhosts'
}

If ($PackageParameters.DisableRightClickMenu) {
  $arr_tasks += '!rightclickmenu'
  Write-Host 'You requested to do not add Notepad++ & Terminal to the Right-Click Menu.' -ForegroundColor Cyan
} Else {
  $arr_tasks += 'rightclickmenu'
}

$tasks = $arr_tasks -Join ","


### INSTALLATION
$packageArgs = @{
  packageName   = "$env:ChocolateyPackageName"
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  url64         = 'https://github.com//leokhoa/laragon/releases/download/8.4.0/laragon-wamp.exe'

  checksum64    = 'cd25d146c662ced01d0cd401249e82b13de37739447e62737f612cb4662b289c'
  checksumType  = 'sha256'
  
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components= /tasks=""$tasks"""
}
Install-ChocolateyPackage @packageArgs
