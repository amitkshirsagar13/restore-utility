@echo off
call env.bat
echo.         ------------------------------------
echo.           Backup MySQL Schema with %1 Data
echo.         ------------------------------------
SET DUMPCMD=mysqldump --defaults-file=".\login.cnf" --protocol=tcp --compress=TRUE --default-character-set=utf8 --host=127.0.0.1 --force=TRUE --port=3306 --single-transaction=TRUE --databases %SCHEMAS% 
IF "%1"=="int" (
  SET DUMPCMD=mysqldump --defaults-file=".\cnf\int.cnf" --protocol=tcp --compress=TRUE --default-character-set=utf8 --force=TRUE --single-transaction=TRUE --skip-triggers --databases %ADMINSCHEMAS%
)

IF "%1"=="stg" (
  SET DUMPCMD=mysqldump --defaults-file=".\cnf\stg.cnf" --protocol=tcp --compress=TRUE --default-character-set=utf8 --force=TRUE --single-transaction=TRUE --skip-triggers --databases %ADMINSCHEMAS%
)

IF "%1"=="e2e" (
  SET DUMPCMD=mysqldump --defaults-file=".\cnf\e2e.cnf" --protocol=tcp --compress=TRUE --default-character-set=utf8 --force=TRUE --single-transaction=TRUE --skip-triggers --databases %ADMINSCHEMAS%
)

IF "%1"=="prod" (
  SET DUMPCMD=mysqldump --defaults-file=".\cnf\prod.cnf" --protocol=tcp --compress=TRUE --default-character-set=utf8 --force=TRUE --single-transaction=TRUE --skip-triggers --databases %ADMINSCHEMAS%
)

IF NOT "%1"=="" (
  IF NOT exist ".\%1" ( 
    mkdir .\%1
  )
  mkdir .\%1
  echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  echo.       %DUMPCMD%
  echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  echo|set /p="          Time took for sql backup [milliseconds]: "
  powershell "Measure-Command {Get-Process;%DUMPCMD% | Out-File .\%1\local.sql -Encoding utf8} |Select -Exp TotalMilliseconds"
  echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
)
