# AutoHotkey-Count-up_timer_on_mouse_cursor

This script shows a small count-up timer on the right of mouse cursor.  
Script may be included in main with certain hotkey to toggle to show/delete the timer gui.  
Add MouseTimer_Ahk_v1.1.ahk or MouseTimer_Ahk_v2.0.ahk in Lib directory for AutoHotkey version 1.1 or 2.0, respectively.  
  
Example for v1.1:  
; Autoexecution area  
#Include %A_ScriptDir%\Lib\MouseTimer_Ahk_v1.1.ahk  
  
; Win + Alt + t to toggle MouseTimer  
#!t::MouseTimer()  
  
Example for v2.0:  
; Autoexecution area  
#Include "%A_ScriptDir%\Lib\MouseTimer_Ahk_v2.0.ahk"  
  
; Win + Alt + t to toggle MouseTimer  
#!t::MouseTimer()  
  
  
This script was created with reference to the following link (writen in Japanese):  
ahkでタイマーを作る  
https://note.com/optim/n/n507f2deadbf2

マウスに右側にカウントアップするタイマーを表示します。  
Libフォルダに保存し、メインで起動するAutoHotkeyスクリプトにIncludeして、適当なホットキーで起動してください。  
AutoHotkey v1.1であればMouseTimer_Ahk_v1.1.ahk、v2.2であればMouseTimer_Ahk_v2.0.ahkをお使いください。  

下記のリンク先のスクリプトを参考にしました。  
ahkでタイマーを作る  
https://note.com/optim/n/n507f2deadbf2

