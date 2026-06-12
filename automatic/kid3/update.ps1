import-module au

function global:au_BeforeUpdate {
  Get-RemoteFiles -NoSuffix -Purge
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
  $releases = 'https://kid3.kde.org'
  $regex64  = 'kid3-(?<Version>[\d\.-]+)-win32-x64.zip'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url64 = ($download_page.links | ? href -match $regex64 | Select -First 1).href
  $file  = $matches.0
  $version = $matches.Version -replace '-', '.'
  
  return @{
    Version = $version    
    URL64   = (Get-RedirectedUrl $url64) -Replace '\?viasf=.*', ''
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
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName64)`""
          "([$]toolsDir `"kid3-)[\d\.]+(-win32-x64\\kid3.exe)`"" = "`${1}$($Latest.Version)`${2}`""
        }
    }
}

update -ChecksumFor none -NoCheckUrl
