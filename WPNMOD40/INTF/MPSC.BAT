@ECHO OFF
CLS

:multiplayer_screen
CLS
%wmpath%\TOOL\SCRN D>nul
IF NOT EXIST Z:\IPXNET.COM goto error_multiplayer_unavailable
IF NOT EXIST COMMIT.EXE goto error_multiplayer_unavailable
ECHO  [0m旼컴컴컴컴컴컴컴컴컴컴컴컴�
ECHO 孤 [7;41m껑�   [1;33mMULTIPLAYER[7;41m   갚�[0m 팠袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴袴困
ECHO  읕컴컴컴컴컴컴컴컴컴컴컴컴�
ECHO.
TYPE %wmpath%\DATA\MPMS.MSG
ECHO.
ECHO.
ECHO   [1;33m[1][0m CREATE NEW GAME         旼컴컴컴컴컴컴컴컴컴컴컴컴컴커
ECHO   [1;33m[2][0m JOIN EXISTING GAME      � [1;30mWILL OPEN BLOOD'S SETUP TO[0m �
ECHO                               � [1;30mSET NUMBER OF PLAYERS AND[0m 粕
ECHO                               � [1;30mVARIOUS NETWORK GAME[0m 旼컴켸
ECHO                               � [1;30mOPTIONS.[0m 旼컴컴쩡컴컴�
ECHO                               읕컴컴컴컴켸     �
ECHO                                             旼켸
ECHO                                 旼컴컴컴컴컴�
ECHO                             旼컴�
ECHO                        旼컴켸
ECHO                        �
ECHO  컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
IF NOT EXIST %wmpath%\OPTS\ANGS.SET ECHO  [1;33m[Q][0m RETURN BACK      [1;33m[A][0m ADVANCED GAME SETUP       [1;33m[E][0m EXIT
IF     EXIST %wmpath%\OPTS\ANGS.SET ECHO  [1;33m[Q][0m RETURN BACK     [5;32m�[0m[1;33m[A][0m ADVANCED GAME SETUP       [1;33m[E][0m EXIT
%wmpath%\TOOL\CHOICE /C:12qae /N "[2;20H"
CLS
IF ERRORLEVEL 5 GOTO mp_end
IF ERRORLEVEL 4 GOTO multiplayer_adv_setup
IF ERRORLEVEL 3 GOTO mp_end
IF ERRORLEVEL 2 GOTO multiplayer_join_game_ask_ip
IF ERRORLEVEL 1 GOTO multiplayer_start_server

:multiplayer_start_server
ECHO STARTING HOSTING THE GAME...>>%wmpath%\WMLOG.LOG
IPXNET STARTSERVER
IF EXIST %wmpath%\OPTS\ANGS.SET goto multiplayer_run_setup
COMMIT.EXE
IPXNET STOPSERVER
goto multiplayer_screen

:multiplayer_join_game_ask_ip
CLS
ECHO [1;37mTO CONNECT TO HOST, YOU MUST KNOW IT'S IP ADRESS.
ECHO ENTER IP ADRESS AND PRESS ENTER.
ECHO EXAMPLE: 123.11.12.13
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS ip=ASK HOST IP: [1;33m
%wmpath%\TOOL\STRINGS length=LENGTH %ip%
IF %length% == 0 goto multiplayer_screen
CLS
ECHO JOINING EXISTING GAME AT: %ip%...>>%wmpath%\WMLOG.LOG
ECHO.
ECHO  CONNECTING TO: [1;33m%ip%[0m
ECHO.
IPXNET CONNECT %ip%>%wmpath%\TEMP\IPX.STS
%wmpath%\TOOL\CHANGE %wmpath%\TEMP\IPX.STS " " "_">nul
%wmpath%\TOOL\STRINGS status=READ %wmpath%\TEMP\IPX.STS,3
%wmpath%\TOOL\STRINGS status=LOWER %status%
%wmpath%\TOOL\STRINGS status=LEFT %status%,27
IF %status% == ipx_tunneling_client_failed goto error_client_connect_failed
IF EXIST %wmpath%\OPTS\ANGS.SET goto multiplayer_run_setup
ECHO CLIENT CONNECTED TO: %ip%>>%wmpath%\WMLOG.LOG
COMMIT
IPXNET DISCONNECT
goto multiplayer_screen

:multiplayer_adv_setup
IF     EXIST %wmpath%\OPTS\ANGS.SET goto multiplayer_adv_setup_unmark
IF NOT EXIST %wmpath%\OPTS\ANGS.SET goto multiplayer_adv_setup_mark
:multiplayer_adv_setup_unmark
DEL %wmpath%\OPTS\ANGS.SET
goto multiplayer_screen
:multiplayer_adv_setup_mark
ECHO>%wmpath%\OPTS\ANGS.SET
goto multiplayer_screen

:multiplayer_run_setup
CLS
SETUP
IPXNET DISCONNECT
IPXNET STOPSERVER
goto multiplayer_screen

:error_multiplayer_unavailable
CLS
%wmpath%\TOOL\CURSOR none>nul
ECHO NO IPXNET UTILITY OR COMMIT DEVICE DRIVER FOUNDED!>>%wmpath%\WMLOG.LOG
ECHO.
ECHO  [1;31m旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
ECHO  � NO IPXNET UTILITY OR COMMIT DEVICE DRIVER FOUNDED.            �
ECHO  � MAKE SURE IPX IS ENABLED IN DOSBOX CONFIG FILE AND COMMIT.EXE �
ECHO  � EXIST IN BLOOD DIRECTORY.                                     �
ECHO  � MULTIPLAYER FUNCTIONAL IS UNAVAILABLE.                        �
ECHO  읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
ECHO  PRESS ANY KEY TO EXIT...[0m
pause>nul
goto mp_end

:error_client_connect_failed
CLS
%wmpath%\TOOL\CURSOR none>nul
ECHO CLIENT CONNECTION FAILED TO: %ip%>>%wmpath%\WMLOG.LOG
ECHO.
ECHO  [1;31mFAILED CONNECT TO %ip%. PRESS ANY KEY TO RETURN...[0m
pause>nul
goto multiplayer_screen

:mp_end
CLS
SET length=
SET status=
SET ip=
