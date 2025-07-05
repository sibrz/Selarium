@echo off
title lol
color 0C
































:: Create first message popup
echo msgbox "RUN ONLY ON VM, it is made by sibrz” > %temp%\popup1.vbs
start wscript %temp%\popup1.vbs
































:: Play system beep sounds
for /l %%i in (1,1,5) do (
    powershell -c "[console]::beep(800,200)"
    timeout /t 1 >nul
)
































:: Open some apps
start calc
start notepad
start mspaint
































:: Fake typing
powershell -Command "$wshell = New-Object -ComObject wscript.shell; Start-Sleep 2; $wshell.SendKeys('still using the computer, lol XD')"
































:: Play a funny sound (Windows default)
powershell -c "(New-Object Media.SoundPlayer 'C:\Windows\Media\chimes.wav').PlaySync()"
































:: Screen drawing: full-screen colored shapes
powershell -WindowStyle Hidden -Command ^
Add-Type -AssemblyName System.Drawing; ^
$bmp = New-Object Drawing.Bitmap 800,600; ^
$g = [Drawing.Graphics]::FromImage($bmp); ^
$rand = New-Object Random; ^
for ($i=0; $i -lt 100; $i++) { ^
    $color = [Drawing.Color]::FromArgb($rand.Next(256),$rand.Next(256),$rand.Next(256)); ^
    $brush = New-Object Drawing.SolidBrush $color; ^
    $x = $rand.Next(800); $y = $rand.Next(600); ^
    $w = $rand.Next(200); $h = $rand.Next(200); ^
    $g.FillEllipse($brush, $x, $y, $w, $h); ^
}; ^
$form = New-Object Windows.Forms.Form; ^
$form.Text = 'SELARIUM'; ^
$form.Width = 800; $form.Height = 600; ^
$form.StartPosition = 'CenterScreen'; ^
$form.BackgroundImage = $bmp; ^
$form.TopMost = $true; ^
[void]$form.ShowDialog()
































:: End message
echo msgbox "NOW THE SECOND PAYLOAD" > 
%temp%\popup2.vbs
start wscript %temp%\popup2.vbs
:loop
:: Create speech VBScript
echo Set S=CreateObject("SAPI.SpVoice") : S.Speak "soi soi soi soi soi soi" > %temp%\speak.vbs




:: Create error popup VBScript
echo msgbox "A critical system error has occurred. Please contact support.",16,"System Alert" > %temp%\alert.vbs




:: Launch speech and popup
start "" cscript //nologo %temp%\speak.vbs
start "" wscript %temp%\alert.vbs




:: Wait 3 seconds before next popup
ping localhost -n 4 >nul




goto loop
