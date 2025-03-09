import-module au

function global:au_BeforeUpdate {
    Get-RemoteFiles -NoSuffix -Purge
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {    
    $releases = 'http://gnuplot.sourceforge.net'
    $regex    = 'https://sourceforge.net/projects/gnuplot/files/gnuplot/(?<Version>[\d\.]+)/'

    $url             = (Invoke-WebRequest -Uri $releases -UseBasicParsing).links | ? href -match $regex | Select -Last 1
    $version         = $matches.Version
    $versionSoftware = $version -Replace '\.', ''    

    return @{
        Version = $version
        URL64   = (Get-RedirectedURL $($url.href +'gp' + $versionSoftware +'-win64-mingw.exe')) -Replace ('\?viasf=1','')
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
          "(?i)(^\s*file64\s*=\s*`"[$]toolsDir\\)(.*)`"" = "`${1}$($Latest.FileName64)`""
        }
    }
}

if ($MyInvocation.InvocationName -ne '.') { # run the update only if script is not sourced
    update -ChecksumFor none -NoCheckUrl
}