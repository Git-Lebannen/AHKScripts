; This script opens directories that are specified in the program by the individual user.
; Directories can be opened in cmd or the file explorer, depening on the hotkey.
; File explorer hotkeys are LButton + <F1> to <F9>
; CMD hotkeys are MButton + <F1> to <F9>
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

dirs := {}

; read directories file into an array
FileRead, LoadedText, %file%
dirs := StrSplit(LoadedText, ";")

; It's just 18 keybinds, nothing to worry about :D
~LButton & F1::ExploreDir(1)
~LButton & F2::ExploreDir(2)
~LButton & F3::ExploreDir(3)

ExploreDir(i) { 
    global dirs
    path := % dirs[i]
    Run, %path%
}


