#NoEnv
#NoTrayIcon
#Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1 ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0 
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; Locale suppressed to be asked each time for language (enUS,frFR...)
RegDelete, HKEY_CURRENT_USER\Software\Blizzard Entertainment\Launcher, Locale

winTitle1 = ahk_class Blizzard Bootstrapper ahk_exe battle.netInstall.EXE
; Select a Language
; enGB zhCN zhTW deDE enSG esES esMX frFR itIT plPL ptBR ptPT ruRU
WinWait, %winTitle1%,, 15
If WinExist(winTitle1)
{
    ; English by default, unless otherwise stated
    WinActivate
    Send {Enter} ; Continue
}

; Download Window
; Wait for the download to finish
WinWait, %winTitle1%,, 15
Sleep, 10000

; Choose install location
; C:\Program Files (x86)\Battle.net (Default)
; Also contains the option to stop Battle.net from starting on start up
WinWait, %winTitle1%,, 15
If WinExist(winTitle1)
{
    ; Proceed with defaults
    WinActivate
    Send {Enter} ; Continue
}

Exit