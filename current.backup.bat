@echo off
echo.         
echo.         -------------------------------- 
type C:\Temp\LocalStack\version.txt
echo.         -------------------------------- 
echo.         
echo.         -------------------------------- 
echo.           Current Backedup Schema List
echo.         -------------------------------- 
call schema.bat
for %%s in (%SCHEMAS%) do (
  echo.         - %%s
)
flyway.version