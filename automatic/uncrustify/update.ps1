import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'https://sourceforge.net/projects/uncrustify/files/'
  $regex    = 'href="/projects/uncrustify/files/latest/download" title="/uncrustify-(?<Version>[\d\.-]+)/uncrustify-(?<VersionFile>.*)-win(32|64).zip'
  
  (Invoke-WebRequest -Uri $releases) -match $regex | Out-Null  
  $version      = $matches.Version
  $versionNuget = $version -Replace '-','.' -Replace '(\d+).(\d+).(\d+)', '$1$2.$3'
  $versionFile  = $matches.VersionFile

  return @{
    Version = $versionNuget   
    URL32   = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/uncrustify/uncrustify-' + $version + '/uncrustify-' + $versionFile + '-win32.zip'))  -Replace '\?viasf=.*',''
    URL64   = (Get-RedirectedUrl ('https://downloads.sourceforge.net/project/uncrustify/uncrustify-' + $version + '/uncrustify-' + $versionFile + '-win64.zip'))  -Replace '\?viasf=.*',''
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""          
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}