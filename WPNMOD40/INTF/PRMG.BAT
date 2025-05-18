@ECHO OFF
CLS

::--------------
:: Change to 1 if you want skip typing slot name dialog.
SET nnm=0
IF .%1 == .1 SET nnm=1
::--------------

:reset_preset_slot_state
SET pss=0

:preset_manager_screen
CLS
%wmpath%\TOOL\SCRN D>nul
%wmpath%\TOOL\CURSOR none>nul
ECHO  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
IF %pss% == 0 ECHO Íµ [7;41m²±° [1;33mPRESETS MANAGER [7;41m°±²[0m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
IF %pss% == 1 ECHO Íµ [7;41m²±°   [1;33mLOAD PRESET   [7;41m°±²[0m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
IF %pss% == 2 ECHO Íµ [7;41m²±°   [1;33mSAVE PRESET   [7;41m°±²[0m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ECHO.
IF NOT %pss% == 0 goto pssl
ECHO  [1;33m[1][0m LOAD PRESET    
ECHO  [1;33m[2][0m SAVE PRESET
:pssl
SET sname=01
IF EXIST %wmpath%\PRST\SET001\PSNM.NME %wmpath%\TOOL\STRINGS sname=READ %wmpath%\PRST\SET001\PSNM.NME,1
IF %pss% == 1 ECHO  [1;33m[1] [0;32mLOAD FROM SLOT %sname%[0m
IF %pss% == 2 ECHO  [1;33m[1] [0;32mSAVE TO SLOT %sname%[0m

SET sname=02
IF EXIST %wmpath%\PRST\SET002\PSNM.NME %wmpath%\TOOL\STRINGS sname=READ %wmpath%\PRST\SET002\PSNM.NME,1
IF %pss% == 1 ECHO  [1;33m[2] [0;36mLOAD FROM SLOT %sname%[0m
IF %pss% == 2 ECHO  [1;33m[2] [0;36mSAVE TO SLOT %sname%[0m

SET sname=03
IF EXIST %wmpath%\PRST\SET003\PSNM.NME %wmpath%\TOOL\STRINGS sname=READ %wmpath%\PRST\SET003\PSNM.NME,1
IF %pss% == 1 ECHO  [1;33m[3] [0;34mLOAD FROM SLOT %sname%[0m
IF %pss% == 2 ECHO  [1;33m[3] [0;34mSAVE TO SLOT %sname%[0m

SET sname=04
IF EXIST %wmpath%\PRST\SET004\PSNM.NME %wmpath%\TOOL\STRINGS sname=READ %wmpath%\PRST\SET004\PSNM.NME,1
IF %pss% == 1 ECHO  [1;33m[4] [0;35mLOAD FROM SLOT %sname%[0m
IF %pss% == 2 ECHO  [1;33m[4] [0;35mSAVE TO SLOT %sname%[0m

SET sname=05
IF EXIST %wmpath%\PRST\SET005\PSNM.NME %wmpath%\TOOL\STRINGS sname=READ %wmpath%\PRST\SET005\PSNM.NME,1
IF %pss% == 1 ECHO  [1;33m[5] [0;33mLOAD FROM SLOT %sname%[0m
IF %pss% == 2 ECHO  [1;33m[5] [0;33mSAVE TO SLOT %sname%[0m
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
IF NOT %pss% == 0 goto skip_empty_space
ECHO.
ECHO.
ECHO.
:skip_empty_space
ECHO  ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ  
ECHO  [1;33m[Q][0m RETURN BACK    [1;33m[C][0m [1;31mCLEAR ALL PRESET SLOTS[0m
IF NOT %pss% == 0 goto psslc
%wmpath%\TOOL\CHOICE /C:12qc /N "[2;15H"
CLS
IF ERRORLEVEL 4 GOTO preset_clear_all
IF ERRORLEVEL 3 GOTO preset_manager_end
IF ERRORLEVEL 2 GOTO preset_save
IF ERRORLEVEL 1 GOTO preset_load
goto preset_manager_screen

:psslc
%wmpath%\TOOL\CHOICE /C:12345qc /N "[2;14H"
CLS
IF ERRORLEVEL 7 GOTO preset_clear_all
IF ERRORLEVEL 6 GOTO reset_preset_slot_state
IF ERRORLEVEL 5 GOTO preset_slot5_selected
IF ERRORLEVEL 4 GOTO preset_slot4_selected
IF ERRORLEVEL 3 GOTO preset_slot3_selected
IF ERRORLEVEL 2 GOTO preset_slot2_selected
IF ERRORLEVEL 1 GOTO preset_slot1_selected
goto preset_manager_screen


:preset_slot1_selected
IF %pss% == 1 goto preset_slot1_load
IF %pss% == 2 goto preset_slot1_save
goto preset_manager_screen

:preset_slot2_selected
IF %pss% == 1 goto preset_slot2_load
IF %pss% == 2 goto preset_slot2_save
goto preset_manager_screen

:preset_slot3_selected
IF %pss% == 1 goto preset_slot3_load
IF %pss% == 2 goto preset_slot3_save
goto preset_manager_screen

:preset_slot4_selected
IF %pss% == 1 goto preset_slot4_load
IF %pss% == 2 goto preset_slot4_save
goto preset_manager_screen

:preset_slot5_selected
IF %pss% == 1 goto preset_slot5_load
IF %pss% == 2 goto preset_slot5_save
goto preset_manager_screen

:preset_slot1_load
CLS
IF NOT EXIST %wmpath%\PRST\SET001\*.FLG goto preset_no_slot
del %wmpath%\PRST\CURST\*.FLG>nul
copy %wmpath%\PRST\SET001\*.FLG %wmpath%\PRST\CURST>nul
goto preset_manager_end

:preset_slot2_load
CLS
IF NOT EXIST %wmpath%\PRST\SET002\*.FLG goto preset_no_slot
del %wmpath%\PRST\CURST\*.FLG>nul
copy %wmpath%\PRST\SET002\*.FLG %wmpath%\PRST\CURST>nul
goto preset_manager_end

:preset_slot3_load
CLS
IF NOT EXIST %wmpath%\PRST\SET003\*.FLG goto preset_no_slot
del %wmpath%\PRST\CURST\*.FLG>nul
copy %wmpath%\PRST\SET003\*.FLG %wmpath%\PRST\CURST>nul
goto preset_manager_end

:preset_slot4_load
CLS
IF NOT EXIST %wmpath%\PRST\SET004\*.FLG goto preset_no_slot
del %wmpath%\PRST\CURST\*.FLG>nul
copy %wmpath%\PRST\SET004\*.FLG %wmpath%\PRST\CURST>nul
goto preset_manager_end

:preset_slot5_load
CLS
IF NOT EXIST %wmpath%\PRST\SET005\*.FLG goto preset_no_slot
del %wmpath%\PRST\CURST\*.FLG>nul
copy %wmpath%\PRST\SET005\*.FLG %wmpath%\PRST\CURST>nul
goto preset_manager_end

:preset_slot1_save
CLS
MKDIR %wmpath%\PRST\SET001>nul
del %wmpath%\PRST\SET001\*.FLG>nul
copy %wmpath%\PRST\CURST %wmpath%\PRST\SET001>nul
goto preset_slot1_name

:preset_slot2_save
CLS
MKDIR %wmpath%\PRST\SET002>nul
del %wmpath%\PRST\SET002\*.FLG>nul
copy %wmpath%\PRST\CURST %wmpath%\PRST\SET002>nul
goto preset_slot2_name

:preset_slot3_save
CLS
MKDIR %wmpath%\PRST\SET003>nul
del %wmpath%\PRST\SET003\*.FLG>nul
copy %wmpath%\PRST\CURST %wmpath%\PRST\SET003>nul
goto preset_slot3_name

:preset_slot4_save
CLS
MKDIR %wmpath%\PRST\SET004>nul
del %wmpath%\PRST\SET004\*.FLG>nul
copy %wmpath%\PRST\CURST %wmpath%\PRST\SET004>nul
goto preset_slot4_name

:preset_slot5_save
CLS
MKDIR %wmpath%\PRST\SET005>nul
del %wmpath%\PRST\SET005\*.FLG>nul
copy %wmpath%\PRST\CURST %wmpath%\PRST\SET005>nul
goto preset_slot5_name


:preset_slot1_name
CLS
IF %nnm% == 1 goto preset_slot_saved
%wmpath%\TOOL\CURSOR full>nul
ECHO [1;37mTYPE NAME FOR THE PRESET SLOT AND PRESS ENTER
%wmpath%\TOOL\STRINGS sname=ASK NAME:[1;33m
%wmpath%\TOOL\STRINGS length=LENGTH %sname%
IF NOT %length% == 0 ECHO %sname%>%wmpath%\PRST\SET001\PSNM.NME
IF %length% == 0 DEL %wmpath%\PRST\SET001\PSNM.NME>nul
goto preset_slot_saved

:preset_slot2_name
CLS
IF %nnm% == 1 goto preset_slot_saved
%wmpath%\TOOL\CURSOR full>nul
ECHO [1;37mTYPE NAME FOR THE PRESET SLOT AND PRESS ENTER
%wmpath%\TOOL\STRINGS sname=ASK NAME:[1;33m
%wmpath%\TOOL\STRINGS length=LENGTH %sname%
IF NOT %length% == 0 ECHO %sname%>%wmpath%\PRST\SET002\PSNM.NME
IF %length% == 0 DEL %wmpath%\PRST\SET002\PSNM.NME>nul
goto preset_slot_saved

:preset_slot3_name
CLS
IF %nnm% == 1 goto preset_slot_saved
%wmpath%\TOOL\CURSOR full>nul
ECHO [1;37mTYPE NAME FOR THE PRESET SLOT AND PRESS ENTER
%wmpath%\TOOL\STRINGS sname=ASK NAME:[1;33m
%wmpath%\TOOL\STRINGS length=LENGTH %sname%
IF NOT %length% == 0 ECHO %sname%>%wmpath%\PRST\SET003\PSNM.NME
IF %length% == 0 DEL %wmpath%\PRST\SET003\PSNM.NME>nul
goto preset_slot_saved

:preset_slot4_name
CLS
IF %nnm% == 1 goto preset_slot_saved
%wmpath%\TOOL\CURSOR full>nul
ECHO [1;37mTYPE NAME FOR THE PRESET SLOT AND PRESS ENTER
%wmpath%\TOOL\STRINGS sname=ASK NAME:[1;33m
%wmpath%\TOOL\STRINGS length=LENGTH %sname%
IF NOT %length% == 0 ECHO %sname%>%wmpath%\PRST\SET004\PSNM.NME
IF %length% == 0 DEL %wmpath%\PRST\SET004\PSNM.NME>nul
goto preset_slot_saved

:preset_slot5_name
CLS
IF %nnm% == 1 goto preset_slot_saved
%wmpath%\TOOL\CURSOR full>nul
ECHO [1;37mTYPE NAME FOR THE PRESET SLOT AND PRESS ENTER
%wmpath%\TOOL\STRINGS sname=ASK NAME:[1;33m
%wmpath%\TOOL\STRINGS length=LENGTH %sname%
IF NOT %length% == 0 ECHO %sname%>%wmpath%\PRST\SET005\PSNM.NME
IF %length% == 0 DEL %wmpath%\PRST\SET005\PSNM.NME>nul
goto preset_slot_saved

:preset_clear_all
IF EXIST %wmpath%\PRST\SET001\*.FLG  DEL %wmpath%\PRST\SET001\*.FLG>nul
IF EXIST %wmpath%\PRST\SET001\*.NME  DEL %wmpath%\PRST\SET001\*.NME>nul 
IF EXIST %wmpath%\PRST\SET002\*.FLG  DEL %wmpath%\PRST\SET002\*.FLG>nul
IF EXIST %wmpath%\PRST\SET002\*.NME  DEL %wmpath%\PRST\SET002\*.NME>nul
IF EXIST %wmpath%\PRST\SET003\*.FLG  DEL %wmpath%\PRST\SET003\*.FLG>nul
IF EXIST %wmpath%\PRST\SET003\*.NME  DEL %wmpath%\PRST\SET003\*.NME>nul
IF EXIST %wmpath%\PRST\SET004\*.FLG  DEL %wmpath%\PRST\SET004\*.FLG>nul
IF EXIST %wmpath%\PRST\SET004\*.NME  DEL %wmpath%\PRST\SET004\*.NME>nul
IF EXIST %wmpath%\PRST\SET005\*.FLG  DEL %wmpath%\PRST\SET005\*.FLG>nul
IF EXIST %wmpath%\PRST\SET005\*.NME  DEL %wmpath%\PRST\SET005\*.NME>nul
IF EXIST %wmpath%\PRST\SET001  RMDIR %wmpath%\PRST\SET001>nul
IF EXIST %wmpath%\PRST\SET002  RMDIR %wmpath%\PRST\SET002>nul
IF EXIST %wmpath%\PRST\SET003  RMDIR %wmpath%\PRST\SET003>nul
IF EXIST %wmpath%\PRST\SET004  RMDIR %wmpath%\PRST\SET004>nul
IF EXIST %wmpath%\PRST\SET005  RMDIR %wmpath%\PRST\SET005>nul
goto preset_slots_cleared

:preset_slot_saved
CLS
SET sname=
SET length=
ECHO.
ECHO  [1;32mWEAPON SELECTION WAS SUCCESFULLY SAVED TO SELECTED SLOT.
ECHO  PRESS ANY KEY TO CONTINUE...[0m
pause>nul
goto preset_manager_end

:preset_no_slot
CLS
ECHO.
ECHO  [1;31mSELECTED PRESET SLOT IS EMPTY OR DOES NOT EXIST.
ECHO  PRESS ANY KEY TO RETURN...[0m
pause>nul
goto preset_manager_screen

:preset_slots_cleared
CLS
ECHO.
ECHO  [1;32mALL PRESET SLOTS IS CLEARED.
ECHO  PRESS ANY KEY TO CONTINUE...[0m
pause>nul
goto preset_manager_screen

:preset_load
SET pss=1
goto preset_manager_screen

:preset_save
SET pss=2
goto preset_manager_screen

:preset_manager_end
CLS
SET pss=
SET nnm=
SET sname=
SET length=