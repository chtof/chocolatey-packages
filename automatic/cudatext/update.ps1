$ErrorActionPreference = 'Stop'
import-module au

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

function global:au_BeforeUpdate { Get-RemoteFiles -NoSuffix -Purge }

function global:au_GetLatest {
    $releases        = 'https://www.fosshub.com/CudaText.html'    
    $regexReleaseId  = '"r":"(?<releaseId>.*?)"'
    #$regexFileName32 = '"n":"(?<fileName>cudatext-win-x32-[\d\.]+.zip)"'
    $regexFileName64 = '"n":"(?<fileName>cudatext-win-x64-(?<Version>[\d\.]+).zip)"'
    
    #[xml]$doc = (New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/api/v2/Search()?%24filter=%28Id%20eq%20%27cudatext%27%29&%24skip=0&%24top=30&searchTerm=%27cudatext%27&targetFramework=%27%27&includePrerelease=false")
    #$remoteVersionCudatext = $doc.feed.entry.properties.version  | Select -Last 1
    #[xml]$doc = (New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/api/v2/Search()?%24filter=%28Id%20eq%20%27cudatext%27%29&%24skip=0&%24top=30&searchTerm=%27cudatext%27&targetFramework=%27%27&includePrerelease=true")
    #$remoteVersionCudatextBeta = $doc.feed.entry.properties.version -Replace '-beta', '' | Select -Last 1


    #$releasesBeta = 'https://sourceforge.net/projects/cudatext/files/beta_version/'
    #$regexBeta    = '(?<FileNameBeta>cudatext-win-x64-(?<VersionBeta>[\d\.]+).zip)'
    #(Invoke-WebRequest -Uri $releasesBeta).Content -match $regexBeta | Out-Null
    #$versionBeta  = $matches.VersionBeta
    #$filenameBeta = $matches.FileNameBeta

    #$releases = 'https://sourceforge.net/projects/cudatext/files/'
    #$regex    = '(?<FileNameBeta>cudatext-win-x64-(?<VersionBeta>[\d\.]+).zip)'

    $downloadPage = (Invoke-WebRequest -Uri $releases).Content

    $downloadPage -match $regexReleaseId | Out-Null
    $releaseId = $matches.releaseId

    #$downloadPage -match $regexFileName32 | Out-Null
    #$fileName32 = $matches.fileName

    $downloadPage -match $regexFileName64 | Out-Null
    $fileName64 = $matches.fileName
    $version    = $matches.Version

    #if ([System.Version]$version -gt [System.Version]$remoteVersionCudatext) {      
        #$jsonRaw    = Invoke-WebRequest -Uri "https://api.fosshub.com/download/" -Method "POST" -Headers @{"referer"="https://www.fosshub.com/";"method"="POST"} -ContentType "application/json; charset=UTF-8" -Body "{`"projectId`":`"5c191d1d0b70535796ca860d`",`"releaseId`":`"$releaseId`",`"projectUri`":`"CudaText.html`",`"fileName`":`"$fileName32`",`"source`":`"CF`"}"
        #$json32     = ConvertFrom-Json $jsonRaw
        #$checksum32 = Get-RemoteChecksum $json32.data.url
        $jsonRaw    = Invoke-WebRequest -Uri "https://api.fosshub.com/download/" -Method "POST" -Headers @{"referer"="https://www.fosshub.com/";"method"="POST"} -ContentType "application/json; charset=UTF-8" -Body "{`"projectId`":`"5c191d1d0b70535796ca860d`",`"releaseId`":`"$releaseId`",`"projectUri`":`"CudaText.html`",`"fileName`":`"$fileName64`",`"source`":`"CF`"}"
        $json64     = ConvertFrom-Json $jsonRaw
        $checksum64 = Get-RemoteChecksum $json64.data.url

          return @{
            Version    = $version            
            URL64      = $json64.data.url
            Checksum64 = $checksum64
        }
}

function global:au_SearchReplace {
   @{
        "legal\VERIFICATION.txt"  = @{
            #"(?i)(x32: ).*"             = "`${1}https://www.fosshub.com/CudaText.html?dwl=$($Latest.FileName32)"
            "(?i)(x64: ).*"             = "`${1}https://www.fosshub.com/CudaText.html?dwl=$($Latest.FileName64)"            
            "(?i)(checksum type:\s+).*" = "`${1}$($Latest.ChecksumType64)"
            #"(?i)(checksum32:).*"       = "`${1} $($Latest.Checksum32)"
            "(?i)(checksum64:).*"       = "`${1} $($Latest.Checksum64)"
        }
       "tools\chocolateyinstall.ps1" = @{
          #"(?i)(^\s*file\s*=\s*`"[$]toolsDir\\)(.*)`""   = "`${1}$($Latest.FileName32)`""
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName64)`""
        }
    }
}

update -NoCheckUrl -ChecksumFor none