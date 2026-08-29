import-module au
. ..\..\helpers\GitHub_Helper.ps1

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
   $info = github_GetInfo -ArgumentList @{
        repository = 'oschwartz10612/poppler-windows'
        regex64    = '/Release-(?<Version>[\d\.-]+).zip'
   }

   # Version mapping. chocolatey.org already hosts source-only poppler packages up to
   # 26.6.0 (25.3.0 through 26.6.0 shipped the upstream source tarball instead of
   # Windows binaries). A tag-derived version such as 26.02.0 normalizes to 26.2.0,
   # which collides with the already-published source-only 26.2.0 (push rejected) and
   # would sort below 26.6.0 anyway, so 'choco install poppler' would keep resolving
   # the broken source-only package. Until poppler-windows overtakes 26.6.0, publish
   # binary releases as 26.6.0.<encoded binary version> so they become the latest.
   # Encoding: major*100000 + minor*1000 + patch*10 + build, e.g. v26.02.0-0 -> 2602000;
   # successive binary releases keep sorting in the right order.
   $m = [regex]::Match($info.URL64, 'Release-(?<base>[\d\.]+)-(?<build>\d+)\.zip')
   $base    = [version]$m.Groups['base'].Value
   $build   = [int]$m.Groups['build'].Value
   $ceiling = [version]'26.6.0'
   if ($base -le $ceiling) {
       $encoded = $base.Major*100000 + $base.Minor*1000 + $base.Build*10 + $build
       $info.Version = "$($ceiling).$($encoded)"
   } elseif ($build -gt 0) {
       $info.Version = "$($m.Groups['base'].Value).$($build)"
   } else {
       $info.Version = $m.Groups['base'].Value
   }
   return $info
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{            
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*?)`"(.*?)$" = "`$1$($Latest.FileName64)`"`$3"
        }
    }
}

update -ChecksumFor none