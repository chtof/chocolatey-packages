import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    #$releases = 'https://anaconda.org/conda-forge/poppler/files?sort=basename&sort_order=desc'
    $releases = 'https://poppler.freedesktop.org'
	$regex   = 'poppler-(?<Version>[\d\.]+)(-.*)?.tar.(bz2|xz)$'
	

    $url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1

    return @{
        Version = $matches.Version
        URL64   = 'https://poppler.freedesktop.org/' + $url.href
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
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*?)`"(.*?)$" = "`$1$($Latest.FileName64)`"`$3"
        }
    }
}

update -ChecksumFor none