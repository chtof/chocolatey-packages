import-module au
 
[System.Net.ServicePointManager]::SecurityProtocol = 3072 -bor 768 -bor [System.Net.SecurityProtocolType]::Tls -bor [System.Net.SecurityProtocolType]::Ssl3

function global:au_GetLatest {
  $releases = 'http://losslessaudiochecker.com'  
  $regex    = 'GUI v(?<Version>[\d\.]+) \(Regular users\)'

  $download_page = (Invoke-WebRequest -Uri $releases).RawContent -match $regex
  
  return @{
    Version = $matches.Version
    URL32   = 'http://losslessaudiochecker.com/dl/Lossless-Audio-Checker-Windows-32bit.zip'
    URL64   = 'http://losslessaudiochecker.com/dl/Lossless-Audio-Checker-Windows-64bit.zip'
  }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*url\s*=\s*)('.*')" = "`$1'$($Latest.URL32)'"
            "(^(\s)*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^(\s)*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }        
    }
}

update -noCheckUrl
