import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   $output = github_GetInfo -ArgumentList @{
        repository = 'sedwards2009/extraterm'        
        regex64    = 'extratermqt-(?<Version>[\d\.]*)-windows-x64.zip$'        
   }
   return $output
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }
    }
}

If ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor None
}