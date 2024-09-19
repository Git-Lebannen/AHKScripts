; This script opens directories that are specified in the program by the individual user.
; Directories can be opened in cmd or the file explorer, depening on the hotkey.
; File explorer hotkeys are <CTRL> + <SPACE> + <1> to <9>
; CMD hotkeys are <ALT> + <SPACE> + <1> to <9>
; ! Attention User, this script requires a "directories.txt" file to be placed in the same directory as this script.
; ! It must be formatted with each directory inputted as text on a seperate line, without additional characters.
; ! Example:
; C:\Users\Lebannen\Coding\ahkScripts
; C:\Users\Lebannen\Documents
; C:\Users\Lebannen\Pictures

#NoEnv ; Increses performance, avoids bugs caused by environment variables
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

file := "directories.txt"
directories := []

FileRead, LoadedText, %file%
oText := StrSplit(LoadedText, "`n")
Loop, % oText.MaxIndex()
    directories.Push(oText[A_Index])

first = % oText[1]
second = % oText[2]

MsgBox, %first%, %second%
