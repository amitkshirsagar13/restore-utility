@echo off
set "version=%1"
set "replace=xxxxxxxxx"
IF NOT "%2"=="" (
  set "replace=%2"
)
xcopy  .\%version% .\export\%replace%\%version% /E/I/Y

set "textfile=.\%version%\local.sql"
set "search=%username%"
echo "%search% -> %replace%"
SET "outfile=.\export\%replace%\%version%\local.sql"
set path=%path%;%~dp0
sed s/%search%_/%replace%_/g %textfile% > %outfile%

echo.         ---------------------------------------------------------------------------------------------
echo.           Exported Backup for %replace% at .\export\%replace%
echo.           Share .\export\%replace% folder with user
echo.         ---------------------------------------------------------------------------------------------