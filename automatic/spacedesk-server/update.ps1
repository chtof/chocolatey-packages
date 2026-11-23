import-module au

function global:au_BeforeUpdate() {  
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $releases = 'https://www.spacedesk.net/download'   
    $regexVersion = 'msi version: (?<Version>[\d\.]+)\</'

    $url32 = Get-RedirectedUrl https://spacedesk.net/downloadidd32
    $url64 = Get-RedirectedUrl https://spacedesk.net/downloadidd64
    (Invoke-WebRequest -Uri $releases).RawContent -match $regexVersion | Out-Null

    return @{
        Version = $matches.Version

        URL32 = $url32
        URL64 = $url64
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url32\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum32\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"            
            "(^(\s)*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"            
        }
    }
}

update -ChecksumFor none