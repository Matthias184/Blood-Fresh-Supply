@ECHO OFF
CLS
SET restart=
:game_options_screen
CLS
SET d=[5;35mþ[0;36m
SET strlen=
SET input=
SET oscr=0
%wmpath%\TOOL\SCRN S>nul
ECHO  [0;37mÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO Íµ [31m°±²  [1;33mGAME OPTIONS  [0;31m²±°[0;37m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ECHO.
ECHO  Type blood params (for example INI of user map) or/and external file that 
ECHO  starting after weapons installation (for example, batch file of user addon). 
ECHO.
ECHO  [1;33m[1][0;36m DEFINE BLOOD PARAMS ùùùùùùù ( [0;35m%params%[0;36m )
ECHO.
ECHO  [1;33m[2][0;36m DEFINE EXTERNAL FILE ùùùùùù ( [0;35m%bat_file%[0;36m )
ECHO.
ECHO  [1;30mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[0;37m
ECHO.
ECHO  These options allows you to manage core files of game. This might be useful 
ECHO  if you want play user addons that have their own resources.
ECHO.
ECHO  [1;33m[3] [0;36mDEFINE RESOURCE ARCHIVE       [1;33m[4] [0;36mDEFINE SOUNDS ARCHIVE
ECHO        [0;35mÀÄ%BLOOD_RFF%                       ÀÄ%SOUNDS_RFF%[0;37m
ECHO.
ECHO  [1;33m[5] [0;36mDEFINE EXECUTABLE FILE        [1;33m[6] [0;36mDEFINE PATH TO TILES
ECHO              [0;35mÀÄ%BLOOD_EXE%                    [0;35mÀÄ%TILES%
ECHO.
ECHO  [1;30mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[0;37m
ECHO.
ECHO  These options allow to enable/disable built-in bmouse and Bloody Hands mod.
ECHO.
IF %bmouse% == 0 goto bmos0
IF %bmouse% == 1 goto bmos1
:bmos0
IF %bhm% == 0 ECHO  [1;33m[B] [1;34mENABLE BUILT-IN BMOUSE      [1;33m[S] [0;36m( ) WM BLOODY HANDS MOD[0;37m
IF %bhm% == 1 ECHO  [1;33m[B] [1;34mENABLE BUILT-IN BMOUSE      [1;33m[S] [0;36m(%d%) WM BLOODY HANDS MOD[0;37m
goto game_options_screen_end
:bmos1
IF %bhm% == 0 ECHO  [1;33m[B] [0;31mDISABLE BUILT-IN BMOUSE     [1;33m[S] [0;36m( ) WM BLOODY HANDS MOD[0;37m
IF %bhm% == 1 ECHO  [1;33m[B] [0;31mDISABLE BUILT-IN BMOUSE     [1;33m[S] [0;36m(%d%) WM BLOODY HANDS MOD[0;37m
:game_options_screen_end
ECHO.
ECHO  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
SET d=
%wmpath%\TOOL\CHOICE /C:123456bsdqw /N " [1;33m[Q][0m BACK  [1;30m[G] GAME SETTINGS[0m  [1;33m[W][0m WM STARTUP  [1;33m[D][1;31m DEFAULT"
CLS
ECHO [1;37m
IF ERRORLEVEL 11 GOTO wm_options_screen
IF ERRORLEVEL 10 GOTO options_end
IF .%1 == .meltdown goto options_blocked
IF ERRORLEVEL 9 GOTO reset_options
IF ERRORLEVEL 8 GOTO set_bhm
IF ERRORLEVEL 7 GOTO set_bmouse
IF ERRORLEVEL 6 GOTO set_tiles
IF ERRORLEVEL 5 GOTO set_blood_exe
IF ERRORLEVEL 4 GOTO set_sounds_rff
IF ERRORLEVEL 3 GOTO set_blood_rff
IF ERRORLEVEL 2 GOTO set_extfile
IF ERRORLEVEL 1 GOTO set_params
goto game_options_screen


:wm_options_screen
CLS
SET d=[5;35mþ[0;36m
SET oscr=1
%wmpath%\TOOL\SCRN S>nul
ECHO  [0;37mÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO Íµ [31m°±²  [1;33mWM STARTUP OPTIONS  [0;31m²±°[0;37m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ECHO.
ECHO  This option allows Weapons Mod restore original files if game session
ECHO  was ended incorrectly (for example DosBox was just closed).
ECHO.
IF %repair% == 1 ECHO  [1;33m[F] [0;31mDISABLE FILES REPAIRING ùùùùùùùùù [1;34mþþþþþþÛþ
IF %repair% == 0 ECHO  [1;33m[F] [1;34mENABLE FILES REPAIRING ùùùùùùùùùù [0;31mþÛþþþþþþ
ECHO.
ECHO  [1;30mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[0;37m
ECHO.
ECHO  Enabling or disabling showing post weapon installation screen with game 
ECHO  selection (aka play screen). Select if it should appear or be just 
ECHO  skipped and get you right in:
ECHO.
IF %skip_play_screen% == 0 goto sps0
IF %skip_play_screen% == 1 goto sps1
IF %skip_play_screen% == 2 goto sps2
IF %skip_play_screen% == 3 goto sps3
IF %skip_play_screen% == 4 goto sps4
IF %skip_play_screen% == 5 goto sps5
IF %skip_play_screen% == 6 goto sps6

:sps0
ECHO  [1;33m[1] [0;36m( ) PURE BLOOD             [1;33m[2] [0;36m( ) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m( ) EXTERNAL FILE          [1;33m[4] [0;36m( ) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m( ) COMMAND PROMT          [1;33m[6] [0;36m( ) QUIT WEAPONS MOD[0;37m  [1;30m
goto sps_end

:sps1
ECHO  [1;33m[1] [0;36m(%d%) PURE BLOOD             [1;33m[2] [0;36m( ) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m( ) EXTERNAL FILE          [1;33m[4] [0;36m( ) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m( ) COMMAND PROMT          [1;33m[6] [0;36m( ) QUIT WEAPONS MOD[0;37m  [1;30m
goto sps_end

:sps2
ECHO  [1;33m[1] [0;36m( ) PURE BLOOD             [1;33m[2] [0;36m(%d%) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m( ) EXTERNAL FILE          [1;33m[4] [0;36m( ) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m( ) COMMAND PROMT          [1;33m[6] [0;36m( ) QUIT WEAPONS MOD[0;37m  [1;30m
goto sps_end

:sps3
ECHO  [1;33m[1] [0;36m( ) PURE BLOOD             [1;33m[2] [0;36m( ) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m(%d%) EXTERNAL FILE          [1;33m[4] [0;36m( ) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m( ) COMMAND PROMT          [1;33m[6] [0;36m( ) QUIT WEAPONS MOD[0;37m  [1;30m
goto sps_end

:sps4
ECHO  [1;33m[1] [0;36m( ) PURE BLOOD             [1;33m[2] [0;36m( ) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m( ) EXTERNAL FILE          [1;33m[4] [0;36m(%d%) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m( ) COMMAND PROMT          [1;33m[6] [0;36m( ) QUIT WEAPONS MOD[0;37m  [1;30m
goto sps_end

:sps5
ECHO  [1;33m[1] [0;36m( ) PURE BLOOD             [1;33m[2] [0;36m( ) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m( ) EXTERNAL FILE          [1;33m[4] [0;36m( ) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m(%d%) COMMAND PROMT          [1;33m[6] [0;36m( ) QUIT WEAPONS MOD[0;37m  [1;30m
goto sps_end

:sps6
ECHO  [1;33m[1] [0;36m( ) PURE BLOOD             [1;33m[2] [0;36m( ) BLOOD WITH PARAMS[0;37m [1;30m
ECHO  [1;33m[3] [0;36m( ) EXTERNAL FILE          [1;33m[4] [0;36m( ) MULTIPLAYER MENU[0;37m  [1;30m
ECHO  [1;33m[5] [0;36m( ) COMMAND PROMT          [1;33m[6] [0;36m(%d%) QUIT WEAPONS MOD[0;37m  [1;30m

:sps_end
ECHO.
IF NOT %skip_play_screen% == 0 ECHO  [1;33m[P] [1;34mENABLE PLAY SCREEN ùùùùùùùùùùùùùù [0;31mþÛþþþþþþ[0;37m
IF %skip_play_screen% == 0 ECHO  [1;33m[P] [0;31mDISABLE PLAY SCREEN ùùùùùùùùùùùùùù [1;34mþþþþþþÛþ[0;37m
IF NOT %eag% == 1 ECHO      [0;35mÀÄÄ[1;33m[E] [0;36m( ) EXIT AFTER GAME
IF %eag% == 1     ECHO      [0;35mÀÄÄ[1;33m[E] [0;36m(%d%) EXIT AFTER GAME
ECHO  [1;30mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[0;37m
ECHO.
ECHO  These options allow enabling selecting random weapons (up to 9) and 
ECHO  enabling or disabling the main weapon select screen.
ECHO.
%wmpath%\TOOL\STRINGS skip_main_screen=READ %wmpath%\OPTS\SMNS.SET,1
%wmpath%\TOOL\STRINGS randw=READ %wmpath%\OPTS\RNDW.SET,1
IF %skip_main_screen% == 0 goto sms0
IF %skip_main_screen% == 1 goto sms1

:sms0
SET sms=[1;33m[M] [0;31mDISABLE MAIN SCREEN [1;34m
IF %randw% == 0 ECHO  %sms%  [1;33m[R] [0;36m( ) RANDOM SELECT
IF %randw% == 1 ECHO  %sms%  [1;33m[R] [0;36m(%d%) RANDOM SELECT
goto wm_options_screen_end

:sms1
SET sms=[1;33m[M] [1;34mENABLE MAIN SCREEN  [0;31m
IF %randw% == 0 ECHO  %sms%  [1;33m[R] [0;36m( ) RANDOM SELECT
IF %randw% == 1 ECHO  %sms%  [1;33m[R] [0;36m(%d%) RANDOM SELECT
:wm_options_screen_end
ECHO                                      [0;35mÀÄ[1;33m[U][0;36m UP TO [1;32m%randwc% [0;36mWEAPONS[0;37m
SET sms=
SET d=
ECHO  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
%wmpath%\TOOL\CHOICE /C:123456pemrufdqg /N " [1;33m[Q][0m BACK  [1;33m[G][0m GAME SETTINGS  [1;30m[W] WM STARTUP  [1;33m[D][1;31m DEFAULT"
CLS
IF ERRORLEVEL 15 goto game_options_screen
IF ERRORLEVEL 14 goto options_end
IF .%1 == .meltdown goto options_blocked
IF ERRORLEVEL 13 goto reset_options
IF ERRORLEVEL 12 goto set_repair
IF ERRORLEVEL 11 goto set_randw_counter
IF ERRORLEVEL 10 goto set_rand_weapons
IF ERRORLEVEL 9 goto set_sms
IF ERRORLEVEL 8 goto set_eag
IF ERRORLEVEL 7 goto set_sps0
IF ERRORLEVEL 6 goto set_sps6
IF ERRORLEVEL 5 goto set_sps5
IF ERRORLEVEL 4 goto set_sps4
IF ERRORLEVEL 3 goto set_sps3
IF ERRORLEVEL 2 goto set_sps2
IF ERRORLEVEL 1 goto set_sps1
goto wm_options_screen

:set_params
%wmpath%\TOOL\SCRN D>nul
CLS
ECHO TYPE BLOOD PARAMS AND PRESS ENTER.
ECHO EXAMPLE: -ini DW.INI -noaim -quick
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS input=ASK PARAMS: [1;33m
%wmpath%\TOOL\STRINGS input=UPPER %input%
%wmpath%\TOOL\STRINGS strlen=LENGTH %input%
IF %strlen% == 0 goto game_options_screen
SET params=%input%
ECHO %params%>%wmpath%\OPTS\PRMS.SET
goto game_options_screen

:set_extfile
%wmpath%\TOOL\SCRN D>nul
CLS
ECHO TYPE EXTERNAL FILE TO RUN AND PRESS ENTER.
ECHO EXAMPLE: CWHHROT.BAT or RATM.COM
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS input=ASK EXTERNAL FILE: [1;33m
%wmpath%\TOOL\STRINGS input=UPPER %input%
%wmpath%\TOOL\STRINGS strlen=LENGTH %input%
IF %strlen% == 0 goto game_options_screen
Z:\RESCAN
IF NOT EXIST %input% goto file_not_exist
ECHO %input%>%wmpath%\OPTS\EXTF.SET
%wmpath%\TOOL\CHANGE %wmpath%\OPTS\EXTF.SET "/" "\">nul
CALL %wmpath%\INTF\WMST
goto game_options_screen

:set_blood_rff
%wmpath%\TOOL\SCRN D>nul
CLS
ECHO TYPE FILENAME OF RESOURCE ARCHIVE AND PRESS ENTER.
ECHO EXAMPLE: BLOOD.RFF or FAITD.RFF
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS input=ASK RESOURCE ARCHIVE: [1;33m
%wmpath%\TOOL\STRINGS input=UPPER %input%
%wmpath%\TOOL\STRINGS strlen=LENGTH %input%
IF %strlen% == 0 goto game_options_screen
RESCAN>nul
IF NOT EXIST %input% goto file_not_exist
ECHO %input%>%wmpath%\OPTS\BRFF.SET
%wmpath%\TOOL\CHANGE %wmpath%\OPTS\BRFF.SET "/" "\">nul
CALL %wmpath%\INTF\WMST
CALL %wmpath%\INTF\CTMP %BLOOD_RFF%
SET restart=1
goto game_options_screen

:set_sounds_rff
%wmpath%\TOOL\SCRN D>nul
CLS
ECHO TYPE FILENAME OF SOUNDS ARCHIVE AND PRESS ENTER.
ECHO EXAMPLE: SOUNDS.RFF or FAITD.RFF
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS input=ASK SOUNDS ARCHIVE: [1;33m
%wmpath%\TOOL\STRINGS input=UPPER %input%
%wmpath%\TOOL\STRINGS strlen=LENGTH %input%
IF %strlen% == 0 goto game_options_screen
RESCAN>nul
IF NOT EXIST %input% goto file_not_exist
ECHO %input%>%wmpath%\OPTS\SRFF.SET
%wmpath%\TOOL\CHANGE %wmpath%\OPTS\SRFF.SET "/" "\">nul
CALL %wmpath%\INTF\WMST
CALL %wmpath%\INTF\CTMP %SOUNDS_RFF%
SET restart=1
goto game_options_screen

:set_blood_exe
%wmpath%\TOOL\SCRN D>nul
CLS
ECHO TYPE FILENAME OF TARGET EXECUTABLE FILE FOR HACKS AND PRESS ENTER.
ECHO EXAMPLE: BLOOD.EXE or FAITD.EXE
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS input=ASK EXECUTABLE FILE: [1;33m
%wmpath%\TOOL\STRINGS input=UPPER %input%
%wmpath%\TOOL\STRINGS strlen=LENGTH %input%
IF %strlen% == 0 goto game_options_screen
RESCAN>nul
IF NOT EXIST %input% goto file_not_exist
ECHO %input%>%wmpath%\OPTS\BEXE.SET
%wmpath%\TOOL\CHANGE %wmpath%\OPTS\BEXE.SET "/" "\">nul
CALL %wmpath%\INTF\WMST
CALL %wmpath%\INTF\CTMP %BLOOD_EXE%
SET restart=1
goto game_options_screen

:set_tiles
%wmpath%\TOOL\SCRN D>nul
CLS
ECHO TYPE PATH TO TILESNNN.ART FILES AND PRESS ENTER.
ECHO YOU MAY ALSO LEAVE IT EMPTY TO USE DEFAULT PATH.
ECHO PATH EXAMPLE: DIR1\DIR2\DIR3
ECHO.
%wmpath%\TOOL\CURSOR full>nul
%wmpath%\TOOL\STRINGS input=ASK PATH TO TILESNNN.ART: [1;33m
%wmpath%\TOOL\STRINGS input=UPPER %input%
%wmpath%\TOOL\STRINGS strlen=LENGTH %input%
RESCAN>nul
IF NOT EXIST %input%\*.ART goto tiles_not_exist
IF %strlen% == 0 SET input=\
ECHO %input%>%wmpath%\OPTS\TILS.SET
%wmpath%\TOOL\CHANGE %wmpath%\OPTS\TILS.SET "/" "\">nul
CALL %wmpath%\INTF\WMST
SET restart=1
goto game_options_screen


:set_bhm
CLS
IF %bhm% == 0 goto set_bhm_on
goto set_bhm_off
:set_bhm_on
ECHO 1>%wmpath%\OPTS\BHMD.SET
SET bhm=1
SET restart=1
goto game_options_screen
:set_bhm_off
ECHO 0>%wmpath%\OPTS\BHMD.SET
SET bhm=0
SET restart=1
goto game_options_screen


:set_bmouse
CLS
IF %bmouse% == 0 goto set_bmouse_on
goto set_bmouse_off
:set_bmouse_on
ECHO 1>%wmpath%\OPTS\BMOS.SET
SET bmouse=1
goto game_options_screen
:set_bmouse_off
ECHO 0>%wmpath%\OPTS\BMOS.SET
SET bmouse=0
goto game_options_screen

:set_repair
CLS
IF %repair% == 0 goto set_repair_on
goto set_repair_off
:set_repair_on
SET repair=1
ECHO 1>%wmpath%\OPTS\RPFL.SET
goto wm_options_screen
:set_repair_off
%wmpath%\TOOL\SCRN D>nul
ECHO.
ECHO  [1;37mTURNING THIS OPTION OFF CAN LEAD TO UNPREDICTABLE RESULTS! 
ECHO  ARE YOU SURE YOU WANT DISABLE IT? [1;33m[Y/N]
%wmpath%\TOOL\CHOICE /C:yn /N "[0;37m"
IF ERRORLEVEL 2 goto wm_options_screen
SET repair=0
ECHO 0>%wmpath%\OPTS\RPFL.SET
goto wm_options_screen

:set_rand_weapons
CLS
IF %randw% == 0 goto set_rand_weapons_on
goto set_rand_weapons_off
:set_rand_weapons_on
IF %skip_play_screen% == 4 goto rand_not_allowed
ECHO 1>%wmpath%\OPTS\RNDW.SET
SET randw=1
IF %skip_main_screen% == 0 goto set_sms
goto wm_options_screen
:set_rand_weapons_off
ECHO 0>%wmpath%\OPTS\RNDW.SET
SET randw=0
goto wm_options_screen

:set_randw_counter
CLS
%wmpath%\TOOL\STRINGS randwc=READ %wmpath%\OPTS\RDWC.SET,1
IF %randwc% == 10 goto set_randw_counter_min
%wmpath%\TOOL\STRINGS randwc=ADD %randwc%,1
goto set_randw_counter_save
:set_randw_counter_min
SET randwc=1
:set_randw_counter_save
ECHO %randwc%>%wmpath%\OPTS\RDWC.SET
goto wm_options_screen

:set_sms
CLS
IF %skip_main_screen% == 0 goto set_sms_on
goto set_sms_off
:set_sms_on
ECHO 1>%wmpath%\OPTS\SMNS.SET
SET skip_main_screen=1
goto wm_options_screen
:set_sms_off
ECHO 0>%wmpath%\OPTS\SMNS.SET
SET skip_main_screen=0
IF %randw% == 1 goto set_rand_weapons
goto wm_options_screen

:set_eag
CLS
IF %eag% == 0 goto set_eag_on
goto set_eag_off
:set_eag_on
ECHO 1>%wmpath%\OPTS\EAGM.SET
SET eag=1
goto wm_options_screen
:set_eag_off
ECHO 0>%wmpath%\OPTS\EAGM.SET
SET eag=0
goto wm_options_screen

:set_sps0
CLS
IF %skip_play_screen% == 0 goto set_sps0_on
goto set_sps0_off
:set_sps0_on
ECHO 1>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=1
goto wm_options_screen
:set_sps0_off
ECHO 0>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=0
goto wm_options_screen

:set_sps1
CLS
ECHO 1>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=1
goto wm_options_screen

:set_sps2
CLS
ECHO 2>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=2
goto wm_options_screen

:set_sps3
CLS
ECHO 3>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=3
goto wm_options_screen

:set_sps4
CLS
IF %randw% == 1 goto rand_not_allowed
ECHO 4>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=4
goto wm_options_screen

:set_sps5
CLS
ECHO 5>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=5
goto wm_options_screen

:set_sps6
CLS
ECHO 6>%wmpath%\OPTS\SPLS.SET
SET skip_play_screen=6
goto wm_options_screen

:reset_options
%wmpath%\TOOL\SCRN D>nul
ECHO PLEASE WAIT...
ECHO -ini BLOOD.ini>%wmpath%\OPTS\PRMS.SET
ECHO SETUP.EXE>%wmpath%\OPTS\EXTF.SET
ECHO BLOOD.RFF>%wmpath%\OPTS\BRFF.SET
ECHO SOUNDS.RFF>%wmpath%\OPTS\SRFF.SET
ECHO BLOOD.EXE>%wmpath%\OPTS\BEXE.SET
ECHO \>%wmpath%\OPTS\TILS.SET
ECHO 1>%wmpath%\OPTS\BMOS.SET
ECHO 1>%wmpath%\OPTS\BHMD.SET
ECHO 1>%wmpath%\OPTS\RPFL.SET
ECHO 7>%wmpath%\OPTS\RDWC.SET
ECHO 0>%wmpath%\OPTS\RNDW.SET
ECHO 0>%wmpath%\OPTS\SMNS.SET
ECHO 0>%wmpath%\OPTS\EAGM.SET
ECHO 0>%wmpath%\OPTS\SPLS.SET
SET restart=1
CALL %wmpath%\INTF\WMST
IF %oscr% == 0 goto game_options_screen
goto wm_options_screen

:tiles_not_exist
CLS
ECHO.
ECHO  [1;31mERROR: TILESXXX.ART DOES NOT EXIST IN "%input%" DIRECTORY.
ECHO  Press any key to return...[0;37m
pause>nul
goto game_options_screen

:file_not_exist
CLS
ECHO.
ECHO  [1;31mERROR: FILE "%input%" DOES NOT EXIST.
ECHO  Press any key to return...[0;37m
pause>nul
goto game_options_screen

:rand_not_allowed
CLS
%wmpath%\TOOL\SCRN D>nul
ECHO.
ECHO  [1;31mRANDOM WEAPONS NOT ALLOWED IN MULTIPLAYER AS ALL PLAYERS 
ECHO  SHOULD HAVE SAME WEAPONS TO NOT GET DESYNC.
ECHO.
ECHO  PLEASE DISABLE RANDOM WEAPONS FIRST!
ECHO  Press any key to return...[0;37m
pause>nul
goto wm_options_screen

:options_blocked
CLS
%wmpath%\TOOL\SCRN D>nul
ECHO.
ECHO  [1;31mCHANGING OPTIONS IS NOT AVAILABLE WHILE ONLINE MODE.
ECHO  Press any key to return...[0;37m
pause>nul
goto wm_options_screen

:options_end
IF NOT .%restart% == .1 goto options_end_final
ECHO RESTART OF WEAPONS MOD REQUIRED AS PATHS WAS CHANGED.>>%wmlog%
CLS
%wmpath%\TOOL\SCRN D>nul
ECHO.
ECHO  [1;37mA RESTART OF WEAPONS MOD MAY REQUIRED AS PATHS WAS CHANGED.
ECHO  PLEASE RESTART WEAPONS MOD.
ECHO  Press any key to exit...
pause>nul

:options_end_final
CLS
ECHO [0;37m