TYPE %wmpath%\INST\PRXREM.RFS>>%wmpath%\TEMP\RESRFF.rfs
IF NOT EXIST %wmpath%\PRST\CURST\20.FLG goto tnt_bun_inst
goto check_others

:tnt_bun_inst
TYPE %wmpath%\INST\TNTBND.RFS>>%wmpath%\TEMP\RESRFF.rfs

:check_others
IF     EXIST %wmpath%\PRST\CURST\17.FLG goto tnt_bun_end
IF NOT EXIST %wmpath%\PRST\CURST\18.FLG goto fix_zippo
goto tnt_bun_end

:fix_zippo
TYPE %wmpath%\INST\ZIAERO.RFS>>%wmpath%\TEMP\RESRFF.rfs


:tnt_bun_end
ECHO X>>%wmpath%\TEMP\LTRS.FLG