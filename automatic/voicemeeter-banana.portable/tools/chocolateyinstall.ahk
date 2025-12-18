#NoTrayIcon
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 20  
SetWorkingDir A_ScriptDir  ; Ensures a consistent starting directory.

winTitle1 := "VB-Audio Voicemeeter Installation"              
WinWait(winTitle1,, 180)
WinActivate
ControlSend "{Enter}","",winTitle1

winTitle2 := "REBOOT YOUR SYSTEM"
WinWait(winTitle2,, 30)
WinActivate
ControlClick "OK", "",winTitle2