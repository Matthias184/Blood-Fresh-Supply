TYPE %wmpath%\INST\BOOK.RFS>>%wmpath%\TEMP\RESRFF.RFS
TYPE %wmpath%\INST\BOOKSND.RFS>>%wmpath%\TEMP\SNDRFF.RFS
IF .%1 == .meltdown goto book_inst_mp
TYPE %wmpath%\PTCH\BOOKSP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
TYPE %wmpath%\PTCH\SP3301.CRK>>%wmpath%\TEMP\CRKEXE.CRK
goto book_inst_end

:book_inst_mp
TYPE %wmpath%\PTCH\BOOKMP.CRK>>%wmpath%\TEMP\CRKEXE.CRK
TYPE %wmpath%\PTCH\MP3301.CRK>>%wmpath%\TEMP\CRKEXE.CRK


:book_inst_end
ECHO R>>%wmpath%\TEMP\LTRS.FLG