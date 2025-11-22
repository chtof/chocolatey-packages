#NoTrayIcon
SendMode "Input"  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 1
SetControlDelay 0

; First install
if !FileExist("$Env:APPDATA\ImprimCheques\ImprChq.ini")
{	
	winTitle1 := "Format d"
	WinWait(winTitle1,, 60)
	if WinExist(winTitle1)
	{
		WinClose
	}
}

winTitle2 := "ImprimCh"
WinWait(winTitle2,, 60)
WinClose winTitle2