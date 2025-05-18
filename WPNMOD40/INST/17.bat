TYPE %wmpath%\INST\DKGUN.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\DKGUNSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto dkmplayer

:dksplayer
TYPE %wmpath%\PTCH\DKGSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
IF NOT EXIST %wmpath%\PRST\CURST\4.FLG TYPE %wmpath%\PTCH\SP3301.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto dkend

:dkmplayer
TYPE %wmpath%\PTCH\DKGMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
IF NOT EXIST %wmpath%\PRST\CURST\4.FLG TYPE %wmpath%\PTCH\MP3301.CRK>>%wmpath%\TEMP\CRKEXE.CRK
IF NOT EXIST %wmpath%\PRST\CURST\4.FLG TYPE %wmpath%\PTCH\MP3301.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto dkend

:dkend
ECHO J>>%wmpath%\TEMP\LTRS.FLG