@ECHO OFF
CLS

::--------------
:: Checks if Weapon Mod ran again (for example, from command prompt). 
:: If so - terminate 2-nd execution.
IF .%incmd% == .1 goto init_error_wm_launched
::--------------

::--------------
:: Checks if Weapon Mod ran in non-dosbox environment. 
IF .%dosbox% == .0 goto non_dosbox_env
::--------------

::--------------
:: Skip second initialization. 
IF .%wminit% == .1 goto init_skip
::--------------

::--------------
:: 1 - normal exit, 2 - requested exit, 3 - restart, 0 - default. 
SET wmexit=0
::--------------

::--------------
:: Starting loading wm...
CLS
TYPE %wmpath%\DATA\LOAD.MSG
::--------------

::--------------
:: Checks write accessibility. 
ECHO.>%wmlog%
ECHO WEAPONS MOD #4 LOG FILE>>%wmlog%
ECHO CONTACT INFO: baitd@yandex.ru (NoOne)>>%wmlog%
ECHO.>>%wmlog%
ECHO ------------------------------------------->>%wmlog%
IF NOT EXIST %wmlog% goto init_error_write_not_allowed
ECHO WRITE ACCESSIBILITY TEST......PASSED.>>%wmlog%
::--------------

::--------------
:: Checking required tools.
IF NOT EXIST %wmpath%\TOOL\STRINGS.COM goto init_error_no_core_tools
IF NOT EXIST %wmpath%\TOOL\XCOPY.EXE goto init_error_no_core_tools
IF NOT EXIST %wmpath%\TOOL\MOVE.EXE goto init_error_no_core_tools
IF NOT EXIST %wmpath%\TOOL\MP.EXE goto init_error_no_core_tools
IF NOT EXIST %wmpath%\TOOL\BARF.EXE goto init_error_no_core_tools
IF NOT EXIST %wmpath%\TOOL\CHOICE.EXE goto init_error_no_core_tools
ECHO REQUIRED TOOLS TEST......PASSED.>>%wmlog%
::--------------

::--------------
:: Checking environment space.
%wmpath%\TOOL\STRINGS envsize=ENVSIZE>nul
%wmpath%\TOOL\STRINGS envfree=ENVFREE>nul
%wmpath%\TOOL\STRINGS envlen=LENGTH %envfree%
IF .%envlen% == . goto init_error_no_env_space
IF %envlen% == 1 goto init_error_no_env_space
IF %envlen% == 2 goto init_error_no_env_space
ECHO ENVIRONMENT SIZE TEST......PASSED (SIZE: %envsize% / FREE: %envfree%).>>%wmlog%
::--------------

::--------------
:: Check if WM uses DosBox environment.
:: If no - skip it's configuration and assume that is DOS/W9.X.
SET dosbox=1
IF NOT EXIST Z:\COMMAND.COM SET dosbox=0
IF NOT EXIST Z:\CONFIG.COM SET dosbox=0
IF %dosbox% == 1     ECHO RUNNING IN DOSBOX ENVIRONMENT>>%wmlog%
IF NOT %dosbox% == 1 ECHO RUNNING IN DOS / W9.X ENVIRONMENT.>>%wmlog%
::--------------

::--------------
:: Parse working directory.
%wmpath%\TOOL\STRINGS fdir=FILEDIR %0
SET tok=0
SET wdr=
:loop
%wmpath%\TOOL\STRINGS zz=PARSE %fdir%,%tok%,\
if .%zz% == .%wmpath% goto loopend
%wmpath%\TOOL\STRINGS len=LENGTH %zz%
%wmpath%\TOOL\STRINGS tok=ADD %tok%,1
IF NOT %len% == 0 SET wdr=%wdr%\%zz%
goto loop
:loopend
%wmpath%\TOOL\STRINGS fdrv=FILEDRIVE %0
SET wdr=%fdrv%%wdr%
SET tok=
SET zz=
SET len=
SET fdir=
SET fdrv=
::--------------

