import-module au

function global:au_BeforeUpdate {    
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    $releases = 'https://wiki.firestormviewer.org/'
    $regex_release_version = '"/changelog:firestorm_change_log_(?<version>[\d\.]+)"'

    (Invoke-WebRequest -Uri $releases -UseBasicParsing) -match $regex_release_version

    
   
    $url32 = $download_page.links | ? href -match $regex32
    $url64 = $download_page.links | ? href -match $regex64 #>
    #https://downloads.firestormviewer.org/release/windows/Phoenix-FirestormOS-Releasex64_AVX2-7-2-4-80712_Setup.exe

    return @{
        Version = ($matches.Version).Replace('-','.')
        #Options = @{ Headers = @{ "Referer" = 'https://www.firestormviewer.org/os-operating-system/' }}        
        URL64   = $url64.href
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{			
            "(^(\s)*url64\s*=\s*)('.*')"          = "`${1}'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')"     = "`${1}'$($Latest.Checksum64)'"            
        }
    }
}

update -noCheckUrl -checksumFor 64