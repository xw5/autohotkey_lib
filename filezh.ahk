#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; FileAppend, A line of text to append.`n, .\My Text File.txt
; FileDelete .\My Text File.txt
; FileCreateDir a
; FileCopyDir a, b
FileRemoveDir a, 1
FileSelectFile aa
if aa
    MsgBox 1, tips, %aa%
Else
    MsgBox 1, tips, 未选择文件