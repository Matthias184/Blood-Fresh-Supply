@ECHO OFF
CLS
SET info=INFO.TXT

:info_screen
CLS
%wmpath%\TOOL\SCRN S>nul
ECHO  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
IF %info% == INFO.TXT ECHO Íµ [31m°±²   [1;33mINFORMATION   [0;31m²±°[0;37m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
IF %info% == CREDITS.TXT ECHO Íµ [31m°±²     [1;33mCREDITS     [0;31m²±°[0;37m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
IF %info% == LEGEND.TXT ECHO Íµ [31m°±²   [1;33mDSCA LEGEND   [0;31m²±°[0;37m ÆÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÝ
ECHO  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
TYPE %wmpath%\%info%
ECHO  [0;37mÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
ECHO  [1;33m[1][0;37m INFORMATION   [1;33m[2][0;37m DSCA LEGEND   [1;33m[3][0;37m SHOW CREDITS   [1;33m[4][0;37m VIEW README   
%wmpath%\TOOL\CHOICE /C:q1234 /N " [1;33m[Q][0;37m RETURN BACK"
CLS
IF ERRORLEVEL 5 GOTO info_show_readme
IF ERRORLEVEL 4 GOTO info_show_credits
IF ERRORLEVEL 3 GOTO info_show_legend
IF ERRORLEVEL 2 GOTO info_show_basic
IF ERRORLEVEL 1 GOTO info_screen_end
goto info_screen

:info_show_credits
SET info=CREDITS.TXT
goto info_screen

:info_show_legend
SET info=LEGEND.TXT
goto info_screen

:info_show_basic
SET info=INFO.TXT
goto info_screen

:info_show_readme
%wmpath%\TOOL\SCRN D>nul
%wmpath%\TOOL\QSCROLL %wmpath%\README.TXT
goto info_screen

:info_screen_end
CLS
SET info=
ECHO END OF.
