@echo off
echo.         ----------------
echo.           set-up MySQL
echo.         ----------------

SET MYSQL_HOME=C:\Program Files\MySQL\MySQL Server 5.7
echo. Check exists [%MYSQL_HOME%]
IF exist "%MYSQL_HOME%" ( 
echo. "%MYSQL_HOME%" exists 
SET "PATH=%PATH%;%MYSQL_HOME%\bin"
echo. MySql set on PATH successfully 
) ELSE ( 
  echo.           
  echo.           
  echo.           
  echo.         ------------------------------------
  echo.         ------------------------------------
  echo.           "Set MYSQL_HOME in env.bat file"
  echo.         ------------------------------------
  echo.         ------------------------------------
  echo.           
  echo.           
  echo.           
  TIMEOUT /T 15 
)

call schema.bat

IF NOT exist "C:\opt\restore-utility\localstack" ( mkdir localstack )