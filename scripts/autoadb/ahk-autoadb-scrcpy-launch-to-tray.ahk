#NoTrayIcon
#Persistent

global hAutoadb

/* Setup Tray icon and add item that will handle
 * double click events
 */
;//Menu Tray, Icon
Menu Tray, Icon, android.ico
Menu Tray, Add, Show / Hide autoadb, TrayClick
Menu Tray, Default, Show / Hide autoadb

;// Run autoadb hidden
DetectHiddenWindows On
Run autoadb.exe scrcpy.exe --turn-screen-off --power-off-on-close --stay-awake --show-touches,, Hide, PID
WinWait ahk_pid %PID%
hAutoadb := WinExist()
DetectHiddenWindows Off 
return

TrayClick:
OnTrayClick()
return

;// Show / hide Autoadb on double click
OnTrayClick() {
	if DllCall("IsWindowVisible", "Ptr", hAutoadb) {
		WinHide ahk_id %hAutoadb%
	
	} else {
		WinShow ahk_id %hAutoadb%
		WinActivate ahk_id %hAutoadb%
	}
}