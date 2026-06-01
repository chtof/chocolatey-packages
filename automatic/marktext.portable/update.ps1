import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate() {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'marktext/marktext'        
        #regex64    = '/v(?<Version>[\d\.]*)/.*-x64-win.zip'
        regex64    = '/marktext-win-x64-(?<Version>[\d\.]*).zip$'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{            
            "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"            
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum64)'"
        }        
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor 64 -noCheckUrl
}