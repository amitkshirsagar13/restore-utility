@echo off
echo.         
echo.         -------------------------------- 
echo.           Flyway Schema Update Version
echo.         -------------------------------- 
echo.         
sed s/xxxxxx/%username%/g .\flyway.version.sql > ".\flyway.sql"
mysql --defaults-file=".\login.cnf" -t < ".\flyway.sql"