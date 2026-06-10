import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $github_repository = "moonlight-stream/moonlight-qt"
    $releases          = "https://github.com/" + $github_repository + "/releases/latest"    
    $regex64           = 'MoonlightPortable-x64-(?<Version>[\d\.]+).zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing	
    $version       = $matches.Version
    $url64         = $download_page.links | ? href -match $regex64 | Select -First 1

    return @{
        Version = $version        
        URL64   = $url64.href
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

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor 64
}