#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
GNS_Version = 2.2.50

; GNS3 Uninstall
winTitle1 = GNS3%A_Space%%GNS_Version%%A_Space%Uninstall
WinWait, %winTitle1%, Are%A_Space%you%A_Space%sure%A_Space%you%A_Space%want%A_Space%to%A_Space%uninstall%A_Space%GNS3%A_Space%%GNS_Version%?, 10
Sleep 750
ControlClick, Button1, %winTitle1% ahk_class #32770
Sleep 750

; GNS3 was successfully removed from your computer.
WinWait, %winTitle1%, GNS3%A_Space%%GNS_Version%%A_Space%was%A_Space%successfully%A_Space%removed%A_Space%from%A_Space%your%A_Space%computer., 10
Sleep 500
ControlClick, OK, %winTitle1% ahk_class #32770
