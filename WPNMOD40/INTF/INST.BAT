@ECHO OFF
CLS
SET install=1
SET DOS4G=quiet
%wmpath%\TOOL\SCRN D>nul

ECHO.>>%wmlog%
ECHO.>>%wmlog%
ECHO.>>%wmlog%

TYPE %wmpath%\DATA\INST.ST1
%wmpath%\TOOL\CURSOR none>nul
IF NOT EXIST %wmpath%\PRST\CURST\*.FLG GOTO install_end

::--------------
:: Deleting old scripts if they exists.
IF EXIST %wmpath%\TEMP\RESRFF.RFS DEL %wmpath%\TEMP\RESRFF.RFS>nul
IF EXIST %wmpath%\TEMP\SNDRFF.RFS DEL %wmpath%\TEMP\SNDRFF.RFS>nul
IF EXIST %wmpath%\TEMP\CRKEXE.CRK DEL %wmpath%\TEMP\CRKEXE.CRK>nul
IF EXIST %wmpath%\TEMP\LTRS.FLG DEL %wmpath%\TEMP\LTRS.FLG>nul
::--------------

ECHO PREPARING TO INSTALL WEAPONS...>>%wmlog%
ECHO ------------------------------------------->>%wmlog%
ECHO CHECKING IF TILES023 DOES NOT EXIST...>>%wmlog%
IF NOT EXIST %TILES%\TILES023.ART goto t23_wm

SET srcz=0
SET dstz=0
%wmpath%\TOOL\STRINGS srcz=FILESIZE %TILES%\TILES023.ART
%wmpath%\TOOL\STRINGS dstz=FILESIZE %wmpath%\%WMART%
IF %srcz% == 0 goto t23_wm
IF %srcz% == %dstz% goto t23_skip
goto t23_user

:t23_wm
COPY %wmpath%\%WMART% %TILES%\TILES023.ART>nul
ECHO %WMART% WAS COPIED FROM WM DIRECTORY>>%wmlog%
goto generate_scripts

:t23_user
ECHO STORING USER TILES023.ART TEMPORARY...>>%wmlog%
COPY %TILES%\TILES023.ART %wmpath%\TEMP\TILES023.ART>>%wmlog%
DEL %TILES%\TILES023.ART>>%wmlog%
COPY %wmpath%\%WMART% %TILES%\TILES023.ART>>%wmlog%
goto generate_scripts

:t23_skip
ECHO EXISTING TILES023.ART WILL BE USED>>%wmlog%


:generate_scripts
SET tguns=25
SET cgun=1
::--------------
:: Adding info to script(s) of each selected weapon.
:loop
IF EXIST %wmpath%\PRST\CURST\%cgun%.FLG goto loop_check_bat
goto inc_cgun

:loop_check_bat
IF NOT EXIST %wmpath%\INST\%cgun%.BAT goto loop_no_bat_file
CALL %wmpath%\INST\%cgun%.BAT %1 %2 %3 %4 %5 %6 %7 %8 %9
IF NOT .%cls% == .1 goto inc_cgun 
SET cls=
TYPE %wmpath%\DATA\INST.ST1
%wmpath%\TOOL\CURSOR none>nul
goto inc_cgun

:loop_no_bat_file
ECHO NO BAT FILE FOUND FOR WEAPON #%cgun%!>>%wmlog%

:inc_cgun
%wmpath%\TOOL\STRINGS cgun=ADD %cgun%,1
IF NOT %cgun% == %tguns% goto loop
:endloop
::--------------

ECHO SELECTED WEAPON(S):>>%wmlog%
TYPE %wmpath%\TEMP\LTRS.FLG>>%wmlog%

::--------------
:: Check if built-in BMOUSE is enabled. If so - add info for patch.
IF %bmouse% == 1 TYPE %wmpath%\PTCH\BMSFIX.CRK>>%wmpath%\TEMP\CRKEXE.CRK
::--------------


::--------------
:: Check if going to play meltdown. Add necessary info to hacks.
IF .%1 == .meltdown goto meltdown_add_global_hacks
goto meltdown_no_add_global_hacks
:meltdown_add_global_hacks
IF EXIST %wmpath%\PTCH\NASW.CRK TYPE %wmpath%\PTCH\NASW.CRK>>%wmpath%\TEMP\CRKEXE.CRK
:meltdown_no_add_global_hacks
::--------------

::--------------
:: Preparing CRK and target EXE files to patch.
SET fname=%BLOOD_EXE%
SET cdir=0

IF NOT EXIST %wmpath%\TEMP\CRKEXE.CRK goto skip_crk_merge
%wmpath%\TOOL\STRINGS drv=FILEDRIVE %BLOOD_EXE%
%wmpath%\TOOL\STRINGS pth=FILEDIR %BLOOD_EXE%
IF %drv%%pth% == %wdr%\ goto crk_merge
ECHO %BLOOD_EXE% IS PLACED NOT IN ROOT, CHDIR WILL REQUIRED...>>%wmlog%
%wmpath%\TOOL\STRINGS fname=FILENAME %BLOOD_EXE%
%wmpath%\TOOL\STRINGS ext=FILEEXT %BLOOD_EXE%
SET fname=%fname%.%ext%
SET cdir=1

