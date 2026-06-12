import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $data = github_GetInfo -ArgumentList @{
        repository = 'fontforge/fontforge'
        regex64    = 'FontForge-(?<Version>[\d-]+)-Windows-x64.exe$'
    }

    If ($data.Version -match '[\d]{8}') {
        $data.Version = $data.Version -Replace '([\d]{4})([\d]{2})([\d]{2})', '$1.$2.$3'
    }
   
   return $data
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{            
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

update -ChecksumFor none