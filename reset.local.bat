@echo off
set startTime=%Time%
call localstack.stop.bat
del C:\Temp\LocalStack\recorded_api_calls.json
rmdir C:\Temp\LocalStack\dynamodb /s /q
rmdir C:\Temp\LocalStack\kinesis /s /q
call localstack.start.bat
call schema.bat
echo.         ------------------------------
echo.           Drop Schemas for Cleanup
echo.         ------------------------------
for %%s in (%SCHEMAS%) do (
   echo.         %%s
   mysql --defaults-extra-file=.\login.cnf -e "drop schema %%s"
)
call aws.create.bat
set stopTime=%Time%


echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo.          Start Reset Time: %startTime%
echo.          Stop Reset Time: %stopTime%
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX