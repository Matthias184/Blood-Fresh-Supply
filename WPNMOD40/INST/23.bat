TYPE %wmpath%\INST\COIL.RFS>>%wmpath%\TEMP\RESRFF.RFS
IF .%1 == .meltdown goto coilmplayer
TYPE %wmpath%\PTCH\COILSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto coilend
:coilmplayer
TYPE %wmpath%\PTCH\COILMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK

:coilend
ECHO V>>%wmpath%\TEMP\LTRS.FLG