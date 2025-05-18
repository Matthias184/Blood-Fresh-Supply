TYPE %wmpath%\INST\TNTSTK.RFS>>%wmpath%\TEMP\RESRFF.rfs
TYPE %wmpath%\PTCH\TNTSTK.CRK>>%wmpath%\TEMP\CRKEXE.CRK

IF     EXIST %wmpath%\PRST\CURST\19.FLG goto tnt_stk_end
IF NOT EXIST %wmpath%\PRST\CURST\18.FLG goto fix_zippo
goto tnt_stk_end

:fix_zippo
TYPE %wmpath%\INST\ZIAERO.RFS>>%wmpath%\TEMP\RESRFF.rfs

:tnt_stk_end
ECHO Z>>%wmpath%\TEMP\LTRS.FLG
