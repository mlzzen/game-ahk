#Requires AutoHotkey v2.0

; 设置只在 Path of Exile 游戏窗口中生效
#HotIf WinActive("ahk_exe PathOfExile.exe") or WinActive("ahk_exe PathOfExile_x64.exe")

; 按1，自动按1,2,4,5 ，因为我习惯把水银药剂放3
$1::
{
    Send("1")
    Sleep(50)
    Send("2")
    Sleep(50)
    Send("4")
    Sleep(50)
    Send("5")
}
