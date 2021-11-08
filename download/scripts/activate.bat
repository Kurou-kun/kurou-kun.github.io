::	Settings
@echo off
color 0A
title Windows 10 Activation Script by Kurou

::	Admin permission
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

::	Start up
cls
echo 				##################################################################
echo 				#								 #
echo 				#		Activation script created by Kurou.		 #
echo 				#	     Website: https://www.ren-project.epizy.com/	 #
echo 				#								 #
echo 				##################################################################
echo 				#								 #
echo  				#		Supported operating systems:			 #
echo 				#								 #
echo  				#	- Windows 10 Home					 #
echo  				#	- Windows 10 Home N					 #
echo  				#	- Windows 10 Home Single Language			 #
echo  				#	- Windows 10 Home Country Specific			 #
echo  				#	- Windows 10 Professional				 #
echo  				#	- Windows 10 Professional N				 #
echo  				#	- Windows 10 Education					 #
echo  				#	- Windows 10 Education N				 #
echo  				#	- Windows 10 Enterprise					 #
echo  				#	- Windows 10 Enterprise N				 #
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

:: Checking Windows 10 Edition
setlocal
for /F "skip=1 tokens=2-4 delims=| " %%A IN ('wmic os get name') do (
    set "os=%%A %%B %%C"
	if "%%C" == "Pro" goto pro
	if "%%C" == "Home" goto home
	if "%%C" == "Home Single Language" goto home_sl
	if "%%C" == "Windows 10 Home N" goto home_n
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

::	Windows 10 Home
:home
cscript //nologo c:\windows\system32\slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul & echo Windows 10 Home - License Key - Loaded


::	Windows 10 Home N
:home_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul & echo Windows 10 Home N - License Key - Loaded
goto server

::	Windows 10 Home Single Language
:home_sl
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul & echo Windows 10 Home Single Language - License Key - Loaded
goto server

::	Windows 10 Home Country Specific
:home_cs
cscript //nologo c:\windows\system32\slmgr.vbs /ipk PVMJN-6DFY6–9CCP6–7BKTT-D3WVR >nul & echo Windows 10 Home Country Specific - License Key - Loaded
goto server

::	Windows 10 Proffesional
:pro
cscript //nologo c:\windows\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul & echo Windows 10 Proffesional - License Key - Loaded
goto server

::	Windows 10 Proffesional N
:pro_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul & echo Windows 10 Proffesional N - License Key - Loaded
goto server

::	Windows 10 Education
:edu
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul & echo Windows 10 Education - License Key - Loaded
goto server

::	Windows 10 Education N
:edu_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul & echo Windows 10 Education N - License Key - Loaded
goto server

::	Windows 10 Enterprise
:enterprise
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul & echo Windows 10 Enterprise - License Key - Loaded
goto server

::	Windows 10 Enterprise N
:enterprise_n
cscript //nologo c:\windows\system32\slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul & echo Windows 10 Enterprise N - License Key - Loaded
goto server

:server
echo.&echo.&set i=1
if %i%==1 set KMS_Sev=kms8.msguides.com & echo 1st try
if %i%==2 set KMS_Sev=kms7.msguides.com & echo 2nd try
if %i%==3 set KMS_Sev=kms9.msguides.com & echo 3rd try
if %i%==4 set KMS_Sev=kms.digiboy.ir & echo 4th try
if %i%==5 set KMS_Sev=kms.shuax.com  & echo 5th try
if %i%==6 set KMS_Sev=GuangPeng.uk.to  & echo 6th try
if %i%==7 set KMS_Sev=AlwaysSmile.uk.to  & echo 7th try
if %i%==8 set KMS_Sev=kms.lotro.cc  & echo 8th try
if %i%==9 set KMS_Sev=kms.chinancce.com  & echo 9th try
if %i%==10 goto failed
cscript //nologo c:\windows\system32\slmgr.vbs /skms %KMS_Sev% >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ato | find /i "successfully" && (echo.& echo. & echo. & choice /n /c YN /m "Do you want to restart your PC now [Y,N]?" & if errorlevel 2 exit) || (echo The connection to the server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
shutdown.exe /r /t 00

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