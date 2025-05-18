@ECHO OFF
CLS

ECHO PLAY SCREEN STATE: %skip_play_screen%>>%wmlog%
ECHO USER PARAMS: %params%>>%wmlog%
ECHO EXTERNAL: %bat_file%>>%wmlog%
ECHO RFF: %BLOOD_RFF%>>%wmlog%
ECHO SND: %SOUNDS_RFF%>>%wmlog%
ECHO EXE: %BLOOD_EXE%>>%wmlog%
ECHO ART: %TILES%>>%wmlog%


:play_screen_state
IF %install% == 0 goto return_back_clean
IF .%1 == .meltdown goto play_meltdown
IF %skip_play_screen% == 1 goto play_blood
IF %skip_play_screen% == 2 goto play_user
IF %skip_play_screen% == 3 goto play_bat_file
IF %skip_play_screen% == 4 goto play_multiplayer
IF %skip_play_screen% == 5 goto command_line
IF %skip_play_screen% == 6 goto exit_wm_requested

%wmpath%\TOOL\SCRN D>nul
goto play_screen_force

:play_screen
CLS
IF %eag% == 1 goto exit_wm_clean
IF NOT %eag% == 1 goto play_screen_force
IF NOT %skip_play_screen% == 0 goto return_back_clean

:play_screen_force
%wmpath%\TOOL\CURSOR none>nul
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO           ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO           ³   [7;41m²±°   [1;33mWEAPONS MOD #4 þþþ FOR BLOOD 1.21   [ENG]   [7;41m°±²[0m   ³ 
ECHO           ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
IF NOT %BLOOD_RFF% == BLOOD.RFF goto show_reminder
IF NOT %SOUNDS_RFF% == SOUNDS.RFF goto show_reminder
IF NOT %BLOOD_EXE% == BLOOD.EXE goto show_reminder
IF NOT %TILES% == %wdr% goto show_reminder
goto skip_reminder
:show_reminder
ECHO.
ECHO           ùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄù
ECHO           [0;31;42m REMINDER: DIFFERENT FILES IS CURRENTLY IN USE!             [0m
ECHO           [1;35mEXE: [1;37m%BLOOD_EXE%   [1;32mSND: [1;37m%SOUNDS_RFF%
ECHO           [1;36mRFF: [1;37m%BLOOD_RFF%   [1;34mART: [1;37m%TILES%[0m
ECHO           ùÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄù
SET reminder=1
:skip_reminder
ECHO.
ECHO           [1;33m[1][0m BLOOD                               [1;33m[M][0m MULTIPLAYER GAME
ECHO           [1;33m[2][0m CRYPTIC PASSAGE                     [1;33m[O][0m WM OPTIONS
ECHO.
ECHO           [1;33m[3][0m RUN BLOOD WITH DEFINED PARAMS ([1;35m%params%[0m)
ECHO           [1;33m[4][0m RUN EXTERNAL FILE ([1;34m%bat_file%[0m)
ECHO.
ECHO.
IF NOT %skip_main_screen% == 1 ECHO           [1;33m[Q][0m RETURN BACK          [1;33m[W][0m COMMAND PROMT          [1;33m[E][0m EXIT
IF %skip_main_screen% == 1 ECHO           [1;33m[Q][0m REINSTALL           [1;33m[W][0m COMMAND PROMT           [1;33m[E][0m EXIT
ECHO. 
ECHO           [1;37mþ[0mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[1;37mþ[0m
ECHO                             ³  [5;1;37mSELECT GAME TO PLAY[0m ³
ECHO                             ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
IF .%reminder% == .1 goto skip_space
ECHO.
ECHO.
ECHO.
:skip_space
SET reminder=
%wmpath%\TOOL\CHOICE /C:1234mowqe /N ""
CLS
IF ERRORLEVEL 9 GOTO exit_wm_clean
IF ERRORLEVEL 8 GOTO return_back_clean
IF ERRORLEVEL 7 GOTO command_line
IF ERRORLEVEL 6 GOTO play_wm_options
IF ERRORLEVEL 5 GOTO play_multiplayer
IF ERRORLEVEL 4 GOTO play_bat_file
IF ERRORLEVEL 3 GOTO play_user
IF ERRORLEVEL 2 GOTO play_crypt
IF ERRORLEVEL 1 GOTO play_blood
goto play_screen

::-----------
:play_blood
ECHO STARTING VANILLA BLOOD...>>%wmlog%
%wmpath%\TOOL\COMMAND /C %BLOOD_EXE% %rff_param% %snd_param% %art_param%>%wmpath%\TEMP\BLOD.STS
goto check_for_error
::-----------

::-----------
:play_crypt
ECHO STARTING CRYPTIC PASSAGE...>>%wmlog%
%wmpath%\TOOL\COMMAND /C CRYPTIC %rff_param% %snd_param% %art_param%>%wmpath%\TEMP\BLOD.STS
goto check_for_error
::-----------

::-----------
:play_wm_options
ECHO ENTERRING WM CONFIGURATION...>>%wmlog%
CALL %wmpath%\INTF\OPTS
IF .%restart% == .1 goto return_back_clean
goto play_screen_force
::-----------

::-----------
:play_random_map
ECHO STARTING RANDOM MAP TOOL...>>%wmlog%
%wmpath%\TOOL\RBM121
goto play_screen
::-----------

::-----------
:play_multiplayer
ECHO STARTING NON-MELTDOWN MULTIPLAYER GAME...>>%wmlog%
CALL %wmpath%\INTF\MPSC
goto play_screen
::-----------

::-----------
:play_meltdown
ECHO %2>%wmpath%\TEMP\CPRS.SET
%wmpath%\TOOl\CHANGE %wmpath%\TEMP\CPRS.SET "?@?" " ">nul
%wmpath%\TOOl\STRINGS mparams=READ %wmpath%\TEMP\CPRS.SET,1
CLS
ECHO STARTING MELTDOWN GAME WITH PARAMS: %mparams%>>%wmlog%
%wmpath%\TOOL\COMMAND /C BLOOD %mparams%>%wmpath%\TEMP\BLOD.STS
SET mparams=
goto check_for_error
::-----------

::-----------
:play_user
ECHO STARTING BLOOD WITH USER PARAMS...>>%wmlog%
%wmpath%\TOOL\COMMAND /C %BLOOD_EXE% %params% %rff_param% %snd_param% %art_param%>%wmpath%\TEMP\BLOD.STS
goto check_for_error
::-----------

::-----------
:play_bat_file
ECHO STARTING EXTERNAL FILE...>>%wmlog%
IF NOT EXIST %bat_file% goto error_no_bat_file
SET incmd=1
%wmpath%\TOOL\STRINGS ext=FILEEXT %bat_file%
IF %ext% == BAT goto start_bat_file
goto start_misc_file
:start_bat_file
%wmpath%\TOOL\COMMAND /C CALL %bat_file%
goto play_bat_file_end
:start_misc_file
%wmpath%\TOOL\COMMAND /C %bat_file%
goto play_bat_file_end
:play_bat_file_end
SET ext=
CD \>nul
CD %wdr%>nul
SET incmd=0
goto play_screen
::-----------

::-----------
:command_line
SET incmd=1
ECHO STARTING COMMAND PROMT...>>%wmlog%
%wmpath%\TOOL\COMMAND /E:2048
CD \>nul
CD %wdr%>nul
SET incmd=0
goto play_screen
::-----------

::-----------
:check_for_error
%wmpath%\TOOL\STRINGS status=READ %wmpath%\TEMP\BLOD.STS,3
%wmpath%\TOOL\STRINGS /P# status=LEFT %status%# 4
%wmpath%\TOOL\STRINGS status=LOWER %status%
IF .%status% == .src\ goto error_blood_display_error
IF .%status% == .erro goto error_blood_display_error
%wmpath%\TOOL\STRINGS status=READ %wmpath%\TEMP\BLOD.STS,2
%wmpath%\TOOL\STRINGS /P# status=LEFT %status%# 4
%wmpath%\TOOL\STRINGS status=LOWER %status%
IF .%status% == .src\ goto error_blood_display_error
IF .%status% == .erro goto error_blood_display_error
%wmpath%\TOOL\STRINGS status=READ %wmpath%\TEMP\BLOD.STS,1
%wmpath%\TOOL\STRINGS /P# status=LEFT %status%# 4
%wmpath%\TOOL\STRINGS status=LOWER %status%
IF .%status% == .src\ goto error_blood_display_error
IF .%status% == .erro goto error_blood_display_error
%wmpath%\TOOL\STRINGS status=READ %wmpath%\TEMP\BLOD.STS,1
%wmpath%\TOOL\STRINGS /P# status=LEFT %status%# 13
%wmpath%\TOOL\STRINGS status=LOWER %status%
IF .%status% == .dos/4gw error goto error_blood_display_error
ECHO %BLOOD_EXE% SEEMS WAS FINISHED WITH NO ERRORS!>>%wmlog%
goto play_screen
::-----------

:error_blood_display_error
CLS
ECHO [0mAn error occured while playing Blood!
ECHO ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[0;31m
ECHO.
TYPE %wmpath%\TEMP\BLOD.STS
ECHO %BLOOD_EXE% STATUS:>>%wmlog%
TYPE %wmpath%\TEMP\BLOD.STS>>%wmlog%
ECHO.
ECHO [0mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
ECHO Defined EXE file is: %BLOOD_EXE%
ECHO You can view detailed report in %wmlog% file.
ECHO Press any key to return...
pause>nul
goto play_screen

:error_no_bat_file
CLS
ECHO.
ECHO  [0;31mNO EXTERNAL FILE "%bat_file%" FOUND!
ECHO  PRESS ANY KEY TO RETURN...[0m
pause>nul
ECHO NO EXTERNAL FILE %bat_file%!>>%wmlog%
goto play_screen

:exit_wm_clean
CALL %wmpath%\INTF\RSTF
SET wmexit=1
goto play_screen_end

:exit_wm_requested
SET wmexit=2
goto play_screen_end

:return_back_clean
IF ERRORLEVEL 8 goto return_back_clean_final
IF NOT %skip_play_screen% == 0 goto check_if_main_screen
goto return_back_clean_final
:check_if_main_screen
IF %skip_main_screen% == 1 goto exit_wm_clean
:return_back_clean_final
CALL %wmpath%\INTF\RSTF

:play_screen_end