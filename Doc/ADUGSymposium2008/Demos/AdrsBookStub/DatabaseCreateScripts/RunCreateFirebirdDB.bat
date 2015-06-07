@echo off

set PathToISQL="C:\Program Files\Firebird\Firebird_2_0\bin\isql.exe"
set PathToUnitTests=..\UnitTests\_bin
set PathToBin=..\_bin

if exist Adrs.fdb erase Adrs.fdb
%PathToISQL% -i CreateFirebirdDB.sql

copy Adrs.fdb %PathToUnitTests%\Adrs.fdb
copy Adrs.fdb %PathToBin%\Adrs.fdb
erase Adrs.fdb

copy Adrs.XMLLight %PathToUnitTests%\Adrs.XMLLight
copy Adrs.XMLLight %PathToBin%\Adrs.XMLLight

pause
