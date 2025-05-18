TYPE %wmpath%\INST\FLAMSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
if .%1 == .meltdown goto fl_inst_mp
goto fl_inst_sp

:fl_inst_sp
TYPE %wmpath%\PTCH\FLAMSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
TYPE %wmpath%\INST\FLAMSP.RFS>>%wmpath%\TEMP\RESRFF.RFS
goto fl_inst_end

:fl_inst_mp
TYPE %wmpath%\INST\FLAMMP.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\PTCH\FLAMMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto fl_inst_end

:fl_inst_end
ECHO L>>%wmpath%\TEMP\LTRS.FLG