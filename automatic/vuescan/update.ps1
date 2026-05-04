$ErrorActionPreference = 'Stop'
Import-Module au
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_BeforeUpdate() {    
    $Latest.Checksum64 = Get-RemoteChecksum $($Latest.URL64)
}

function global:au_GetLatest {    
    $releases     = 'https://www.hamrick.com/alternate-versions.html'        
    $regex64      = '<a href="(?<File64>files/vuex64\d+.exe)">(?<Version>[\d\.]+)</a>'

    $download_page = (Invoke-WebRequest -Uri $releases).RawContent    
    $download_page -match $regex64 | Out-Null
    $file64  = $matches.File64

    $etag = GetETagIfChanged -uri "https://www.hamrick.com/$file64"

    If ($etag) {        
        $result = GetResultInformation "https://www.hamrick.com/$file64"
        $result["ETAG"] = $etag
    } Else {        
        $result = @{            
            URL64   = 'https://www.hamrick.com/' + $file64
            Version = $matches.Version
        }
    }
    return $result
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{            
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetResultInformation([string]$url64) {
  $dest = "$env:TEMP\vuex64.exe"
  Get-WebFile $url64 $dest | Out-Null

  $result = @{    
    URL64          = $url64
    Version        = (Get-Item $dest).VersionInfo.FileVersion.Trim()
    Checksum64     = Get-FileHash $dest -Algorithm SHA512 | % Hash    
    ChecksumType64 = 'sha512'
  }
  Remove-Item -Force $dest
  return $result
}

function GetETagIfChanged() {
  param([string]$uri)
  if (($global:au_Force -ne $true) -and (Test-Path $PSScriptRoot\info)) {
    $existingETag = $etag = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -first 1
  }
  else { $existingETag = $null }

  $etag = Invoke-WebRequest -Method Head -Uri $uri -UseBasicParsing
  $etag = $etag | % { $_.Headers.'x-amz-id-2' }
  if ($etag -eq $existingETag) { return $null }

  return $etag
}

update -ChecksumFor none -NoCheckUrl