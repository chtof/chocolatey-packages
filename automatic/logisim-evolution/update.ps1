Import-Module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate() {
    $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32    
}

function global:au_GetLatest {
   return github_GetInfo -ArgumentList @{
        repository = 'logisim-evolution/logisim-evolution'
        regex32    = 'logisim-evolution-(?<Version>[\d\.]+)-all.jar'
   }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^(\s)*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }        
    }
}

update -ChecksumFor none