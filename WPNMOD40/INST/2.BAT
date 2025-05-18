TYPE %wmpath%\INST\EFORK.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\EFORKSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto eforkmplayer
TYPE %wmpath%\PTCH\EFORKSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto eforkend

:eforkmplayer
TYPE %wmpath%\PTCH\EFORKMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK

:eforkend
ECHO W>>%wmpath%\TEMP\LTRS.FLG