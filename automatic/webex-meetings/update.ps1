$ErrorActionPreference = 'Stop'
import-module au

$download_page_url = 'https://cisco.webex.com/webappng/sites/cisco/dashboard/download'
$url_part1 = 'https://cisco.webex.com/client/'
$url_part2 = '/webexapp.msi'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)('.*')"   = "`$1'$($Latest.Url)'"
        }
     }
}

function global:au_GetLatest {
    $homepage_content = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url

     # Get Version
    $homepage_content -match 'WBXclient\-\d+\.\d+\.\d+\-\d+'| Out-Null
    $url_version = $matches[0]
	$recodeversion = $matches[0] -replace "WBXclient-", ""
	$version = $recodeversion -replace "-", "."
    $url = $url_part1 + $url_version + $url_part2
    

    $Latest = @{ URL = $url; Version = $version }
    return $Latest
}

update
