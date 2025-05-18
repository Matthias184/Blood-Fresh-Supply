@ECHO OFF
REM ------------------------------------------------------------
REM NOIZE.BAT - by Neil Rubenking
REM
REM Enter a frequency as its command line parameter and it
REM starts a note of that frequency.  Enter NO parameter and it
REM shuts the speaker up.
REM ------------------------------------------------------------
IF '%1'=='' GOTO Stop
IF '%1'=='0' GOTO Stop
%wmpath%\TOOL\STRINGS inv=DIV 1193180,%1
%wmpath%\TOOL\STRINGS inv=CONVERT %inv%,16
%wmpath%\TOOL\STRINGS inv=RIGHT 0000%inv%,4
%wmpath%\TOOL\STRINGS Hi=LEFT %inv%,2
%wmpath%\TOOL\STRINGS Lo=RIGHT %inv%,2
%wmpath%\TOOL\STRINGS /b16 OUT 43,B6
%wmpath%\TOOL\STRINGS /b16 OUT 42,%lo%
%wmpath%\TOOL\STRINGS /b16 OUT 42,%hi%
%wmpath%\TOOL\STRINGS /b16 AL=IN 61
%wmpath%\TOOL\STRINGS /b16 AL=OR %AL%,3
%wmpath%\TOOL\STRINGS /b16 OUT 61,%AL%
GOTO End
:Stop
%wmpath%\TOOL\STRINGS /b16 AL=IN 61
%wmpath%\TOOL\STRINGS /b16 AL=AND %AL%,FC
%wmpath%\TOOL\STRINGS /b16 OUT 61,%AL%
:End
SET al=
SET inv=
SET hi=
SET lo=