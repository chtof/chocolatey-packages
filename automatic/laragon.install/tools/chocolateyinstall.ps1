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
  url64         = 'https://github.com//leokhoa/laragon/releases/download/8.3.0/laragon-wamp.exe'

  checksum64    = 'b115f2c9328ae4b5d482557bb355ee05d919062891695a524ae386f31f43e2bc'
  checksumType  = 'sha256'
  
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /components= /tasks=""$tasks"""
}
Install-ChocolateyPackage @packageArgs
