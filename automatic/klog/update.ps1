import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'ea4k/klog'
        regex64    = 'KLog-(.*)-(windows-installer|win64).exe$'        
   }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL64)"
            "(?i)(Get-RemoteChecksum ).*" = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*"   = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"         = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none