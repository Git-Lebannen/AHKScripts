# AHKScripts
A collection of AutoHotkey scripts. Scripts are made to work with AutoHotkey version 2 unless otherwise specified. Download AKH here:

**https://www.autohotkey.com/**

The easiest setup is to copy the master.ahk script to the windows startup folder, found here:

**"C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"**

It will be necessary to open master.ahk and set the *scriptFolder* Variable to the location where you are storing the scripts. Here is an example:

`scriptFolder := "C:\Users\USERNAME\Desktop\ahkScripts"`

# Script funcionality

## AlwaysOnTop
This script puts the active window in always on top mode.<br>
The always on top window will be slightly transparent and renamed to OnTop for legibilty while tabing through windows.<br>
The hotkey is **CTRL** + **SPACE**.

## QuickDirectory
This script opens directories that are specified by the user.<br>
Directories can be opened in cmd or the file explorer, depening on the hotkey.<br>
File explorer hotkeys are **LButton** + **F1** to **F12**.<br>
CMD hotkeys are **RButton** + **F1** to **F12**.

**Attention: this script requires the file "RENAMEME.txt" locatd in *scripts\ahkScripts\quickDirectory* to be renamed to "directories.txt" and then modified to the user's needs.**
Each directory path in the renamed file must be seperated by a ";", no spaces, no quotes. Here's an example:

`C:\Users\Lebannen\Coding\ahkScripts;C:\Users\Lebannen\Documents;C:\Users\Lebannen\Pictures`

Delete any other instructions listed in the "RENAMEME.txt" file before adding your own paths.
