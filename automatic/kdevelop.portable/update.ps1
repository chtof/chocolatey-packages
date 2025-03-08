import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
	$releases = 'https://cdn.kde.org/ci-builds/kdevelop/kdevelop/master/windows/'
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing    
    $regex   = 'kdevelop-master-(?<Version>[\d\.-]+)-windows-cl-msvc\d+-x86_64.7z$'
    $url     = $download_page.links | ? href -match $regex
    $version = $matches.Version -Replace '-', '.'
 
    return @{ Version = $version ; URL64 = $releases + $url.href }
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
    update -checksumFor 64
}