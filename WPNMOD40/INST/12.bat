TYPE %wmpath%\INST\LUPR.RFS>>%wmpath%\TEMP\RESRFF.RFS
::TYPE %wmpath%\INST\LUPSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
if .%1 == .meltdown goto lmplayer
TYPE %wmpath%\PTCH\LUPRSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto lend

:lmplayer
TYPE %wmpath%\PTCH\LUPRMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK


:lend
ECHO S>>%wmpath%\TEMP\LTRS.FLG