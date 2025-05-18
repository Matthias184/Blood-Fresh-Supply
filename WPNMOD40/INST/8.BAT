TYPE %wmpath%\INST\WHERT.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\WHTSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto wh_inst_end
TYPE %wmpath%\PTCH\WHSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto wh_inst_end

:wh_inst_mp
::TYPE %wmpath%\PTCH\WHMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK

:wh_inst_end
ECHO I>>%wmpath%\TEMP\LTRS.FLG