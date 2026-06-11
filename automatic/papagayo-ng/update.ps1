import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/papagayo-ng/files/stable/'
    $regex    = '(?<File>PapagayoNG-(?<Version>[\d\.]+)-[\d\.]+-[\d]+-win-32bit.exe)'

    $download_page = Invoke-WebRequest -Uri $releases
	$download_page.Content -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $matches.Version        
        URL32 = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/papagayo-ng/stable/' + $version + '/' + $matches.File)) -Replace '\?viasf=.*',''
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}