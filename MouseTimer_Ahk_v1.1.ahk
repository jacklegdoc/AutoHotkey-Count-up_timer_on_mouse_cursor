; Include this script in auto-execution of main AutoHotkey file.
global RunMouseTimer := False

MouseTimer()
{
	If !IsSet(RunMouseTimer) {
		RunMouseTimer = True
	} Else If (RunMouseTimer = True) {
		RunMouseTimer := False
	} Else If (RunMouseTimer = False) {
		RunMouseTimer := True
	}
	ShowMouseTimer()
	If IsSet(ActiveTitle) {
		WinActivate, %ActiveTitle%
	}
	Return
}

ShowMouseTimer()
{
	CoordMode, Mouse, Screen
	Count := 0
	StartTime := A_TickCount
	Loop
	{
		If (RunMouseTimer = False) {
			If WinExist(MouesTimerRunning) {
				WinClose, MouesTimerRunning
			}
		}
		Sleep, 950
		If WinExist(MouseTimerRunning) {
			WinClose, MouseTimerRunning
		}
		Count := Round((A_TickCount - StartTime)/1000)
		Min := Count//60
		Sec := SubStr("0" . Mod(Count, 60), -1)
		MouseGetPos, PosX, PosY
		PosX := PosX + 20
		PosY := PosY - 5
		Progress, 10: B W100 X%PosX% Y%PosY% C11 ZH0 CT00EE00 CW000000 FM10 FS10, %Min%:%Sec%, , MouseTimerRunning, Meiryo UI
		WinSet, Transparent, 127, MouseTimerRunning
		If (RunMouseTimer = False)
		{
			Progress, 10: Off
			Break
		}
	}
	Return
}
