$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $url_releases = 'https://sourceforge.net/projects/cudatext/files/release'
    $url_last_release = 'https://sourceforge.net' + ((Invoke-WebRequest $url_releases -UseBasicParsing).links | ? href -match '/[\d]+\.[\d]+\.[\d]+\.[\d]+/$' | Select -First 1).href
    
    $regex32   = 'cudatext-windows-i386-([\d\.]+).zip'
    $regex64   = 'cudatext-windows-amd64-(?<Version>[\d\.]+).zip'
        
    $url32 = ((Invoke-WebRequest -Uri $url_last_release -UseBasicParsing).links |? href -match $regex32).href | Select -First 1
    $url64 = ((Invoke-WebRequest -Uri $url_last_release -UseBasicParsing).links |? href -match $regex64).href | Select -First 1


          return @{
            Version    = $matches.Version            
            URL32      = (Get-RedirectedUrl $url32) -Replace '\?viasf=.*', ''
            URL64      = (Get-RedirectedUrl $url64) -Replace '\?viasf=.*', ''
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