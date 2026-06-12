import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  #$releases = 'http://www.roomarranger.com/whatsnew.txt'
  #$regex = 'version (?<Version>[\d\.]+) \('

  $releases = 'https://www.roomarranger.com'
  $regex = '<span id="dlbox_verno">(?<Version>[\d\.]+)</span>'

  (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null
  $version = $matches.Version
  If ($version -match '^[\d]+$') {
    $version = $version -Replace '^([\d]+)$', '$1.0'
  }

  $version_url = $version -Replace '\.', ''

  return @{
      Version = $version
      URL64   = 'https://f000.backblazeb2.com/file/rooarr/rooarr' + $version_url + '_64bit.exe'      
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{          
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none