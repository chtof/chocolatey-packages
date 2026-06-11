$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate {    
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    $releases = 'https://luxcorerender.org/download-v2-6/'
    $regex    = 'luxcorerender-v(?<Version>[\d\.]+)-win64.zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.Version ; URL64 = $url.href }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
            "(Join-Path [$]toolsDir `"luxcorerender-v)[\d\.]+(-win64\\luxcoreui.exe`")" = "`${1}$($Latest.Version)`${2}"
        }        
    }
}


try {
    update -ChecksumFor none
} catch {
    $ignore = 'The request was aborted: Could not create SSL/TLS secure channel.'
    if ($_ -match $ignore) { Write-Host $ignore; 'ignore' }  else { throw $_ }
}