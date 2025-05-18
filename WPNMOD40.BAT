@ECHO OFF
CLS

::--------------
:: Path to directory with weapons
SET wmpath=WPNMOD40
:: Currently must be set to "WPNMOD40" for Weapon Mod version 4.0. Do not change it.
::--------------

::--------------
:: Weapons Mod initialization status.
SET wminit=0
::--------------

CALL %wmpath%\INTF\MAIN %1 %2 %3 %4 %5 %6 %7 %8 %9