::--------------
:: Configuring DOSBox (if DOSBox environment is in use).
IF %dosbox% == 0 goto non_dosbox_env_prepare
ECHO.>>%wmlog%
ECHO CONFIGURING DOSBOX...>>%wmlog%
Z:\CONFIG -set "sdl fullresolution=desktop">>%wmlog%
Z:\CONFIG -set "sdl priority=highest,normal">>%wmlog%
Z:\CONFIG -set "dosbox memsize=128">>%wmlog%
Z:\CONFIG -set "cpu core=dynamic">>%wmlog%
Z:\CONFIG -set "cpu cycles=max">>%wmlog%
Z:\CONFIG -set "sdl output=opengl">>%wmlog%
Z:\CONFIG -set "render autofit=false">>%wmlog%
Z:\CONFIG -set "render aspect=true">>%wmlog%
Z:\CONFIG -set "speaker pcspeaker=true">>%wmlog%
IF EXIST %wmpath%\OPTS\SCLR.SET %wmpath%\TOOL\STRINGS scaler=READ %wmpath%\OPTS\SCLR.SET,1
IF .%scaler% == .1 Z:\CONFIG -set "render scaler=advmame2x forced">>%wmlog%
KEYB us 437>>%wmlog%
ECHO END OF DOSBOX CONFIGURATION.>>%wmlog%
ECHO.>>%wmlog%
goto skip_dosbox_configuration

:non_dosbox_env_prepare
%wmpath%\TOOL\COMMAND /E:4096 /C WPNMOD40.BAT
goto init_forced_exit
exit

:non_dosbox_env
ECHO ENABLING ANSI SUPPORT...>>%wmlog%
%wmpath%\TOOL\ANSI>>%wmlog%

:skip_dosbox_configuration
CALL %wmpath%\INTF\PSPK
::--------------

::--------------
:: Check if TEMP directory exist in WM path.
IF EXIST %wmpath%\TEMP\TEMP.DIR goto skip_create_temp_dir
MKDIR %wmpath%\TEMP
ECHO.>%wmpath%\TEMP\TEMP.DIR
:skip_create_temp_dir
::--------------

::--------------
:: Initializing user settings.
ECHO READING WEAPONS MOD SETTINGS...>>%wmlog%
CALL %wmpath%\INTF\WMST
CLS
TYPE %wmpath%\DATA\LOAD.MSG
::--------------

::--------------
:: This code tries to repair core files if DosBox was just closed
:: instead of when user quitting using key buttons.
:repair
CLS
IF %repair% == 0 goto init_after_repair
ECHO CHECKING IF FILES REQUIRED TO BE REPAIRED...>>%wmlog%
IF EXIST %wmpath%\TEMP\TILES023.ART goto repair_t23
IF EXIST %wmpath%\TEMP\%BLOOD_EXE% goto repair_blood_exe
IF EXIST %wmpath%\TEMP\%BLOOD_RFF% goto repair_blood_rff
IF %BLOOD_RFF% == %SOUNDS_RFF% goto init_after_repair
IF EXIST %wmpath%\TEMP\%SOUNDS_RFF% goto repair_sounds_rff
ECHO REPAIRING CHECK IS FINISHED.>>%wmlog%
goto init_after_repair


:repair_t23
ECHO RESTORING TILES023.ART AFTER INCORRECT EXIT FROM WM...>>%wmlog%
IF EXIST %TILES%\TILES023.ART DEL %TILES%\TILES023.ART>>%wmlog%
COPY %wmpath%\TEMP\TILES023.ART %TILES%>>%wmlog%
DEL %wmpath%\TEMP\TILES023.ART>>%wmlog%
goto repair

:repair_blood_exe
ECHO RESTORING %BLOOD_EXE% AFTER INCORRECT EXIT FROM WM...>>%wmlog%
IF EXIST %BLOOD_EXE% DEL %BLOOD_EXE%>>%wmlog%
COPY %wmpath%\TEMP\%BLOOD_EXE% %BLOOD_EXE%>>%wmlog%
:del_temp_blood_exe
ECHO REMOVING %BLOOD_EXE% IN WM TEMP DIRECTORY...>>%wmlog%
DEL %wmpath%\TEMP\%BLOOD_EXE%>>%wmlog%
goto repair

:repair_blood_rff
ECHO RESTORING %BLOOD_RFF% AFTER INCORRECT EXIT FROM WM...>>%wmlog%
IF EXIST %BLOOD_RFF% DEL %BLOOD_RFF%>>%wmlog%
COPY %wmpath%\TEMP\%BLOOD_RFF% %BLOOD_RFF%>>%wmlog%
:del_temp_blood_rff
ECHO REMOVING %BLOOD_RFF% IN WM TEMP DIRECTORY...>>%wmlog%
DEL %wmpath%\TEMP\%BLOOD_RFF%>>%wmlog%
goto repair

