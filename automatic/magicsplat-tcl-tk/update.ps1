import-module au

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'https://sourceforge.net/projects/magicsplat/files/magicsplat-tcl/'
  $regex32 = 'tcl-[\d\.]+-installer-[\d\.]+-x86.msi'
  $regex64 = 'tcl-[\d\.]+-installer-(?<Version>[\d\.]+)-x64.msi'

  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url32 = $download_page.links | Sort -Descending -Property href | ? href -match $regex32 | Select -First 1
  $url64 = $download_page.links | Sort -Descending -Property href | ? href -match $regex64 | Select -First 1

  return @{
    Version = $matches.Version
    URL32   = (Get-RedirectedUrl $url32.href) -Replace ('\?viasf=1', '')
    URL64   = (Get-RedirectedUrl $url64.href) -Replace ('\?viasf=1', '')
  }
}

function global:au_SearchReplace {
    @{
        "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"               = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"               = "`${1}$($Latest.URL64)"            
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

update -ChecksumFor none -noCheckUrl