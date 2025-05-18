cls
SET cls=1
TYPE %wmpath%\INST\SAWEDOFF.RFS>>%wmpath%\TEMP\RESRFF.RFS
IF EXIST %wmpath%\OPTS\ASND.SET goto always_yes
IF EXIST %wmpath%\OPTS\RSND.SET goto always_no
ECHO.
ECHO  [0mDO YOU WANT INSTALL ALPHA SHOT SOUNDS FOR ALPHA SAWED-OFF?
ECHO.
ECHO  [1;33m[Y][0m YES     [1;33m[A][0m ALWAYS YES    [1;33m[N][0m NO     [1;33m[D][0m ALWAYS NO
ECHO.
%wmpath%\TOOL\CHOICE /C:yand /N ""

IF ERRORLEVEL 4 goto always_no
IF ERRORLEVEL 3 goto no
IF ERRORLEVEL 2 goto always_yes
IF ERRORLEVEL 1 goto yes

:yes
CLS
TYPE %wmpath%\INST\SAWEDSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
GOTO end

:always_yes
CLS
TYPE %wmpath%\INST\SAWEDSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
ECHO.>%wmpath%\OPTS\ASND.SET
GOTO end

:no
CLS
TYPE %wmpath%\INST\SWDSNDR.RFS>>%wmpath%\TEMP\SNDRFF.RFS
GOTO end

:always_no
CLS
TYPE %wmpath%\INST\SWDSNDR.RFS>>%wmpath%\TEMP\SNDRFF.RFS
ECHO.>%wmpath%\OPTS\RSND.SET

:end
ECHO D>>%wmpath%\TEMP\LTRS.FLG