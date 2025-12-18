#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
winTitle1 = VB-Audio Voicemeeter Installation
WinWait, %winTitle1%,, 180
ControlSend,, {Enter}, %winTitle1%

Sleep 20000

SetTitleMatchMode, 2  ; A windows's title can contain WinTitle anywhere inside it to be a match
winTitle3 = Windows
WinWait, %winTitle3%,, 30
ifWinExist, %winTitle3%
{
WinActivate
ControlClick, Button1, %winTitle3%
}

SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
winTitle2 = REBOOT YOUR SYSTEM
WinWait, %winTitle2%,, 30
WinActivate
ControlClick, OK, %winTitle2% ahk_class #32770