MouseTimer()
{
	If !IsSet(RunMouseTimer) {
		global RunMouseTimer := True
	} Else If (RunMouseTimer = True) {
		RunMouseTimer := False
	} Else If (RunMouseTimer = False) {
		RunMouseTimer := True
	}
	ShowMouseTimer()
	If IsSet(ActiveTitle) {
		WinActivate ActiveTitle
	}
	Return
}

ShowMouseTimer()
{
	CoordMode "Mouse"
	Count := 0
	StartTime := A_TickCount
	Loop
	{
		If (RunMouseTimer = False) {
			If WinExist("MouseTimerRunning") {
				WinClose "MouseTimerRunning"
			}
			Break
		}
		Sleep 950
		If WinExist("MouseTimerRunning") {
			WinClose "MouseTimerRunning"
		}
		Count := Round((A_TickCount - StartTime)/1000)
		Min := Count//60
		Sec := SubStr("0" . Mod(Count, 60), -2)
		CountTime := Min . ":" . Sec
		MouseGetPos &MouseX, &MouseY
		ToX := MouseX + 20
		ToY := MouseY - 5		
		MouseTimer := Gui("AlwaysOnTop", "MouseTimerRunning")
		MouseTimer.Opt("Border -Caption +E0x20 +ToolWindow")
		MouseTimer.BackColor := "Black"
		MouseTimer.SetFont("s10", "Meiryo UI")
		MouseTimer.Add("Text", "cGreen Center", CountTime)
		MouseTimer.Show("X" ToX " Y" ToY " NA")
		WinSetTransparent 191, "MouseTimerRunning"
	}
	Return
}
