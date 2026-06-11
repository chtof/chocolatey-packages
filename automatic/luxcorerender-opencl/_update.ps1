$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://luxcorerender.org/download-v2-6/'
    $regex    = 'luxcorerender-v(?<Version>[\d\.]+)-win64-opencl.zip'

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = $download_page.links | ? href -match $regex

    return @{ Version = $matches.Version ; URL64 = $url.href }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName64)`""
          "(Join-Path [$]toolsDir `"luxcorerender-v)[\d\.]+(-win64-opencl\\luxcoreui.exe`")" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

update -ChecksumFor none