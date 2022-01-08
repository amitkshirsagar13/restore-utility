@echo off
xcopy  .\test\recorded_api_calls.json .\%1\recorded_api_calls.json /E/I/Y
xcopy  .\test\dynamodb .\%1\dynamodb /E/I/Y
echo. 
echo.         -------------------------------------------------
echo.           Dumping logs from %1, may take 10-15min, please wait till process completes
echo.         -------------------------------------------------
echo. 
call mysql.backup %1
echo. 
set path=%path%;%~dp0
sed -i s/Administrator_/%username%_/g .\%1\local.sql
echo. 
list.backup
echo. 
echo.         -------------------------------------------------
echo.           Import %1 using restore.backup %1
echo.         -------------------------------------------------