#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 2
y::
on := !on
While on{
 SendInput {d down} 
 Sleep, 500
 SendInput {d up}
 SendInput {a down}
 Sleep, 500
 SendInput {a up}
 }
Return