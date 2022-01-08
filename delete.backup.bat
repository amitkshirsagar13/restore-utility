@echo off
echo.         ----------------------------
echo.           Delete Backup LocalStack
echo.         ----------------------------
IF NOT "%1"=="" (
  echo.         -------------------------------
  echo.           Delete Restore Version : %1 
  echo.         -------------------------------
  del .\%1
) ELSE (
  echo. Missing Restore version name, no version selected for Delete
)
echo.         ------------------------------------
echo.           Delete Restore Version with Data
echo.         ------------------------------------