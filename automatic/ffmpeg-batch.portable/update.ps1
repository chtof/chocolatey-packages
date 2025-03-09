$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases = 'https://sourceforge.net/projects/ffmpeg-batch/files/'    
    $regex32 = 'FFbatch_AV_Converter_Portable_[\d.]+_32bit.exe'    
    $regex64 = 'FFbatch_AV_Converter_Portable_(?<Version>[\d.]+)_64bit.exe'

    $download_page_links = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links
    $url32 = ($download_page_links | ? href -match $regex32 | Select -First 1).href
    $url64 = ($download_page_links | ? href -match $regex64 | Select -First 1).href

    return @{
        Version = $matches.Version
        URL32 = (Get-RedirectedUrl ( $url32 )) -Replace ('\?viasf=1', '')
        URL64 = (Get-RedirectedUrl ( $url64 )) -Replace ('\?viasf=1', '')
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName32)`""          
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName64)`""          
        }
    }
}

update -ChecksumFor none
