import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases               = 'https://sourceforge.net/projects/davmail/files/davmail/'
    $regexLastVersionFolder = "/projects/davmail/files/davmail/(?<VersionMajor>[\d\.]+)/"
    (Invoke-WebRequest -Uri $releases -UseBasicParsing).Content -Match $regexLastVersionFolder | out-null
    
    $versionMajor           = $matches.VersionMajor

    $regex32        = "davmail-[\d\.-]+-setup?.exe/download"
    $regex64        = "davmail-(?<FullVersion>[\d\.-]+)-setup64?.exe/download"
    $download_page  = (Invoke-WebRequest -Uri "$releases/$versionMajor" -UseBasicParsing)
    $url32          = $download_page.links | ? href -match $regex32
    $url64          = $download_page.links | ? href -match $regex64
    $fullVersion    = $matches.FullVersion

    return @{
        Version = $fullVersion -Replace '-', '.'
        URL32   = (Get-RedirectedUrl ('https://sourceforge.net/projects/davmail/files/davmail/' + $versionMajor + '/davmail-' + $fullVersion + '-setup.exe')) -Replace ('\?viasf=1', '')
        URL64   = (Get-RedirectedUrl ('https://sourceforge.net/projects/davmail/files/davmail/' + $versionMajor + '/davmail-' + $fullVersion + '-setup64.exe')) -Replace ('\?viasf=1', '')
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none