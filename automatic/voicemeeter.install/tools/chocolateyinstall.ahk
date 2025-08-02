#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
winTitle1 := "VB-Audio Voicemeeter Installation"
WinWait(winTitle1,, 30)
ControlSend "{Enter}",,"VB-Audio Voicemeeter Installation"

Sleep 10000

SetTitleMatchMode 2  ; A windows's title can contain WinTitle anywhere inside it to be a match
winTitle3 := "Windows"
WinWait(winTitle1,, 10)

if WinExist(winTitle3)
{
  WinActivate
  ControlClick "Button1",winTitle3
}

SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
winTitle2 := "REBOOT YOUR SYSTEM"
WinWait(winTitle2,, 60)
WinActivate
SetControlDelay -1
;ControlClick, OK, %winTitle2% ahk_class #32770
ControlClick "Button1",winTitle2,,,,"NA"