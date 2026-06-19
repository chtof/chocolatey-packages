SendMode "Input"
SetTitleMatchMode(1)   ;match if begins
DetectHiddenText(false)
DetectHiddenWindows(false)

; Installation
winTitle := "ahk_class #32770"
WinWait(winTitle, "The previous version of FontForge must be uninstalled first. Continue?", 120)
WinActivate()
ControlClick "Button1", winTitle,,,,"NA" ; &Yes but based on local language

; User preferences
winTitle := "ahk_class #32770"
WinWait(winTitle, "Do you want to remove user preferences?", 120)
WinActivate()
ControlClick "Button2", winTitle,,,,"NA" ; &No but based on local language

ExitApp()