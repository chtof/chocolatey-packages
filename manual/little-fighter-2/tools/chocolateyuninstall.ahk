#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  

winTitle1 := "Uninstall ahk_exe Uninstal.exe"
WinWait(winTitle1, "This program will uninstall Little Fighter 2", 300)
ControlClick "Button1", winTitle1 ; OK
Sleep 500

WinWait(winTitle1, "has been successfully removed from your hard drive.", 60)
Sleep 500
ControlClick "Button1", winTitle1 ; OK