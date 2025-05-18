@ECHO OFF

IF .%1 == .norand goto play_movie_norand
%wmpath%\TOOL\RANDOM 1 5
CLS
IF ERRORLEVEL 5 goto movie4
IF ERRORLEVEL 4 goto movie3
IF ERRORLEVEL 3 goto movie2
IF ERRORLEVEL 2 goto movie1
IF ERRORLEVEL 1 goto movie0
goto play_movie_end

:movie4
SET movie=5
goto play_movie

:movie3
SET movie=4
goto play_movie

:movie2
SET movie=3
goto play_movie

:movie1
SET movie=2
goto play_movie

:movie0
SET movie=1
goto play_movie

:play_movie
IF NOT EXIST %wmpath%\MOVS\WPN%movie%.SMK goto play_movie_norand
IF EXIST %wmpath%\MOVS\LOGO.SMK %wmpath%\TOOL\SMACKPLY %wmpath%\MOVS\LOGO /U1 /O2
IF EXIST %wmpath%\MOVS\START.SMK %wmpath%\TOOL\SMACKPLY %wmpath%\MOVS\START /U1 /O2
%wmpath%\TOOL\SMACKPLY %wmpath%\MOVS\WPN%movie% /U1 /O2
IF EXIST %wmpath%\MOVS\END.SMK %wmpath%\TOOL\SMACKPLY %wmpath%\MOVS\END /U1 /O2
IF EXIST %wmpath%\MOVS\LOGO.SMK %wmpath%\TOOL\SMACKPLY %wmpath%\MOVS\LOGO /U1
goto play_movie_end

:play_movie_norand
IF NOT EXIST %wmpath%\MOVS\LOGO.SMK goto play_movie_end
%wmpath%\TOOL\SMACKPLY %wmpath%\MOVS\START %wmpath%\MOVS\LOGO %wmpath%\MOVS\END /U1

:play_movie_end
SET movie=