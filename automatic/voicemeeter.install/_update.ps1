﻿import-module au
 
function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
  $releases      = 'https://vb-audio.com/Voicemeeter/index.htm'
  $regex_version = 'Voicemeeter (?<Version>[\d\.]+).*\(EXE file\)'
  $regex_filename = '(?<Filename>Voicemeeter\d*Setup.exe)'

  $download_page = (Invoke-WebRequest -Uri $releases)

  $download_page.RawContent -match $regex_filename | Out-Null
  $filename = $matches.Filename

  $download_page.RawContent -match $regex_version | Out-Null
  
  
  return @{ Version = $matches.Version ; URL32 = 'https://download.vb-audio.com/Download_CABLE/' + $filename }
}

function global:au_SearchReplace {
    @{
       "legal\VERIFICATION.txt"  = @{            
            "(?i)(x32: ).*"             = "`${1}$($Latest.URL32)"
            "(?i)(x64: ).*"             = "`${1}$($Latest.URL32)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType32)"
            "(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum32)"
        }

        "tools\chocolateyinstall.ps1" = @{        
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`$1$($Latest.FileName32)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}