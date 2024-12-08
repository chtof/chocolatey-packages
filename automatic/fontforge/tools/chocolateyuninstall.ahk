#NoTrayIcon
SendMode("Input")
SetWorkingDir(A_ScriptDir)
SetTitleMatchMode(1)   ;match if begins
DetectHiddenText(false)
DetectHiddenWindows(false)

winTitle := "ahk_class #32770"

WinWait(winTitle, "Do you want to remove user preferences?", 120)
WinActivate()
Send("{Enter}")

ExitApp()