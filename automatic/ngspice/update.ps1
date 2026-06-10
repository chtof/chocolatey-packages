import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases = 'https://sourceforge.net/projects/ngspice/files/ng-spice-rework'  
  $regex    = '/projects/ngspice/files/ng-spice-rework/[\d]+/$'
  $version_url = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -Last 1
  


  $releases = 'https://sourceforge.net' + $version_url.href
  $regex    = '/ngspice-(?<version>[\d]+)_64.(zip|7z)'
  
  $download_page = (Invoke-WebRequest -Uri $releases -useBasicParsing).links | ? href -match $regex | Select -First 1
  $version = $matches.version

  return @{
    Version = $Version + ".0"    
    URL64 = (Get-RedirectedUrl $download_page.href) -Replace '\?viasf=.*', ''
  }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{                        
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"            
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}