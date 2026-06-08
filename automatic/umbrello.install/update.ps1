import-module au
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)\tools"

function global:au_BeforeUpdate {
  $releases_64 = 'https://download.kde.org/stable/umbrello/latest/win64'
  $regex_64    = 'umbrello-(x86_64-)?(w64-)?mingw64-[\d\.]+.*-setup.exe$'

  $download_page_64 = (Invoke-WebRequest -Uri $releases_64 -UseBasicParsing)
  $file_64 = $download_page_64.links | ? href -match $regex_64

  $Latest.URL64          = $releases_64 + '/' + $file_64.href
  $Latest.ChecksumType64 = 'sha256'
  $Latest.Checksum64     = (Get-FileHash -Algorithm SHA256 -Path "$toolsDir\$($file_64.href)").Hash
  $Latest.FileName64     = $file_64.href

  Remove-Item -Path "$toolsDir\*.exe"
  Invoke-WebRequest -Uri $Latest.URL64 -outFile "$toolsDir\$($file_64.href)"
}

function global:au_GetLatest {
  $url = 'https://download.kde.org/Attic/umbrello/'
  $version_folder = ((iwr $url -UseBasicParsing).links | ? href -match '[\d\.]+\.[\d\.]+(\.[\d\.]+)?' | Select -Last 1).href

  $releases_32 = $url + $version_folder + 'win32'
  $regex_32    = 'umbrello-(i686-)?(w64-)?mingw32-(?<Version>[\d\.]+).*-setup.exe$'
  $releases_64 = $url + $version_folder + 'win64'
  $regex_64    = 'umbrello-(x86_64-)?(w64-)?mingw64-[\d\.]+.*-(setup).exe$'

  $download_page_32 = (Invoke-WebRequest -Uri $releases_32 -UseBasicParsing)
  $url_32 = $download_page_32.links | ? href -match $regex_32 | Select -First 1
  $version = $matches.Version

  $download_page_64 = (Invoke-WebRequest -Uri $releases_64 -UseBasicParsing)
  $url_64 = $download_page_64.links | ? href -match $regex_64 | Select -First 1

  return @{
    Version = $version
    URL32   = $releases_32 + "/" + $url_32.href
    URL64   = $releases_64 + "/" + $url_64.href
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
          "(^(\s)*url\s*=\s*)('.*')"      = "`${1}'$($Latest.URL32)'"
          "(^(\s)*url64\s*=\s*)('.*')"      = "`${1}'$($Latest.URL64)'"
          "(^(\s)*checksum\s*=\s*)('.*')" = "`${1}'$($Latest.Checksum32)'"
          "(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`$1$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none
}
