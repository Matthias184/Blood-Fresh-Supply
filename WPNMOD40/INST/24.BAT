cls
SET cls=1
TYPE %wmpath%\INST\LEECH.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\LEESND.RFS>>%wmpath%\TEMP\SNDRFF.RFS

IF .%1 == .meltdown goto yes
IF EXIST %wmpath%\OPTS\LCRK.SET goto always_yes
IF EXIST %wmpath%\OPTS\LCRN.SET goto end
ECHO.
ECHO  [0mDO YOU WANT INSTALL ALTERNATIVE FIRE FOR LIFE LEECH?
ECHO  THIS RARELY MIGHT RESULT TO VISUAL GLITCHES ON BIGGER MAPS,
ECHO  HOWEVER THIS CAN BE FIXED BY RESTARTING
ECHO  THE GAME.
ECHO.
ECHO  [1;33m[Y][0m YES     [1;33m[A][0m ALWAYS YES    [1;33m[N][0m NO     [1;33m[D][0m ALWAYS NO
ECHO.
%wmpath%\TOOL\CHOICE /C:yand /N ""

IF ERRORLEVEL 4 goto always_no
IF ERRORLEVEL 3 goto end
IF ERRORLEVEL 2 goto always_yes
IF ERRORLEVEL 1 goto yes

:yes
CLS
TYPE %wmpath%\PTCH\LEECH.CRK>>%wmpath%\TEMP\CRKEXE.CRK
GOTO end

:always_yes
CLS
TYPE %wmpath%\PTCH\LEECH.CRK>>%wmpath%\TEMP\CRKEXE.CRK
ECHO.>%wmpath%\OPTS\LCRK.SET
GOTO end

:always_no
CLS
ECHO.>%wmpath%\OPTS\LCRN.SET

:end
ECHO B>>%wmpath%\TEMP\LTRS.FLG