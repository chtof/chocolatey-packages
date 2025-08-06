import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate() {
    Get-RemoteFiles -NoSuffix -Purge    
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'leokhoa/laragon'
        regex64    = '/laragon-wamp.exe$'        
   }
}

function global:au_SearchReplace {
    @{
       "tools\chocolateyinstall.ps1" = @{          
          "(^(\s)*url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
          "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}