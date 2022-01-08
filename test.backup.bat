@echo off
call localstack.start.bat
echo.> C:\Temp\LocalStack\test.me
docker run --rm -it -v C:/Temp/LocalStack/:/data alpine ls -ltr /data/test.me
if not exist .\import mkdir .\import
if not exist .\export mkdir .\export
call env.bat
mysql --defaults-extra-file=.\login.cnf -e "show schemas;"
del C:\Temp\LocalStack\data\recorded_api_calls.json

pause