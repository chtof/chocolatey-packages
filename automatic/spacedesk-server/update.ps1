import-module au

function global:au_GetLatest {
    $releases = 'https://www.spacedesk.net/download'
    # $regexVersion = 'spacedesk DRIVER( Beta)?( III)?( RC)? v(?<Version>[\d\.]+)\</td\>'
    $regexVersion = 'msi version: (?<Version>[\d\.]+)\</'

    <# $regex_Win_10_64  = 'spacedesk_driver_Win_10_64_v\d+_BETA.msi'
    $regex_Win_10_32  = 'spacedesk_driver_Win_10_32_v\d+(_BETA)?.msi'
    $regex_Win_8_1_64 = 'spacedesk_driver_Win_8.1_64_v\d+(_BETA)?.msi'
    $regex_Win_8_1_32 = 'spacedesk_driver_Win_8.1_32_v\d+(_BETA)?.msi' #>
    #https://spacedesk.net/downloads/spacedesk_driver_Win_10_64_v0954_BETA.msi
    #https://spacedesk.net/downloads/spacedesk_driver_Win_10_32_v0954_BETA.msi
    #https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_64_v0943_BETA.msi
    #https://spacedesk.net/downloads/spacedesk_driver_Win_8.1_32_v0943_BETA.msi

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page.Content -imatch $regexVersion | Out-Null
    $version = $matches.Version
    $url32 = $download_page.links | ? href -match $regex_Win_10_32
    $url64 = $download_page.links | ? href -match $regex_Win_10_64
    $url32_win81 = $download_page.links | ? href -match $regex_Win_8_1_32
    $url64_win81 = $download_page.links | ? href -match $regex_Win_8_1_64 #>

    $url32 = Get-RedirectedUrl https://spacedesk.net/downloadidd32
    $url64 = Get-RedirectedUrl https://spacedesk.net/downloadidd64
    $url32_win81 = Get-RedirectedUrl https://spacedesk.net/downloadlegacy
    $checksum32_win81 = Get-RemoteChecksum $url32_win81
    $url64_win81 = Get-RedirectedUrl https://spacedesk.net/downloadlegacy64
    $checksum64_win81 = Get-RemoteChecksum $url64_win81
    (Invoke-WebRequest -Uri $releases).RawContent -match $regexVersion | Out-Null

    return @{
        Version = $matches.Version

        URL32 = $url32
        URL64 = $url64

        URL32_win81      = $url32_win81
        Checksum32_win81 = $checksum32_win81

        URL64_win81      = $url64_win81
        Checksum64_win81 = $checksum64_win81
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyinstall.ps1" = @{
            "(^(\s)*[$]url32_win10\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(^(\s)*[$]checksum32_win10\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^(\s)*[$]url64_win10\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(^(\s)*[$]checksum64_win10\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(^(\s)*[$]url32_win7_81\s*=\s*)('.*')"      = "`$1'$($Latest.URL32_win81)'"
            "(^(\s)*[$]checksum32_win7_81\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32_win81)'"
            "(^(\s)*[$]url64_win7_81\s*=\s*)('.*')"      = "`$1'$($Latest.URL64_win81)'"
            "(^(\s)*[$]checksum64_win7_81\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64_win81)'"
        }
    }
}

update -checksumFor none