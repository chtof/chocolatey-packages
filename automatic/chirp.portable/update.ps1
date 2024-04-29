import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {	
    $releases = "https://trac.chirp.danplanet.com/download?stream=next"
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $regex   = '^chirp-next-(?<date_url>\d+)-win64.zip$'
    $download_page.links | ? href -match $regex
    $version_YY = [int]$matches.date_url.substring(0, $matches.date_url.length-4)
    $version_MM = [int]$matches.date_url.substring($matches.date_url.length-4, 2)
    $version_DD = [int]$matches.date_url.substring($matches.date_url.length-2)
    $version = "$version_YY" + "." + "$version_MM" + "." + "$version_DD"
    return @{
        Version = $version
        URL64   = 'https://trac.chirp.danplanet.com/chirp_next/next-' + $matches.date_url + "/chirp-next-" + $matches.date_url + '-win64.zip' }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"            
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}