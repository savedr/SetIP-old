@echo off

::Check for passed text! If there is one, just set it as IP.

if "%~1" equ "" goto choice
echo Ok! Setting that IP.
netsh interface ipv4 set address name="Ethernet" static %~1
timeout /t 7
ipconfig
echo.
echo Here you go!
goto:eof

:choice
echo Hi! What do you want me to set on Ethernet?
echo. 
echo [A] DHCP
echo [B] Oce (actually Laptop, 134.188.254.101)
echo [C] Canon's default static IP (172.16.1.50)
echo [D] Set your own static IP
echo. 

choice /C abcd /m "Pick one:"

if %errorlevel% equ 1 goto dhcp
if %errorlevel% equ 2 goto oce
if %errorlevel% equ 3 goto canon
if %errorlevel% equ 4 goto customstatic

:dhcp
echo Ok! DHCP it is.

netsh interface ipv4 set address name="Ethernet" dhcp

echo Give me a sec for it to take..
timeout /t 10
ipconfig
echo.
echo Here you go! Press any key to exit.
pause
exit

:oce
echo Ok! Oce "laptop" scheme it is then.

netsh interface ipv4 set address name="Ethernet" static 134.188.254.101 255.255.255.0 134.188.254.1

timeout /t 7
ipconfig
echo.
echo Here you go! Press any key to exit.
pause
exit

:canon
echo Ok! Canon fixed IP mode it is, then.

netsh interface ipv4 set address name="Ethernet" static 172.16.1.150 255.255.255.0 172.16.1.1

timeout /t 7
ipconfig
echo.
echo Here you go! Press any key to exit.
pause
exit

:customstatic
echo Ok! Setting a custom static IP.
echo.
echo Give me an IP address.
set /P ip=
netsh interface ipv4 set address name="Ethernet" static %ip%

timeout /t 7
ipconfig
echo.
echo Here you go! Press any key to exit.
pause
exit
