import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/djvu/files/DjVuLibre_Windows'
    $regex   = '(?<Path>/DjVuLibre_Windows/[\d\.]+\+(?<VersionDjView>[\d\.]+)/DjVuLibre-(?<Version>[\d\.]+)_DjView-[\d\.]+_.*.exe)'
    #title="/DjVuLibre_Windows/3.5.28+4.12/DjVuLibre-3.5.28_DjView-4.12_Setup.exe:  rele

    (Invoke-WebRequest -Uri $releases).Content -match $regex | Out-Null

    return @{
        Version = $matches.Version + '.' + $matches.VersionDjView.Replace('.','')        
        URL32 = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/djvu/DjVuLibre_Windows/' + $matches.Version + '+' + $matches.VersionDjView + '/DjVuLibre-' + $matches.Version + '_DjView-' + $matches.VersionDjView + '_Setup.exe')) -Replace ('\?viasf=1', '')
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

update -ChecksumFor none