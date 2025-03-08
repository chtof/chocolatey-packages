import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'gitextensions/gitextensions'
        regex	   = '/releases/download/.*/GitExtensions-Portable(-x64)?-(?<Version>[\d\.]+)-[\w]+.zip$'
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
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName32)`""
        }
    }
}

update -ChecksumFor 64