import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://klatexformula.sourceforge.io/downloads.html'
    $regex    = 'klatexformula-(?<Version>[\d\.]+)-win32.exe'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Out-Null
    $version = $matches.Version

    return @{
        Version = $matches.Version
        URL32   = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/klatexformula/klatexformula/klatexformula-' + $version + '/klatexformula-' + $version + '-win32.exe')) -Replace '\?viasf=.*',''
        #URL32   = 'https://freefr.dl.sourceforge.net/project/klatexformula/klatexformula/klatexformula-' + $version + '/klatexformula-' + $version + '-win32.exe'
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}