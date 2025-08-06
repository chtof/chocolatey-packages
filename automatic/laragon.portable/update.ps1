import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate() {
    Get-RemoteFiles -NoSuffix -Purge    
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'leokhoa/laragon'
        regex64    = '/[\d.]+.zip$'        
   }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""          = "`$1$($Latest.FileName64)`""         
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}