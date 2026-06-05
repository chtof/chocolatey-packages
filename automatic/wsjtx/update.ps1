import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {    
    $releases = 'https://wsjt.sourceforge.io/downloads.html'
    $regex32  = 'wsjtx-[\d\.]+-win32.exe$'
    $regex64  = 'wsjtx-(?<Version>[\d\.]+)-win64.exe$'

    $url32 = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex32).href
    $url64 = ((Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex64).href
	
    return @{
        Version = $matches.Version
        URL32   = $url32
        URL64   = $url64
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }       
    }
}

update -ChecksumFor none