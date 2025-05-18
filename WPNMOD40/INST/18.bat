TYPE %wmpath%\INST\AEROSOL.RFS>>%wmpath%\TEMP\RESRFF.RFS
IF NOT EXIST %wmpath%\PRST\CURST\20.FLG goto check_bun
IF NOT EXIST %wmpath%\PRST\CURST\21.FLG goto check_stk
goto zi_dyn_end

:check_bun
IF NOT EXIST %wmpath%\PRST\CURST\21.FLG TYPE %wmpath%\INST\ZIBUND.RFS>>%wmpath%\TEMP\RESRFF.rfs
goto zi_dyn_end

:check_stk
IF NOT EXIST %wmpath%\PRST\CURST\20.FLG TYPE %wmpath%\INST\ZISTIK.RFS>>%wmpath%\TEMP\RESRFF.rfs
goto zi_dyn_end

:zi_dyn_end
ECHO K>>%wmpath%\TEMP\LTRS.FLG