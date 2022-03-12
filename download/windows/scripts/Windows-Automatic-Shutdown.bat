@echo off
title Windows Automatic Shutdown by Kurou
color 0A

:: Start-up
cls
echo 				##################################################################
echo 				#								 #
echo 				#		Automatic Shutdown script created by Kurou.	 #
echo 				#	     Website: https://kurou-kun.github.io		 #
echo 				#								 #
echo 				##################################################################
echo 				#								 #
echo 				#	  You are using this script on your own risk!		 #
echo 				#								 #
echo 				##################################################################
echo.
echo 						     PRESS ANY KEY TO START
pause>nul
cls
echo Chose what you want to do:
echo.
echo [1] - Set automatic shutdown after certain amount of time.
echo.
echo [2] - Cancel automatic shutdown.
echo.

set choice=
set /p choice=Your choice:  
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto question
if '%choice%'=='2' goto cancel
ECHO "%choice%" is not valid, try again
pause>nul

:question
cls
echo How long do you want to wait until shutdown? (Type in seconds)
echo.
set /p id="Enter amount: "
goto shutdown

:shutdown
cls
echo Setting automatic shutdown...
shutdown -s -t %id%
goto success

:success
echo.
echo Done!
echo.
echo PRESS ANY KEY TO EXIT
pause>nul
exit

:cancel
cls
echo Canceling automatic shutdown...
shutdown -a
goto success