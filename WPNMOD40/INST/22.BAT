TYPE %wmpath%\INST\SMG.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\SMGSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto smgmplayer
goto smgsplayer

:smgsplayer
TYPE %wmpath%\PTCH\SMGSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto smgend

:smgmplayer
TYPE %wmpath%\PTCH\SMGMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto smgend

:smgend
ECHO C>>%wmpath%\TEMP\LTRS.FLG