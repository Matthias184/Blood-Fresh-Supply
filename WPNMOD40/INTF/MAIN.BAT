@ECHO OFF
CLS

::--------------
:: Path to directory with weapons mod data
SET wmpath=WPNMOD40
SET wmlog=%wmpath%\WMLOG.LOG
:: Currently must be set to "WPNMOD40" for Weapon Mod version 4.0. Do NOT change it.
::--------------

::--------------
:: Weapons Mod initialization.
SET wminit=0
CALL %wmpath%\INTF\INIT %1 %2 %3 %4 %5 %6 %7 %8 %9
IF NOT %wminit% == 1 GOTO exit
IF .%1 == .noskip GOTO noskip
IF .%1 == .meltdown GOTO meltdown_show_warning
CLS
goto play_movie
::--------------

:noskip
SET skip_main_screen=0
SET randw=0
goto main_screen

:meltdown_show_warning
IF EXIST %wmpath%\OPTS\MEMS.SET GOTO main_screen
ECHO.>%wmpath%\OPTS\MEMS.SET
ECHO.
TYPE %wmpath%\DATA\MPMS.MSG
ECHO  [1;37mPRESS ANY KEY TO CONTINUE...[0;37m
pause>nul
CLS
GOTO main_screen

::--------------
:: Play title movies.
:play_movie
IF %dosbox% == 0 goto main_screen
IF NOT EXIST %wmpath%\OPTS\MOVS.SET CALL %wmpath%\INTF\PMOV norand
ECHO 1>%wmpath%\OPTS\MOVS.SET
::--------------

:main_screen
IF %wmexit% == 1 goto exit
IF %wmexit% == 2 goto exit
IF %skip_main_screen% == 1 goto skip_main_screen

:main_screen_force
%wmpath%\TOOL\SCRN S>nul
SET sl=[0;37m³ [5;32mû[0;32mþþþ[0;37m ³
SET header=¶ [1;31m//////// [33mWEAPONS MOD #4 þþþ FOR BLOOD V1.21  [ENG] [31m////////[0;37m Ç
IF EXIST %wmpath%\PRST\CURST\*.FLG SET header=¶ [1;31m////  [33mWEAPONS MOD #4 þþþ [37mPRESS [36m[5][37m TO RESET SELECTION  [1;31m////[0;37m Ç
ECHO          [0;37mÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO        ÚÄ%header%Ä¿
ECHO       ÚÁÄÐÄÄÄÂÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÐÄÁ¿
CALL %wmpath%\INTF\GUNB
ECHO       ÀÂÄÒÄÄÄÁÄÄÄÄÁÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÁÄÄÄÒÄÂÙ
ECHO        ÀÄ¶ [31m[1] [1;37mPlay [0;37m³ [31m[2] [1;37mOptions [0;37m³ [31m[3] [1;37mPresets [0;37m³ [31m[4] [1;37mInfo [0;37m³ [31m[0] [1;37mExit  [0;37mÇÄÙ
SET header=
SET ns=
SET sl=
%wmpath%\TOOL\CHOICE /C:qwertyuiopasdfghjklzxcvb123450 /N "         ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍ¼"
CLS
IF ERRORLEVEL 30 GOTO exit
IF ERRORLEVEL 29 GOTO reset_weapon_selection
IF ERRORLEVEL 28 GOTO info_screen
IF ERRORLEVEL 27 GOTO preset_manager
IF ERRORLEVEL 26 GOTO options
IF ERRORLEVEL 25 GOTO inst_n_play
:weapon_codes
IF %randw% == 2 %wmpath%\TOOL\RANDOM 1 24>nul
CLS
IF ERRORLEVEL 24 GOTO leech
IF ERRORLEVEL 23 GOTO coil
IF ERRORLEVEL 22 GOTO smg
IF ERRORLEVEL 21 GOTO buna
IF ERRORLEVEL 20 GOTO dyna
IF ERRORLEVEL 19 GOTO flamer
IF ERRORLEVEL 18 GOTO aero
IF ERRORLEVEL 17 GOTO dkgun
IF ERRORLEVEL 16 GOTO napa
IF ERRORLEVEL 15 GOTO riot
IF ERRORLEVEL 14 GOTO holyd
IF ERRORLEVEL 13 GOTO shot
IF ERRORLEVEL 12 GOTO lupr
IF ERRORLEVEL 11 GOTO briot
IF ERRORLEVEL 10 GOTO pump
IF ERRORLEVEL 9 GOTO rat
IF ERRORLEVEL 8 GOTO heart
IF ERRORLEVEL 7 GOTO colt
IF ERRORLEVEL 6 GOTO revo
IF ERRORLEVEL 5 GOTO magnum
IF ERRORLEVEL 4 GOTO book
IF ERRORLEVEL 3 GOTO axe
IF ERRORLEVEL 2 GOTO sfork
IF ERRORLEVEL 1 GOTO claw
goto main_screen

:sel_weapon_process
IF %randw% == 2 %wmpath%\TOOL\STRINGS stimes=SUB %stimes%,1
goto main_screen

:desel_weapon_process
goto main_screen

:skip_main_screen
IF %randw% == 1 goto randomize_weapons_prepare
IF %randw% == 2 goto randomize_weapons
goto inst_n_play

:randomize_weapons_prepare
IF %randw% == 2 goto randomize_weapons
SET stimes=%randwc%
SET randw=2
IF EXIST %wmpath%\PRST\CURST\*.FLG DEL %wmpath%\PRST\CURST\*.FLG>nul
goto weapon_codes

:randomize_weapons
CLS
%wmpath%\TOOL\CURSOR none>nul
ECHO.
ECHO  [1;35mÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO  ³ RANDOMIZING WEAPONS.   ³
ECHO  ³ PLEASE WAIT...         ³
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ[0;37m
IF %stimes% == 0 SET randw=1
IF %stimes% == 0 goto inst_n_play
goto weapon_codes

:reset_weapon_selection
DEL %wmpath%\PRST\CURST\*.FLG>nul
CLS
goto main_screen

:info_screen
CALL %wmpath%\INTF\IFSC
goto main_screen

:preset_manager
CALL %wmpath%\INTF\PRMG
goto main_screen

:options
CALL %wmpath%\INTF\OPTS %1 %2 %3 %4 %5 %6 %7 %8 %9
IF .%restart% == .1 goto exit_clear_vars
goto main_screen

:inst_n_play
SET s1=
SET s2=
SET s3=
SET s5=
SET s6=
SET s7=
SET s10=
CALL %wmpath%\INTF\INST %1 %2 %3 %4 %5 %6 %7 %8 %9
CALL %wmpath%\INTF\PLSC %1 %2 %3 %4 %5 %6 %7 %8 %9
IF .%restart% == .1 goto exit_clear_vars
goto main_screen

::--------------
:claw
IF .%s1% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\1.flg GOTO setclaw
DEL %wmpath%\PRST\CURST\1.flg>nul
goto desel_weapon_process
:setclaw
IF %randw% == 2 SET s1=1
ECHO.>%wmpath%\PRST\CURST\1.flg
IF EXIST %wmpath%\PRST\CURST\2.flg DEL %wmpath%\PRST\CURST\2.flg>nul
IF EXIST %wmpath%\PRST\CURST\3.flg DEL %wmpath%\PRST\CURST\3.flg>nul
goto sel_weapon_process
::--------------

::--------------
:sfork
IF .%s1% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\2.flg GOTO setsfork
DEL %wmpath%\PRST\CURST\2.flg>nul
goto desel_weapon_process
:setsfork
IF %randw% == 2 SET s1=1
ECHO.>%wmpath%\PRST\CURST\2.flg
IF EXIST %wmpath%\PRST\CURST\1.flg DEL %wmpath%\PRST\CURST\1.flg>nul
IF EXIST %wmpath%\PRST\CURST\3.flg DEL %wmpath%\PRST\CURST\3.flg>nul
goto sel_weapon_process
::--------------

::--------------
:axe
IF .%s1% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\3.flg GOTO setaxe
DEL %wmpath%\PRST\CURST\3.flg>nul
goto desel_weapon_process
:setaxe
IF %randw% == 2 SET s1=1
ECHO.>%wmpath%\PRST\CURST\3.flg
IF EXIST %wmpath%\PRST\CURST\2.flg DEL %wmpath%\PRST\CURST\2.flg>nul
IF EXIST %wmpath%\PRST\CURST\1.flg DEL %wmpath%\PRST\CURST\1.flg>nul
goto sel_weapon_process

::--------------
:book
IF .%s2% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\4.flg GOTO setbook
IF %randw% == 2 goto weapon_codes
DEL %wmpath%\PRST\CURST\4.flg>nul
goto desel_weapon_process
:setbook
IF %randw% == 2 SET s2=1
ECHO.>%wmpath%\PRST\CURST\4.flg
IF EXIST %wmpath%\PRST\CURST\5.flg DEL %wmpath%\PRST\CURST\5.flg>nul
IF EXIST %wmpath%\PRST\CURST\6.flg DEL %wmpath%\PRST\CURST\6.flg>nul
IF EXIST %wmpath%\PRST\CURST\7.flg DEL %wmpath%\PRST\CURST\7.flg>nul
goto sel_weapon_process
::--------------

::--------------
:magnum
IF .%s2% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\5.flg GOTO setmagnum
DEL %wmpath%\PRST\CURST\5.flg>nul
goto desel_weapon_process
:setmagnum
IF %randw% == 2 SET s2=1
ECHO.>%wmpath%\PRST\CURST\5.flg
IF EXIST %wmpath%\PRST\CURST\4.flg DEL %wmpath%\PRST\CURST\4.flg>nul
IF EXIST %wmpath%\PRST\CURST\6.flg DEL %wmpath%\PRST\CURST\6.flg>nul
IF EXIST %wmpath%\PRST\CURST\7.flg DEL %wmpath%\PRST\CURST\7.flg>nul
goto sel_weapon_process
::--------------

::--------------
:revo
IF .%s2% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\6.flg GOTO setrevo
DEL %wmpath%\PRST\CURST\6.flg>nul
goto desel_weapon_process
:setrevo
IF %randw% == 2 SET s2=1
ECHO.>%wmpath%\PRST\CURST\6.flg
IF EXIST %wmpath%\PRST\CURST\4.flg DEL %wmpath%\PRST\CURST\4.flg>nul
IF EXIST %wmpath%\PRST\CURST\5.flg DEL %wmpath%\PRST\CURST\5.flg>nul
IF EXIST %wmpath%\PRST\CURST\7.flg DEL %wmpath%\PRST\CURST\7.flg>nul
goto sel_weapon_process
::--------------

::--------------
:colt
IF .%s2% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\7.flg GOTO setcolt
DEL %wmpath%\PRST\CURST\7.flg>nul
goto desel_weapon_process
:setcolt
IF %randw% == 2 SET s2=1
ECHO.>%wmpath%\PRST\CURST\7.flg
IF EXIST %wmpath%\PRST\CURST\4.flg DEL %wmpath%\PRST\CURST\4.flg>nul
IF EXIST %wmpath%\PRST\CURST\5.flg DEL %wmpath%\PRST\CURST\5.flg>nul
IF EXIST %wmpath%\PRST\CURST\6.flg DEL %wmpath%\PRST\CURST\6.flg>nul
goto sel_weapon_process
::--------------

::--------------
:heart
IF .%s10% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\8.flg GOTO setheart
DEL %wmpath%\PRST\CURST\8.flg>nul
goto desel_weapon_process
:setheart
IF %randw% == 2 SET s10=1
ECHO.>%wmpath%\PRST\CURST\8.flg
IF EXIST %wmpath%\PRST\CURST\9.flg DEL %wmpath%\PRST\CURST\9.flg>nul
goto sel_weapon_process
::--------------

::--------------
:rat
IF .%1 == .meltdown goto sp_only_weapon
IF .%s10% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\9.flg GOTO setrat
DEL %wmpath%\PRST\CURST\9.flg>nul
goto desel_weapon_process
:setrat
IF %randw% == 2 SET s10=1
ECHO.>%wmpath%\PRST\CURST\9.flg
IF EXIST %wmpath%\PRST\CURST\8.flg DEL %wmpath%\PRST\CURST\8.flg>nul
goto sel_weapon_process
::--------------

::--------------
:pump
IF .%s3% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\10.flg GOTO setpump
DEL %wmpath%\PRST\CURST\10.flg>nul
goto desel_weapon_process
:setpump
IF %randw% == 2 SET s3=1
ECHO.>%wmpath%\PRST\CURST\10.flg
IF EXIST %wmpath%\PRST\CURST\11.flg DEL %wmpath%\PRST\CURST\11.flg>nul
IF EXIST %wmpath%\PRST\CURST\12.flg DEL %wmpath%\PRST\CURST\12.flg>nul
IF EXIST %wmpath%\PRST\CURST\13.flg DEL %wmpath%\PRST\CURST\13.flg>nul
IF EXIST %wmpath%\PRST\CURST\14.flg DEL %wmpath%\PRST\CURST\14.flg>nul
IF EXIST %wmpath%\PRST\CURST\15.flg DEL %wmpath%\PRST\CURST\15.flg>nul
goto sel_weapon_process
::--------------

::--------------
:briot
IF .%s3% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\11.flg GOTO setbriot
DEL %wmpath%\PRST\CURST\11.flg>nul
goto desel_weapon_process
:setbriot
IF %randw% == 2 SET s3=1
ECHO.>%wmpath%\PRST\CURST\11.flg
IF EXIST %wmpath%\PRST\CURST\10.flg DEL %wmpath%\PRST\CURST\10.flg>nul
IF EXIST %wmpath%\PRST\CURST\12.flg DEL %wmpath%\PRST\CURST\12.flg>nul
IF EXIST %wmpath%\PRST\CURST\13.flg DEL %wmpath%\PRST\CURST\13.flg>nul
IF EXIST %wmpath%\PRST\CURST\14.flg DEL %wmpath%\PRST\CURST\14.flg>nul
IF EXIST %wmpath%\PRST\CURST\15.flg DEL %wmpath%\PRST\CURST\15.flg>nul
goto sel_weapon_process
::--------------

::--------------
:lupr
IF .%s3% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\12.flg GOTO setlupr
DEL %wmpath%\PRST\CURST\12.flg>nul
goto desel_weapon_process
:setlupr
IF %randw% == 2 SET s3=1
ECHO.>%wmpath%\PRST\CURST\12.flg
IF EXIST %wmpath%\PRST\CURST\10.flg DEL %wmpath%\PRST\CURST\10.flg>nul
IF EXIST %wmpath%\PRST\CURST\11.flg DEL %wmpath%\PRST\CURST\11.flg>nul
IF EXIST %wmpath%\PRST\CURST\13.flg DEL %wmpath%\PRST\CURST\13.flg>nul
IF EXIST %wmpath%\PRST\CURST\14.flg DEL %wmpath%\PRST\CURST\14.flg>nul
IF EXIST %wmpath%\PRST\CURST\15.flg DEL %wmpath%\PRST\CURST\15.flg>nul
goto sel_weapon_process
::--------------

::--------------
:shot
IF .%s3% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\13.flg GOTO setshot
DEL %wmpath%\PRST\CURST\13.flg>nul
goto desel_weapon_process
:setshot
IF %randw% == 2 SET s3=1
ECHO.>%wmpath%\PRST\CURST\13.flg
IF EXIST %wmpath%\PRST\CURST\10.flg DEL %wmpath%\PRST\CURST\10.flg>nul
IF EXIST %wmpath%\PRST\CURST\11.flg DEL %wmpath%\PRST\CURST\11.flg>nul
IF EXIST %wmpath%\PRST\CURST\12.flg DEL %wmpath%\PRST\CURST\12.flg>nul
IF EXIST %wmpath%\PRST\CURST\14.flg DEL %wmpath%\PRST\CURST\14.flg>nul
IF EXIST %wmpath%\PRST\CURST\15.flg DEL %wmpath%\PRST\CURST\15.flg>nul
goto sel_weapon_process
::--------------

::--------------
:holyd
IF .%s3% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\14.flg GOTO setholyd
DEL %wmpath%\PRST\CURST\14.flg>nul
goto desel_weapon_process
:setholyd
IF %randw% == 2 SET s3=1
ECHO.>%wmpath%\PRST\CURST\14.flg
IF EXIST %wmpath%\PRST\CURST\10.flg DEL %wmpath%\PRST\CURST\10.flg>nul
IF EXIST %wmpath%\PRST\CURST\11.flg DEL %wmpath%\PRST\CURST\11.flg>nul
IF EXIST %wmpath%\PRST\CURST\12.flg DEL %wmpath%\PRST\CURST\12.flg>nul
IF EXIST %wmpath%\PRST\CURST\13.flg DEL %wmpath%\PRST\CURST\13.flg>nul
IF EXIST %wmpath%\PRST\CURST\15.flg DEL %wmpath%\PRST\CURST\15.flg>nul
goto sel_weapon_process
::--------------

::--------------
:riot
IF .%s3% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\15.flg GOTO setriot
DEL %wmpath%\PRST\CURST\15.flg>nul
goto desel_weapon_process
:setriot
IF %randw% == 2 SET s3=1
ECHO.>%wmpath%\PRST\CURST\15.flg
IF EXIST %wmpath%\PRST\CURST\10.flg DEL %wmpath%\PRST\CURST\10.flg>nul
IF EXIST %wmpath%\PRST\CURST\11.flg DEL %wmpath%\PRST\CURST\11.flg>nul
IF EXIST %wmpath%\PRST\CURST\12.flg DEL %wmpath%\PRST\CURST\12.flg>nul
IF EXIST %wmpath%\PRST\CURST\13.flg DEL %wmpath%\PRST\CURST\13.flg>nul
IF EXIST %wmpath%\PRST\CURST\14.flg DEL %wmpath%\PRST\CURST\14.flg>nul
goto sel_weapon_process
::--------------

::--------------
:napa
IF .%s5% == 1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\16.flg GOTO setnapa
IF %randw% == 2 goto weapon_codes
DEL %wmpath%\PRST\CURST\16.flg>nul
goto desel_weapon_process
:setnapa
IF %randw% == 2 SET s5=1
ECHO.>%wmpath%\PRST\CURST\16.flg
IF EXIST %wmpath%\PRST\CURST\17.flg DEL %wmpath%\PRST\CURST\17.flg>nul
goto sel_weapon_process
::--------------

::--------------
:dkgun
IF .%s5% == 1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\17.flg GOTO setdkgun
IF %randw% == 2 goto weapon_codes
DEL %wmpath%\PRST\CURST\17.flg>nul
goto desel_weapon_process
:setdkgun
IF %randw% == 2 SET s5=1
ECHO.>%wmpath%\PRST\CURST\17.flg
IF EXIST %wmpath%\PRST\CURST\16.flg DEL %wmpath%\PRST\CURST\16.flg>nul
goto sel_weapon_process
::--------------

::--------------
:aero
IF .%s7% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\18.flg GOTO setaero
DEL %wmpath%\PRST\CURST\18.flg>nul
goto desel_weapon_process
:setaero
IF %randw% == 2 SET s7=1
ECHO.>%wmpath%\PRST\CURST\18.flg
IF EXIST %wmpath%\PRST\CURST\19.flg DEL %wmpath%\PRST\CURST\19.flg>nul
goto sel_weapon_process
::--------------

::--------------
:flamer
IF .%s7% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\19.flg GOTO setflamer
DEL %wmpath%\PRST\CURST\19.flg>nul
goto desel_weapon_process
:setflamer
IF %randw% == 2 SET s7=1
ECHO.>%wmpath%\PRST\CURST\19.flg
IF EXIST %wmpath%\PRST\CURST\18.flg DEL %wmpath%\PRST\CURST\18.flg>nul
goto sel_weapon_process
::--------------

::--------------
:dyna
IF .%s6% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\20.flg GOTO setdyna
DEL %wmpath%\PRST\CURST\20.flg>nul
goto desel_weapon_process
:setdyna
IF %randw% == 2 SET s6=1
ECHO.>%wmpath%\PRST\CURST\20.flg
goto sel_weapon_process
::--------------

::--------------
:buna
IF .%s6% == .1 goto weapon_codes
IF NOT EXIST %wmpath%\PRST\CURST\21.flg GOTO setbuna
DEL %wmpath%\PRST\CURST\21.flg>nul
goto desel_weapon_process
:setbuna
IF %randw% == 2 SET s6=1
ECHO.>%wmpath%\PRST\CURST\21.flg
goto sel_weapon_process
::--------------

::--------------
:smg
IF NOT EXIST %wmpath%\PRST\CURST\22.flg GOTO setsmg
IF %randw% == 2 goto weapon_codes
DEL %wmpath%\PRST\CURST\22.flg>nul
goto desel_weapon_process
:setsmg
ECHO.>%wmpath%\PRST\CURST\22.flg
goto sel_weapon_process
::--------------

::--------------
:coil
IF NOT EXIST %wmpath%\PRST\CURST\23.flg GOTO setcoil
IF %randw% == 2 goto weapon_codes
DEL %wmpath%\PRST\CURST\23.flg>nul
goto desel_weapon_process
:setcoil
ECHO.>%wmpath%\PRST\CURST\23.flg
goto sel_weapon_process
::--------------

::--------------
:leech
IF NOT EXIST %wmpath%\PRST\CURST\24.flg GOTO setleech
IF %randw% == 2 goto weapon_codes
DEL %wmpath%\PRST\CURST\24.flg>nul
goto desel_weapon_process
:setleech
ECHO.>%wmpath%\PRST\CURST\24.flg
goto sel_weapon_process
::--------------

:sp_only_weapon
ECHO [0;31m
ECHO  THIS WEAPON IS NOT AVAILABLE IN THIS MODE!
ECHO  PRESS ANY KEY TO CONTINUE...
pause>nul
goto desel_weapon_process

:exit
IF %wminit% == 0 goto exit_clear_vars
IF %wmexit% == 2 goto requested_exit

:good_exit
CLS
%wmpath%\TOOL\SCRN D>nul
ECHO  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ 
ECHO  ³ Thanks for playing, visit our sites:  ³
ECHO  ³                                       ³
ECHO  ³ http://cruo.bloodgame.ru              ³
ECHO  ³ http://terrordrome-thegame.com        ³
ECHO  ³ http://baitd.bloodgame.ru/bme.htm     ³
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ECHO     Installer based on BME/ILMHB script
ECHO          Weapons Mod #4, apr 2019
goto exit_clear_vars

:requested_exit
CLS
%wmpath%\TOOL\SCRN D>nul
ECHO.
ECHO  WEAPON INSTALLATION IS COMPLETED AND
ECHO  AUTOMATIC EXIT WAS REQUESTED BY
ECHO  USER.
ECHO.
ECHO  IF FILES REPAIRING IS ENABLED, THEY
ECHO  WILL BE RESTORED ON NEXT WM RUN.
ECHO.
ECHO  PRESS ANY KEY TO QUIT...
pause>nul
goto exit_clear_vars


:exit_clear_vars
CALL %wmpath%\INTF\CLVR

:exit_final
ECHO ------------------------------------------->>%wmlog%
ECHO WM SESSION IS FINISHED CORRECTLY.>>%wmlog%
ECHO [0;37m
SET wdr=
SET restart=
SET wmpath=
SET wmexit=
SET wminit=
SET wmlog=