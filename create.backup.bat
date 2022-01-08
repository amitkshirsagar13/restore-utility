@echo off
call env.bat
echo.         --------------------------
echo.           Backup LocalStack Data
echo.         --------------------------
xcopy  C:\Temp\LocalStack\recorded_api_calls.json .\localstack\recorded_api_calls.json /E/I/Y
xcopy  C:\Temp\LocalStack\dynamodb .\localstack\dynamodb /E/I/Y
IF NOT "%1"=="" (
  echo.         ---------------------------------------
  echo.           Backup Restore Version : %1 Created
  echo.         ---------------------------------------
  xcopy  C:\Temp\LocalStack\recorded_api_calls.json .\%1\localstack\recorded_api_calls.json /E/I/Y
  xcopy  C:\Temp\LocalStack\dynamodb .\%1\localstack\dynamodb /E/I/Y
  call aws.clean %1
)
call mysql.backup %1