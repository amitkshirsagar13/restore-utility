@echo off
set "version=%1"
xcopy  .\import\xxxxxxxxx\%version% .\%version% /E/I/Y

set "textfile=.\import\xxxxxxxxx\%version%\local.sql"
set "search=xxxxxxxxx"
set "replace=%username%"
echo "%search% -> %replace%"
SET "outfile=.\%version%\local.sql"
sed s/%search%_/%replace%_/g %textfile% > %outfile%
echo.         ---------------------------------------------------------------------------------------------
echo.           Imported Backup at .\%version%
echo.           Restore can be used by restore.backup %version%
echo.         ---------------------------------------------------------------------------------------------