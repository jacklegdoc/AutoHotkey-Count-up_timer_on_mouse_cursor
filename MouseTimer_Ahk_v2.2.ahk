IfWinExist, MouseTimerRunning
; Mouse timer is already running
{
	EnableTimer := False
	Return
} Else {
	; Mouse timer is not running
	CoordMode, Mouse, Screen
	EnableTimer := True
	Count := 0
	StartTime := A_TickCount
	Loop
	{
		Count := Round((A_TickCount - StartTime)/1000)
		Min := Count//60
		Sec := SubStr("0" . Mod(Count, 60), -1)
    ; Reload every 0.5 sec
		Sleep, 480
		MouseGetPos, PosX, PosY
		PosX := PosX + 20
		PosY := PosY - 5
		Progress, 10: B W100 X%PosX% Y%PosY% C11 ZH0 CT00EE00 CW000000 FM10 FS10, %Min%:%Sec%, , MouseTimerRunning, Meiryo UI
		WinSet, Transparent, 127, MouseTimerRunning
		If (EnableTimer = False)
		{
			Progress, 10: Off
			Break
		}
	}
}
Return
