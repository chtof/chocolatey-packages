$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/wings/files/wings/'
    $regex    = 'wings-x64-(?<Version>[\d\.]+).exe$'

    (Invoke-WebRequest -Uri $releases).RawContent -match $regex | Out-Null    
    $version = $matches.Version

    return @{
        Version = $version        
        URL32 = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/wings/wings/' + $version + '/wings-' + $version + '.exe')) -Replace ('\?viasf=1', '')
        URL64 = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/wings/wings/' + $version + '/wings-x64-' + $version + '.exe')) -Replace ('\?viasf=1', '')
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
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none