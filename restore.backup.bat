@echo off
call localstack.stop.bat
echo.         ---------------------------
echo.           Restore LocalStack Data
echo.         ---------------------------
rmdir C:\Temp\LocalStack\*
echo Logged time = %time% %date% > .\localstack\import.log

SET VERSION=%1
IF "%VERSION%"=="dev" (
  SET VERSION=dev
)
IF NOT "%1"=="" (
  IF exist ".\%VERSION%\localstack" (
    echo.         -----------------------------------------
    echo.           Restored Backup Version - %VERSION% Restored
    echo.         -----------------------------------------
    xcopy .\%VERSION%\localstack C:\Temp\LocalStack\ /E/I/Y
  ) ELSE (
    echo.         ------------------------------------------
    echo.           Failed to find Backup Version - %VERSION% LocalStack
    echo.         ------------------------------------------
  )
) ELSE (
  xcopy .\localstack C:\Temp\LocalStack\ /E/I/Y
)
call env.bat
echo.         ----------------------------------
echo.           Restore MySQL Schema with Data
echo.         ----------------------------------
IF NOT "%1"=="" (
  IF exist ".\%VERSION%\local.sql" (
    echo.         - BackupVersion: %VERSION% > C:\Temp\LocalStack\version.txt
    goto LOCALSTACK
  ) ELSE (
    echo.         ------------------------------------------
    echo.           Failed to find Backup Version - %VERSION% sql
    echo.         ------------------------------------------
  )
) ELSE (
  echo.         - BackupVersion: default [Last CreatedBackup] > C:\Temp\LocalStack\version.txt
  goto LOCALSTACK
)
goto :EOF

:LOCALSTACK
call localstack.start
goto :RESTORESQL

:RESTORESQL
call restore.db %VERSION%
call aws.create
goto :done

:done