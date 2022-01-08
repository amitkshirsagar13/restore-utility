@echo off
del .\export\xxxxxxxxx\%1 /Q
del .\import\xxxxxxxxx\%1 /Q
call create.backup %1
call export.backup %1
xcopy .\export\xxxxxxxxx\%1 .\import\xxxxxxxxx\%1 /E/I/Y
echo.         ---------------------------------------------------------------------------------------------
echo.           Updated Backup for %1 at .\export\%1
echo.           Share .\export\%1 folder with user
echo.         ---------------------------------------------------------------------------------------------