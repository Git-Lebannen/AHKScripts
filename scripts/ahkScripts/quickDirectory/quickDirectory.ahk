; This script opens directories that are specified in the program by the individual user.
; Directories can be opened in cmd or the file explorer, depening on the hotkey.
; File explorer hotkeys are LButton + <F1> to <F12>
; CMD hotkeys are MButton + <F1> to <F12>
; ! Attention User, this script requires a "directories.txt" file to be placed in the same directory as this script.
; ! It must be formatted with each directory inputted as text, each path seperated by a ";", no spaces, no quotes.
; ! Example:
; C:\Users\Lebannen\Coding\ahkScripts;C:\Users\Lebannen\Documents;C:\Users\Lebannen\Pictures

#NoEnv ; Increses performance, avoids bugs caused by environment variables
SendMode Input ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

file := "directories.txt"

dirs := {}

; read directories file into an array
FileRead, LoadedText, %file%
dirs := StrSplit(LoadedText, ";")

; It's just 24 keybinds, nothing to worry about :D

; explorer keybinds
~LButton & F1::ExploreDir(1)
~LButton & F2::ExploreDir(2)
~LButton & F3::ExploreDir(3)
~LButton & F4::ExploreDir(4)
~LButton & F5::ExploreDir(5)
~LButton & F6::ExploreDir(6)
~LButton & F7::ExploreDir(7)
~LButton & F8::ExploreDir(8)
~LButton & F9::ExploreDir(9)
~LButton & F10::ExploreDir(10)
~LButton & F11::ExploreDir(11)
~LButton & F12::ExploreDir(12)

; cmd keybinds
~MButton & F1::CMDDir(1)
~MButton & F2::CMDDir(2)
~MButton & F3::CMDDir(3)
~MButton & F4::CMDDir(4)
~MButton & F5::CMDDir(5)
~MButton & F6::CMDDir(6)
~MButton & F7::CMDDir(7)
~MButton & F8::CMDDir(8)
~MButton & F9::CMDDir(9)
~MButton & F10::CMDDir(10)
~MButton & F11::CMDDir(11)
~MButton & F12::CMDDir(12)

; open the directory in the file explorer 
ExploreDir(i) { 
    global dirs
    path := % dirs[i]
    Run, %path%
}

; open the directory in CMD
CMDDir(i) {
    global dirs
    path := % dirs[i]
    Run "CMD.exe", %path%
}