:repair_sounds_rff
ECHO RESTORING %SOUNDS_RFF% AFTER INCORRECT EXIT FROM WM...>>%wmlog%
IF EXIST %SOUNDS_RFF% DEL %SOUNDS_RFF%>>%wmlog%
COPY %wmpath%\TEMP\%SOUNDS_RFF% %SOUNDS_RFF%>>%wmlog%
:del_temp_sounds_rff
DEL %wmpath%\TEMP\%SOUNDS_RFF%>>%wmlog%
goto repair
::--------------

:init_after_repair
::--------------
:: This one checks if Weapon Mod in Blood directory and if Blood is installed correctly.
IF NOT EXIST %BLOOD_EXE% goto init_error_no_blood_exe
IF NOT EXIST %BLOOD_RFF% goto init_error_no_blood_rffs
IF NOT EXIST %SOUNDS_RFF% goto init_error_no_blood_rffs
ECHO CORRECT INSTALLATION TEST......PASSED.>>%wmlog%
::--------------


::--------------
:: Copies blank ART if no ART files founded. Required to load weapon's sprites 
:: as now they placed in TILES023 to avoid "4095" QAVEDIT limit.
ECHO CHECKING TILES016-022 FOR EXISTING...>>%wmlog%
IF NOT EXIST %TILES%\TILES016.ART COPY %wmpath%\BLANK.ART %TILES%\TILES016.ART>>%wmlog%
IF NOT EXIST %TILES%\TILES017.ART COPY %wmpath%\BLANK.ART %TILES%\TILES017.ART>>%wmlog%
IF NOT EXIST %TILES%\TILES018.ART COPY %wmpath%\BLANK.ART %TILES%\TILES018.ART>>%wmlog%
IF NOT EXIST %TILES%\TILES019.ART COPY %wmpath%\BLANK.ART %TILES%\TILES019.ART>>%wmlog%
IF NOT EXIST %TILES%\TILES020.ART COPY %wmpath%\BLANK.ART %TILES%\TILES020.ART>>%wmlog%
IF NOT EXIST %TILES%\TILES021.ART COPY %wmpath%\BLANK.ART %TILES%\TILES021.ART>>%wmlog%
IF NOT EXIST %TILES%\TILES022.ART COPY %wmpath%\BLANK.ART %TILES%\TILES022.ART>>%wmlog%
::--------------

::--------------
:: Make changes in options and check core file sizes if going play meltdown.
:: If playing online, options will not available also.
IF .%1 == .meltdown goto init_meltdown_prepare
goto init_skip_meltdown_prepare
:init_meltdown_prepare
ECHO PREPARING BLOOD TO PLAY ONLINE WITH USING MELTDOWN CLIENT...>>%wmlog%
SET BLOOD_EXE=BLOOD.EXE
SET BLOOD_RFF=BLOOD.RFF
SET SOUNDS_RFF=SOUNDS.RFF
SET bmouse=0
SET skip_main_screen=0
SET skip_play_screen=7
SET randw=0

SET fsize=0
%wmpath%\TOOl\STRINGS fsize=FILESIZE %BLOOD_EXE%
ECHO %BLOOD_EXE% FILESIZE: %fsize%, REQUIRED: 1442615>>%wmlog%
IF NOT %fsize% == 1442615 goto init_meltdown_error_wrong_exe_filesize
ECHO %BLOOD_EXE% FILESIZE CHECK......PASSED>>%wmlog%

SET fsize=0
%wmpath%\TOOl\STRINGS fsize=FILESIZE %BLOOD_RFF%
ECHO %BLOOD_RFF% FILESIZE: %fsize%, REQUIRED: 9570681 OR 35620557>>%wmlog%
IF NOT %fsize% == 9570681 goto check_if_meltdown_blood_rff
goto check_rff_size_passed

:check_if_meltdown_blood_rff
IF NOT %fsize% == 35620557 goto init_meltdown_error_wrong_rff_filesize
goto check_rff_size_passed

:check_rff_size_passed
ECHO %BLOOD_RFF% FILESIZE CHECK......PASSED>>%wmlog%
SET fsize=
::--------------

