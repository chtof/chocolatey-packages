import-module au

function global:au_BeforeUpdate {
    Get-RemoteFiles -NoSuffix -Purge
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    <#$releases = 'https://download.kde.org/stable/labplot/'
    
    $regexLastMajorVersion = '<a href="(?<Version>[\d\.]+)/">'
    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links |? href -match '^([\d\.]+)/' | Select -Last 1 | Out-Null
    $majorVersion = $matches.1

    $releases = 'https://download.kde.org/stable/labplot/' + $majorVersion + '/labplot-' + $majorVersion + '-64bit-setup.exe.mirrorlist'
    $regex    = 'labplot-(?<Version>[\d\.]+)-64bit-setup.exe'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -First 1 | Out-Null
    $version = $matches.Version
    $url = Get-RedirectedUrl ('https://download.kde.org/stable/labplot/' + $majorVersion + '/labplot-' + $majorVersion + '-64bit-setup.exe')#>

    $releases = 'https://labplot.kde.org/download/'
    $regex    = 'labplot-(?<Version>[\d\.]+)((-x86)?[-_]64(bit)?-setup)?.exe'    
    $url = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex).href

    return @{
        Version = $matches.Version
        URL64   = Get-RedirectedUrl $url
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
            "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none -NocheckUrl