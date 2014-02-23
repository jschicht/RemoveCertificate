#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <WinAPI.au3>
$InFile = FileOpenDialog("Select file",@ScriptDir,"All (*.*)")
If @error Then Exit
$hFile = _WinAPI_CreateFile("\\.\" & $InFile,2,6,7)
ConsoleWrite("$hFile: " & $hFile & @CRLF)
$index = 0
$aCall = DllCall("Imagehlp.dll", "int", "ImageRemoveCertificate", "handle", $hFile, "dword", $index)
If $aCall[0] <> 1 Then
	MsgBox(0,"Error","No certificate found/removed")
Else
	MsgBox(0,"Info","Success: Certificate removed")
EndIf