:init_skip_meltdown_prepare
::--------------
:: Checking COMMIT device driver version. WM have 1.4 and 1.2, Blood uses 1.3
:: Required for online play.
:: Value 12 - COMMIT v1.2
:: Value 13 - COMMIT v1.3 (Use Blood's)
:: Value 14 - COMMIT v1.4
SET COMMIT=12
IF %COMMIT% == 13 goto check_if_comm13
SET COMMIT=COMM%commit%.EXE
SET srcz=0
SET destz=0
%wmpath%\TOOL\STRINGS srcz=FILESIZE COMMIT.EXE
%wmpath%\TOOL\STRINGS destz=FILESIZE %wmpath%\TOOL\%COMMIT%
IF NOT EXIST %wmpath%\TOOL\%COMMIT% goto check_if_comm13
IF NOT %srcz% == %destz% goto install_commit
goto skip_install_commit
:install_commit
IF EXIST COMMIT.EXE RENAME COMMIT.EXE COMM13.EXE>nul
COPY %wmpath%\TOOL\%COMMIT% COMMIT.EXE>nul
IF .%1 == .meltdown goto init_restart_req_after_commit
goto skip_install_commit
:check_if_comm13
IF EXIST COMM13.EXE goto del_commit_exe
GOTO skip_install_commit
:del_commit_exe
IF EXIST COMMIT.EXE DEL COMMIT.EXE>nul
RENAME COMM13.EXE COMMIT.EXE>nul
IF .%1 == .meltdown goto init_restart_req_after_restoring_commit
:skip_install_commit
%wmpath%\TOOL\STRINGS srcz=FILESIZE COMMIT.EXE
ECHO COMMIT DEVICE DRIVER VERSION: %COMMIT%.>>%wmlog%
ECHO COMMIT DEVICE DRIVER SIZE: %srcz% bytes.>>%wmlog%
SET srcz=
SET destz=
CLS
::--------------

goto init_end_good


:init_error_no_wm
CLS
ECHO.
ECHO  NO "%wmpath%" DIRECTORY FOUNDED.
ECHO  WEAPON MOD IS NOT INSTALLED PROPERLY.
ECHO  QUITTING NOW.
ECHO.
goto init_end_bad

:init_error_wm_launched
CLS
ECHO.
ECHO  [1;31mÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
ECHO  ³ WEAPON MOD IS ALREADY LAUNCHED.  ³
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ[0m
ECHO.
ECHO WEAPON MOD IS ALREADY LAUNCHED>>%wmlog%
goto init_end_bad

:init_error_nodosbox
CLS
ECHO.
ECHO  WEAPON MOD IS DESIGNED TO WORK UNDER DOS. PREFERABLE UNDER DOSBOX.
ECHO  CORRECT WORK ON OTHER EMULATORS AND/OR OPERATING SYSTEMS IS NOT GUARANTED.
ECHO  QUITTING NOW.
ECHO.
goto init_end_bad

:init_error_no_core_tools
CLS
ECHO.
ECHO  ONE OR MORE REQUIRED TOOLS NOT FOUNDED IN "%wmpath%\TOOL" DIRECTORY.
ECHO  MAKE SURE YOU INSTALL WEAPON MOD PROPERLY.
ECHO  QUITTING NOW.
ECHO.
goto init_end_bad

:init_error_no_env_space
CLS
ECHO.
ECHO  NOT ENOUGH SPACE FOR VARIABLES.
ECHO  RUN WEAPONS MOD UNDER CLEAN DOS(BOX) COMMAND PROMT
ECHO  OR TRY LAUNCH WMONLINE.EXE.
ECHO.
ECHO  PRESS ANY KEY TO QUIT...
pause>nul
exit
goto init_end_bad

:init_error_write_not_allowed
CLS
ECHO.
ECHO  WEAPONS MOD CANNOT WRITE FILES.
ECHO  MAKE SURE IF YOU HAVE PERMISSIONS.
ECHO.
goto init_end_bad

:init_error_no_blood_exe
CLS
ECHO.
ECHO  NO "%BLOOD_EXE%" FILE FOUND. 
ECHO  THIS FILE IS REQUIRED TO LAUNCH THE GAME!
ECHO  WEAPON MOD MUST BE PLACED IN BLOOD'S ROOT DIRECTORY.
ECHO.
goto init_end_bad

:init_error_no_blood_rffs
CLS
ECHO.
ECHO  NO "%BLOOD_RFF%" OR/AND "%SOUNDS_RFF%" FOUND. 
ECHO  THOSE FILES ARE REQUIRED TO PLAY BLOOD.
ECHO  INSTALL %BLOOD_RFF% AND/OR %SOUNDS_RFF% TO BLOOD'S DIRECTORY.
ECHO.
goto init_end_bad

:init_meltdown_error_wrong_exe_filesize
CLS
ECHO.
ECHO  WRONG SIZE OF %BLOOD_EXE%. 
ECHO  TO PLAY BLOOD ONLINE WITH WEAPONS MOD, ALL PLAYERS SHOULD
ECHO  HAVE EQUAL FILES AND WEAPONS INSTALLED.
ECHO.
ECHO  MAKE SURE YOU USING UNCHANGED %BLOOD_EXE%.
ECHO  IF DISK COMPRESSION IS ENABLED, TRY DISABLE IT
ECHO  FOR BLOOD DIRECTORY.
goto init_end_bad

:init_meltdown_error_wrong_rff_filesize
CLS
ECHO.
ECHO  WRONG SIZE OF %BLOOD_RFF%. 
ECHO  TO PLAY BLOOD ONLINE WITH WEAPONS MOD, ALL PLAYERS SHOULD
ECHO  HAVE EQUAL FILES AND WEAPONS INSTALLED.
ECHO.
ECHO  MAKE SURE YOU USING UNCHANGED %BLOOD_RFF%.
ECHO  IF DISK COMPRESSION IS ENABLED, TRY DISABLE IT
ECHO  FOR BLOOD DIRECTORY.
goto init_end_bad

:init_restart_req_after_commit
CLS
ECHO.
ECHO  PLEASE RESTART DOSBOX TO COMPLETE INSTALLATION OF 
ECHO  NEW COMMIT DEVICE DRIVER (COMMIT.EXE).
ECHO.
ECHO  OLD VERSION WAS RENAMED TO "COMM13.EXE".
ECHO  IF YOU EXPERIENCE ANY PROBLEMS WITH NEW VERSION,
ECHO  PLEASE REMOVE "%COMMIT%" FROM WPNMOD40\TOOL
ECHO  DIRECTORY.
ECHO.
ECHO  PRESS ANY KEY TO QUIT...
pause>nul
exit

:init_restart_req_after_restoring_commit
CLS
ECHO.
ECHO  PLEASE RESTART DOSBOX TO COMPLETE INSTALLATION OF 
ECHO  ORIGINAL COMMIT DEVICE DRIVER (COMMIT.EXE).
ECHO.
ECHO  PRESS ANY KEY TO QUIT...
pause>nul
SET csize=
exit

:init_error_crit
CLS
ECHO.
ECHO  AN CRITICAL ERROR OCCURED WHILE INITIALIZING WEAPONS MOD. 
ECHO  PROBABLY YOU TRYING RUN WM UNDER MODERN OS.
ECHO.
ECHO  IF YOU RUN WM WITH SHELL EXTENDERS LIKE NORTON COMMANDER
ECHO  PLEASE TRY START WMONLINE.EXE FILE INSTEAD OF BAT FILE.
ECHO.
ECHO  PRESS ANY KEY TO QUIT...
pause>nul
SET win=
SET dosbox=
exit

:init_end_good
SET wminit=1
ECHO INITIALIZATION IS COMPLETED WITH SUCCESS!>>%wmlog%
goto init_end

:init_end_bad
SET wminit=0
ECHO ERROR WHILE INITIALIZING WEAPONS MOD!>>%wmlog%
goto init_end

:init_end
%wmpath%\TOOL\STRINGS cntry=COUNTRY
%wmpath%\TOOL\STRINGS files=FILES
ECHO ------------------------------------------->>%wmlog%
%wmpath%\TOOL\STRINGS mem=MEMFREE>nul
ECHO MEMORY FREE: %mem%>>%wmlog%
ECHO COUNTRY CODE: %cntry%>>%wmlog%
ECHO FILES HANDLE: %files%>>%wmlog%
SET envsize=
SET envfree=
SET envlen=
SET mem=
SET win=
SET cntry=
SET files=
ECHO ENVIRONMENT DATA BELOW>>%wmlog%
ECHO ------------------------------------------->>%wmlog%
SET>>%wmlog%
ECHO ------------------------------------------->>%wmlog%
goto init_skip

:init_forced_exit
CALL %wmpath%\INTF\CLVR
ECHO FORCED EXIT>>%wmlog%
exit

:init_skip