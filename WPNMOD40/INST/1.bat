TYPE %wmpath%\INST\HANDS.rfs>>%wmpath%\TEMP\RESRFF.rfs
TYPE %wmpath%\INST\HANDSND.rfs>>%wmpath%\TEMP\SNDRFF.rfs
IF .%1 == .meltdown goto clawmplayer
TYPE %wmpath%\PTCH\CLAWSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto clawend

:clawmplayer
TYPE %wmpath%\PTCH\CLAWMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK

:clawend
ECHO Q>>%wmpath%\TEMP\LTRS.FLG