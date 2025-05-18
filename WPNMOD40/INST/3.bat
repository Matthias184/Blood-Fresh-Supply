TYPE %wmpath%\INST\AXE.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\AXESND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto axemplayer
TYPE %wmpath%\PTCH\AXESP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto axeend

:axemplayer
TYPE %wmpath%\PTCH\AXEMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK

:axeend
ECHO E>>%wmpath%\TEMP\LTRS.FLG