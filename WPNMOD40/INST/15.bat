TYPE %wmpath%\INST\RIOTGUN.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\RIOTSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto ri_inst_mp
TYPE %wmpath%\PTCH\RIOSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto ri_inst_end

:ri_inst_mp
TYPE %wmpath%\PTCH\RIOMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK

:ri_inst_end
ECHO G>>%wmpath%\TEMP\LTRS.FLG