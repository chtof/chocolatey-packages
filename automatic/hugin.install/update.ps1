$ErrorActionPreference = 'Stop'
import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {    
    $releases ='https://sourceforge.net/projects/hugin/files/hugin/'
    $regex = "/hugin/hugin-[\d\.]+/Hugin-(?<Version>[\d\.]+)-win64.msi"

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
	#$url = $download_page.links | ? href -match $regex
    $download_page.RawContent -match $regex | Out-Null
    
    return @{
        Version = $matches.Version
        URL64 = (Get-RedirectedUrl ("https://sourceforge.net/projects/hugin/files" + $matches.0)) -Replace '\?viasf=1',''
    }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