:crk_merge
ECHO WRITING HEADER TO CRKEXE.CRK FILE...>>%wmlog%
COPY %wmpath%\TEMP\CRKEXE.CRK %wmpath%\TEMP\TEMP.CRK>>%wmlog%
TYPE %wmpath%\DATA\HEAD.CRK>%wmpath%\TEMP\CRKEXE.CRK
ECHO %fname%>>%wmpath%\TEMP\CRKEXE.CRK
TYPE %wmpath%\TEMP\TEMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
DEL %wmpath%\TEMP\TEMP.CRK>>%wmlog%
:skip_crk_merge
ECHO ------------------------------------------->>%wmlog%
ECHO.>>%wmlog%
::--------------

CLS
TYPE %wmpath%\DATA\INST.ST2
%wmpath%\TOOL\CURSOR none>nul
IF NOT EXIST %wmpath%\TEMP\RESRFF.rfs goto install_snd
ECHO ------------------------------------------->>%wmlog%
IF %repair% == 0 goto install_res_skip_store
ECHO STORING %BLOOD_RFF% TEMPORARY...>>%wmlog%
COPY %BLOOD_RFF% %wmpath%\TEMP\%BLOOD_RFF%>>%wmlog%
:install_res_skip_store
IF %BLOOD_RFF% == %SOUNDS_RFF% goto install_both
ECHO INSTALLING WEAPON'S ANIMATIONS TO %BLOOD_RFF%...>>%wmlog%
TYPE %wmpath%\DATA\SMCN.SYM>>%wmpath%\TEMP\RESRFF.rfs
%wmpath%\TOOL\BARF %BLOOD_RFF% -a @%wmpath%\TEMP\RESRFF.rfs>>%wmlog%
goto install_snd

:install_both
CLS
TYPE %wmpath%\DATA\INST.S23
%wmpath%\TOOL\CURSOR none>nul
ECHO ------------------------------------------->>%wmlog%
ECHO INSTALLING WEAPON'S ANIMATIONS AND SOUNDS TO %BLOOD_RFF%...>>%wmlog%
TYPE %wmpath%\TEMP\SNDRFF.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\DATA\SMCN.SYM>>%wmpath%\TEMP\RESRFF.rfs
%wmpath%\TOOL\BARF %BLOOD_RFF% -a @%wmpath%\TEMP\RESRFF.rfs>>%wmlog%
goto install_crk

:install_snd
CLS
TYPE %wmpath%\DATA\INST.ST3
%wmpath%\TOOL\CURSOR none>nul
IF NOT EXIST %wmpath%\TEMP\SNDRFF.rfs goto install_crk
ECHO ------------------------------------------->>%wmlog%
IF %repair% == 0 goto install_snd_skip_store
ECHO STORING %SOUNDS_RFF% TEMPORARY...>>%wmlog%
COPY %SOUNDS_RFF% %wmpath%\TEMP\%SOUNDS_RFF%>>%wmlog%
:install_snd_skip_store
ECHO INSTALLING WEAPON'S SOUNDS TO %SOUNDS_RFF%...>>%wmlog%
TYPE %wmpath%\DATA\SMCN.SYM>>%wmpath%\TEMP\SNDRFF.rfs
%wmpath%\TOOL\BARF %SOUNDS_RFF% -a @%wmpath%\TEMP\SNDRFF.rfs>>%wmlog%

:install_crk
CLS
TYPE %wmpath%\DATA\INST.ST4
%wmpath%\TOOL\CURSOR none>nul
IF NOT EXIST %wmpath%\TEMP\CRKEXE.CRK goto install_end
ECHO ------------------------------------------->>%wmlog%
IF %repair% == 0 goto install_crk_skip_store
ECHO STORING %BLOOD_EXE% TEMPORARY...>>%wmlog%
COPY %BLOOD_EXE% %wmpath%\TEMP\%BLOOD_EXE%>>%wmlog%
:install_crk_skip_store
ECHO ACCEPTING HACKS TO %BLOOD_EXE%>>%wmlog%
IF %cdir% == 1 CD %drv%%pth%>nul
%wdr%\%wmpath%\TOOL\COMMAND /c %wdr%\%wmpath%\TOOL\MP %wdr%\%wmpath%\TEMP\CRKEXE.CRK /c /p>%wdr%\%wmpath%\TEMP\MP.STS
IF %cdir% == 1 CD \>nul
IF %cdir% == 1 CD %wdr%>nul
%wmpath%\TOOL\STRINGS status=READ %wmpath%\TEMP\MP.STS,7
%wmpath%\TOOL\STRINGS /P# status2=LEFT %status%# 7
%wmpath%\TOOL\STRINGS status2=LOWER %status2%
IF .%status2% == .!!error goto error_patch_display_error
goto install_end

:error_patch_display_error
CLS
ECHO [0mAn error occured while accepting patches to %BLOOD_EXE%!
ECHO ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ[0;31m
ECHO.
ECHO %status%
ECHO.
ECHO [0mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
ECHO You can view detailed report in %wmlog% file.
pause
SET install=0

:install_end
CLS
TYPE %wmpath%\DATA\INST.ST5
%wmpath%\TOOL\CURSOR none>nul
IF EXIST %wmpath%\TEMP\MP.STS TYPE %wmpath%\TEMP\MP.STS>>%wmlog%
ECHO ------------------------------------------->>%wmlog%
IF %install% == 1 ECHO WEAPONS INSTALLATION IS COMPLETED.>>%wmlog%
IF %install% == 0 ECHO ERROR WHILE INSTALLING WEAPONS.>>%wmlog%
ECHO ------------------------------------------->>%wmlog%
ECHO [0m
SET srcz=
SET dstz=
SET fname=
SET cdir=
SET tguns=
SET cgun=
SET status=
SET status2=
SET DOS4G=
