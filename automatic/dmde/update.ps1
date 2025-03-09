import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://dmde.com/download.html'
    $regex32    = 'dmde-[\d\.-]+-win32-gui.zip'
    $regex64    = 'dmde-(?<Version>[\d\.-]+)-win64-gui.zip'
    
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = $download_page.links | ? href -match $regex32 | Select -Last 1
    $url64 = $download_page.links | ? href -match $regex64 | Select -Last 1
    
     return @{
        Version = $matches.Version -Replace '-','.'
        URL32   = 'https://dmde.com' + $url32.href
        URL64   = 'https://dmde.com' + $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
            "(?i)(^\s*file32\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
            "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none