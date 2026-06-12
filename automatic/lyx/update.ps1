import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {    
    $releases   = 'https://www.lyx.org/Download'    
    $regex64    = '(?<Url>.*/bin/(?<Version>[\d\.]+)/LyX-[\d]+-Installer-(?<VersionMinor>[\d]+)-x64.exe$)'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing    
    $url64 = $download_page.links | ? href -match $regex64

    return @{
        Version = $matches.Version + '.' + $matches.VersionMinor        
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{          
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none