#Requires AutoHotkey v2.0

; 设置只在 Path of Exile 游戏窗口中生效
#HotIf WinActive("ahk_exe PathOfExile.exe") or WinActive("ahk_exe PathOfExile_x64.exe")

; 初始化变量
toggle := false
clickerActive := false

; 绑定反引号键
`::
{
    ; 切换开关状态
    toggle := !toggle
    
    if (toggle) {
        ; 如果开启，启动连点器
        clickerActive := true
        SetTimer(AutoClickWithShift, 100)
        ToolTip("自动点击（带Shift）已开启")
    } else {
        ; 如果关闭，停止连点器
        clickerActive := false
        SetTimer(AutoClickWithShift, 0)
        ToolTip("自动点击（带Shift）已关闭")
        SetTimer(() => ToolTip(), -2000)  ; 2秒后隐藏提示
    }
}

; 自动点击函数（带Shift）
AutoClickWithShift() {
    if (clickerActive) {
        Send("{Shift down}")  ; 按下Shift键
        Click
        Send("{Shift up}")    ; 释放Shift键
    }
}

; 当失去游戏窗口焦点时，自动关闭连点器
#HotIf
#HotIf not WinActive("ahk_exe PathOfExile.exe") and not WinActive("ahk_exe PathOfExile_x64.exe")
{
    if (clickerActive) {
        clickerActive := false
        SetTimer(AutoClickWithShift, 0)
        ToolTip("自动点击（带Shift）已关闭（失去游戏焦点）")
        SetTimer(() => ToolTip(), -2000)  ; 2秒后隐藏提示
    }
}