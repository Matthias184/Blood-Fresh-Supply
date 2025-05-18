@ECHO OFF
CLS

::--------------
IF NOT EXIST %wmpath%\OPTS\OPTS.DIR MKDIR %wmpath%\OPTS
ECHO.>%wmpath%\OPTS\OPTS.DIR

:init_tils
IF NOT EXIST %wmpath%\OPTS\TILS.SET goto create_set_tils
%wmpath%\TOOL\STRINGS TILES=READ %wmpath%\OPTS\TILS.SET,1
IF %TILES% == \ goto init_tils_set_root
goto init_tils_set_path

:init_tils_set_root
SET TILES=%wdr%
SET art_param= -art TILES
goto init_bexe

:init_tils_set_path
SET TILES=%TILES%
SET art_param= -art %TILES%\TILES
CALL %wmpath%\INTF\CTMP %TILES%

:init_bexe
IF NOT EXIST %wmpath%\OPTS\BEXE.SET goto create_set_bexe
%wmpath%\TOOL\STRINGS BLOOD_EXE=READ %wmpath%\OPTS\BEXE.SET,1
CALL %wmpath%\INTF\CTMP %BLOOD_EXE%

:init_bhmd
IF NOT EXIST %wmpath%\OPTS\BHMD.SET goto create_set_bhmd
%wmpath%\TOOL\STRINGS bhm=READ %wmpath%\OPTS\BHMD.SET,1
IF %bhm% == 1 SET WMART=SLEEVES.ART
IF %bhm% == 0 SET WMART=TILES023.ART


:init_bmos
IF NOT EXIST %wmpath%\OPTS\BMOS.SET goto create_set_bmos
%wmpath%\TOOL\STRINGS bmouse=READ %wmpath%\OPTS\BMOS.SET,1

:init_brff
IF NOT EXIST %wmpath%\OPTS\BRFF.SET goto create_set_brff
%wmpath%\TOOL\STRINGS BLOOD_RFF=READ %wmpath%\OPTS\BRFF.SET,1
SET rff_param= -rff %BLOOD_RFF%
CALL %wmpath%\INTF\CTMP %BLOOD_RFF%

:init_extf
IF NOT EXIST %wmpath%\OPTS\EXTF.SET goto create_set_extf
%wmpath%\TOOL\STRINGS bat_file=READ %wmpath%\OPTS\EXTF.SET,1

:init_prms
IF NOT EXIST %wmpath%\OPTS\PRMS.SET goto create_set_prms
%wmpath%\TOOL\STRINGS params=READ %wmpath%\OPTS\PRMS.SET,1

:init_rndw
IF NOT EXIST %wmpath%\OPTS\RNDW.SET goto create_set_rndw
%wmpath%\TOOL\STRINGS randw=READ %wmpath%\OPTS\RNDW.SET,1

:init_rdwc
IF NOT EXIST %wmpath%\OPTS\RDWC.SET goto create_set_rdwc
%wmpath%\TOOL\STRINGS randwc=READ %wmpath%\OPTS\RDWC.SET,1

:init_rpfl
IF NOT EXIST %wmpath%\OPTS\RPFL.SET goto create_set_rpfl
%wmpath%\TOOL\STRINGS repair=READ %wmpath%\OPTS\RPFL.SET,1

:init_smns
IF NOT EXIST %wmpath%\OPTS\SMNS.SET goto create_set_smns
%wmpath%\TOOL\STRINGS skip_main_screen=READ %wmpath%\OPTS\SMNS.SET,1

:init_spls
IF NOT EXIST %wmpath%\OPTS\SPLS.SET goto create_set_spls
%wmpath%\TOOL\STRINGS skip_play_screen=READ %wmpath%\OPTS\SPLS.SET,1

:init_eagm
IF NOT EXIST %wmpath%\OPTS\EAGM.SET goto create_set_eagm
%wmpath%\TOOL\STRINGS eag=READ %wmpath%\OPTS\EAGM.SET,1

:init_srff
IF NOT EXIST %wmpath%\OPTS\SRFF.SET goto create_set_srff
%wmpath%\TOOL\STRINGS SOUNDS_RFF=READ %wmpath%\OPTS\SRFF.SET,1
SET snd_param= -snd %SOUNDS_RFF%
CALL %wmpath%\INTF\CTMP %SOUNDS_RFF%

:init_dosbox_scaler
IF %dosbox% == 0 goto wmst_end
IF NOT EXIST %wmpath%\OPTS\SCLR.SET goto create_set_scaler
%wmpath%\TOOL\STRINGS scaler=READ %wmpath%\OPTS\SCLR.SET,1
::--------------

goto wmst_end

::--------------
:create_set_tils
ECHO \>%wmpath%\OPTS\TILS.SET
goto init_tils

:create_set_bexe
ECHO BLOOD.EXE>%wmpath%\OPTS\BEXE.SET
goto init_bexe

:create_set_bhmd
ECHO 0>%wmpath%\OPTS\BHMD.SET
goto init_bhmd

:create_set_bmos
ECHO 1>%wmpath%\OPTS\BMOS.SET
goto init_bmos

:create_set_brff
ECHO BLOOD.RFF>%wmpath%\OPTS\BRFF.SET
goto init_brff

:create_set_extf
ECHO SETUP.EXE>%wmpath%\OPTS\EXTF.SET
goto init_extf

:create_set_prms
ECHO -ini BLOOD.INI>%wmpath%\OPTS\PRMS.SET
goto init_prms

:create_set_rndw
ECHO 0>%wmpath%\OPTS\RNDW.SET
goto init_rndw

:create_set_rdwc
ECHO 6>%wmpath%\OPTS\RDWC.SET
goto init_rdwc

:create_set_rpfl
ECHO 1>%wmpath%\OPTS\RPFL.SET
goto init_rpfl

:create_set_smns
ECHO 0>%wmpath%\OPTS\SMNS.SET
goto init_smns

:create_set_spls
ECHO 0>%wmpath%\OPTS\SPLS.SET
goto init_spls

:create_set_eagm
ECHO 0>%wmpath%\OPTS\EAGM.SET
goto init_eagm

:create_set_srff
ECHO SOUNDS.RFF>%wmpath%\OPTS\SRFF.SET
goto init_srff

:create_set_scaler
Z:\CONFIG -get "render scaler">%wmpath%\TEMP\SCLR.TMP
Z:\CONFIG -set "render scaler=advmame2x forced"
CLS
ECHO.
:set_scaler_choice
%wmpath%\TOOL\CHOICE /C:yn /N " [0mKEEP THIS SCREEN RESOLUTION [1;37m[Y/N]?[0m"
CLS
IF ERRORLEVEL 2 goto set_scaler_use_client
IF ERRORLEVEL 1 goto set_scaler_use_wm
goto set_scaler_choice
:set_scaler_use_client
ECHO 0>%wmpath%\OPTS\SCLR.SET
%wmpath%\TOOL\STRINGS scaler=READ %wmpath%\TEMP\SCLR.TMP,1
Z:\CONFIG -set "render scaler=%scaler%"
goto init_dosbox_scaler
:set_scaler_use_wm
ECHO 1>%wmpath%\OPTS\SCLR.SET
goto init_dosbox_scaler
::--------------

:wmst_end