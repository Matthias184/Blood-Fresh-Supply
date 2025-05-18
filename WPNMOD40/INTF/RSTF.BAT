IF %repair% == 0 goto restore_files_end
IF NOT EXIST %wmpath%\PRST\CURST\*.FLG GOTO restore_files_end

ECHO ------------------------------------------->>%wmlog%
ECHO COPYING FILES BACK AFTER SESSION...>>%wmlog%

IF NOT EXIST %wmpath%\TEMP\TILES023.ART goto t23_skip_restore
%wmpath%\TOOL\MOVE /y %wmpath%\TEMP\TILES023.ART %TILES%\TILES023.ART>>%wmlog%

:t23_skip_restore

IF NOT EXIST %wmpath%\TEMP\%BLOOD_EXE% GOTO exe_skip_restore
DEL %BLOOD_EXE%>>%wmlog%
%wmpath%\TOOL\MOVE /y %wmpath%\TEMP\%BLOOD_EXE% %BLOOD_EXE%>>%wmlog%

:exe_skip_restore
IF NOT EXIST %wmpath%\TEMP\%BLOOD_RFF% GOTO res_skip_restore
DEL %BLOOD_RFF%>>%wmlog%
%wmpath%\TOOL\MOVE /y %wmpath%\TEMP\%BLOOD_RFF% %BLOOD_RFF%>>%wmlog%

:res_skip_restore
IF %BLOOD_RFF% == %SOUNDS_RFF% goto restore_files_end
IF NOT EXIST %wmpath%\TEMP\%SOUNDS_RFF% GOTO restore_files_end
DEL %SOUNDS_RFF%>>%wmlog%
%wmpath%\TOOL\MOVE /y %wmpath%\TEMP\%SOUNDS_RFF% %SOUNDS_RFF%>>%wmlog%
:restore_files_end