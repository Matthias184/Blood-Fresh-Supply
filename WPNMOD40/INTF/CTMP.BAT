@ECHO OFF
CLS
SET input=%1

:create_temp_dir
SET cpos=1
SET dir=%wmpath%\TEMP
%wmpath%\TOOL\STRINGS input=FILEDIR %input%
ECHO %drv%%input%>%wmpath%\TEMP\PTH.TMP
%wmpath%\TOOL\CHANGE %wmpath%\TEMP\PTH.TMP "%wdr%" "%o%"
CLS

%wmpath%\TOOL\STRINGS input=READ %wmpath%\TEMP\PTH.TMP,1
%wmpath%\TOOL\STRINGS len=LENGTH %input%
%wmpath%\TOOL\STRINGS len=SUB %len%,1
%wmpath%\TOOL\STRINGS input=RIGHT %input%,%len%
IF EXIST %wmpath%\TEMP\%input%\DIR.DIR goto create_temp_dir_end

:create_temp_dir_loop
%wmpath%\TOOL\STRINGS pz=PARSE %input%,%cpos%,\
%wmpath%\TOOL\STRINGS len=LENGTH %pz%
IF %len% == 0 goto create_temp_dir_end
SET dir=%dir%\%pz%
IF NOT EXIST %dir%\DIR.DIR goto dir_not_exist
goto dir_exist

:dir_not_exist
MD %dir%>nul
ECHO.>%dir%\DIR.DIR
:dir_exist
%wmpath%\TOOL\STRINGS cpos=ADD %cpos%,1
goto create_temp_dir_loop

:create_temp_dir_end
SET input=
SET pz=
SET len=
SET cpos=
SET dir=
SET drv=