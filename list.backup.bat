@echo off
SET LIST_VERSION=false
echo.         ----------------------------
echo.           Available Backups List
echo.         ----------------------------
IF NOT "%1"=="" IF exist ".\%1" SET LIST_VERSION=true
IF "%LIST_VERSION%"=="true" (
  echo. Backup Version '%1' exists, can be restored using command : restore.backup %1
) ELSE (
  dir /ad /o-d "."   | findstr /v "bytes"| findstr /v "dump"| findstr /v "import"| findstr /v "export"| findstr /v "postman"| findstr /v "cnf"| findstr /v "kube"| findstr /v "java"| findstr /v "Directory"| findstr /v "Volume"| findstr /v "localstack" | findstr /v "\."
)

echo. 

echo.         ----------------------------
echo.           Current Version Deployed
echo.         ----------------------------
current.backup