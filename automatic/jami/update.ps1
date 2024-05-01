Import-Module AU
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_SearchReplace {
   @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{          
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName64)`""
        }
    }
}

function global:au_AfterUpdate {
  "$($Latest.ETAG)|$($Latest.Version)" | Out-File "$PSScriptRoot\info" -Encoding utf8
}

function GetResultInformation([string]$url64) {
  $dest = "$env:TEMP\jami-x64.msi"
  Get-WebFile $url64 $dest | Out-Null
  # $version = Get-Item $dest | % { $_.VersionInfo.ProductVersion -replace '^([\d]+(\.[\d]+){1,3}).*', '$1' }
  $version = Get-Date -format "yyyy.M.d"

  $result = @{
    URL64          = $url64
    Version        = Get-FixVersion -Version $version
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
  $etag = $etag | % { $_.Headers.ETag }
  if ($etag -eq $existingETag) { return $null }

  return $etag
}

function global:au_GetLatest {  
  $downloadUrl = 'https://dl.jami.net/windows/jami.release.x64.msi'
  $etag = GetETagIfChanged -uri $downloadUrl

  if ($etag) {
    $result = GetResultInformation $downloadUrl
    $result["ETAG"] = $etag
  }
  else {
    $result = @{
      URL64   = $downloadUrl
      Version = Get-Content "$PSScriptRoot\info" -Encoding UTF8 | select -First 1 | % { $_ -split '\|' } | select -Last 1
    }
  }

  return $result
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}