SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
; SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetTitleMatchMode "RegEx"
SetControlDelay -1

; License agreement
;winTitle1 = Firestorm
winTitle1 := "Firestorm ahk_exe i)Phoenix-Firestorm-.*_Setup\.exe$"
WinWait(winTitle1,, 900)
WinActivate
ControlClick "Button1", winTitle1,,,,"NA" ; Yes
;WinWait, %winTitle1%, Do you want to register Firestorm as default handler for virtual world protocols?, 600
;ControlClick, Button1, %winTitle1% ; &Yes