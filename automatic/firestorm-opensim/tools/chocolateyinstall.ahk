SendMode "Input"     ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode "RegEx"
SetControlDelay 0

; License agreement
winTitle1 := "Firestorm ahk_exe i)Phoenix-FirestormOS-.*_Setup\.exe$"
WinWait(winTitle1,, 600)

; Yes
ControlClick "Button1", winTitle1