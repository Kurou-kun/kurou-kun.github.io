::	Settings
@echo off
color 0A
title Windows 10/11 Activation Script by Kurou

::	Admin permission
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )>nul

::	Start up
cls
echo 				##################################################################
echo 				#								 #
echo 				#		Activation script created by Kurou.		 #
echo 				#	     Website: https://kurou-kun.github.io		 #
echo 				#								 #
echo 				##################################################################
echo 				#								 #
echo  				#		Supported operating systems:			 #
echo 				#								 #
echo  				#	- Windows 10/11 Home					 #
echo  				#	- Windows 10/11 Home N					 #
echo  				#	- Windows 10/11 Home Single Language			 #
echo  				#	- Windows 10/11 Home Country Specific			 #
echo  				#	- Windows 10/11 Professional				 #
echo  				#	- Windows 10/11 Professional N				 #
echo  				#	- Windows 10/11 Education				 #
echo  				#	- Windows 10/11 Education N				 #
echo  				#	- Windows 10/11 Enterprise				 #
echo  				#	- Windows 10/11 Enterprise N				 #
echo 				#								 #
echo 				##################################################################
echo 				#								 #
echo 				#	  You are using this script on your own risk!		 #
echo 				#								 #
echo 				##################################################################
echo.
echo 						     PRESS ANY KEY TO START
endlocal
pause>nul
cls
goto activation

:: Activation process
:activation
echo.
echo Output:
echo.
goto uninstalling

:uninstalling
cscript //nologo c:\windows\system32\slmgr.vbs /upk >nul & echo Uninstalling previous license key... || (SET ErrorLine=102 && echo No previous license key found! && goto :checking)
cscript //nologo c:\windows\system32\slmgr.vbs /cpky >nul & echo Deleting license key from registry... || (SET ErrorLine=102 && echo No previous license key found in registry! && goto :checking)
goto checking

:: Checking Windows 10/11 Edition
:checking
setlocal
for /F "skip=1 tokens=2-4 delims=| " %%A IN ('wmic os get name') do (
    set "os=%%A %%B %%C"
	if "%%C" == "Pro" goto pro
	if "%%C" == "Home" goto home
	if "%%C" == "Home Single Language" goto home_sl
	if "%%C" == "Home N" goto home_n
	if "%%C" == "Home Country Specific" goto home_cs
	if "%%C" == "Pro N" goto pro_n
	if "%%C" == "Education" goto edu
	if "%%C" == "Education N" goto edu_n
	if "%%C" == "Enterprise" goto enterprise
	if "%%C" == "Enterprise N" goto enterprise_n
)
goto failed
endlocal
pause>nul

::	Windows 10/11 Home
:home
cscript //nologo c:\windows\system32\slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul & echo Windows 10 Home - License Key - Loaded || (SET ErrorLine=102 && goto :failed)


::	Windows 10/11 Home N
:home_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul & echo Windows 10 Home N - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Home Single Language
:home_sl
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul & echo Windows 10 Home Single Language - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Home Country Specific
:home_cs
cscript //nologo c:\windows\system32\slmgr.vbs /ipk PVMJN-6DFY6–9CCP6–7BKTT-D3WVR >nul & echo Windows 10 Home Country Specific - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Proffesional
:pro
cscript //nologo c:\windows\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul & echo Windows 10 Proffesional - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Proffesional N
:pro_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul & echo Windows 10 Proffesional N - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Education
:edu
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul & echo Windows 10 Education - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Education N
:edu_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul & echo Windows 10 Education N - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Enterprise
:enterprise
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul & echo Windows 10 Enterprise - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

::	Windows 10/11 Enterprise N
:enterprise_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul & echo Windows 10 Enterprise N - License Key - Loaded || (SET ErrorLine=102 && goto :failed)
goto server

:server
cscript //nologo c:\windows\system32\slmgr.vbs /skms kms8.msguides.co >nul & echo Asking server to register the license... || (SET ErrorLine=102 && goto :failed)
goto ending

:ending
cscript //nologo c:\windows\system32\slmgr.vbs /ato>nul & echo Cleaning up... || (SET ErrorLine=102 && goto :failed)
goto success

:success
cls
echo.
echo 				##################################################################
echo 				#								 #
echo 				#	  	Your system has been activated!			 #
echo 				#								 #
echo 				##################################################################
echo.
set /P c=Do you want to reboot your pc now [Y/N]? 
if /I "%c%" EQU "Y" goto :reboot
if /I "%c%" EQU "N" goto :close
goto :success
pause>nul
exit

::	States
:reboot
shutdown.exe /r /t 00
exit

:close
exit

:failed
cls
echo.
echo 				##################################################################
echo 				#								 #
echo 				#	  Script couldn't activate your operating system.	 #
echo 				#								 #
echo 				##################################################################
echo.
echo 						     PRESS ANY KEY TO EXIT
echo.
pause>nul
exit