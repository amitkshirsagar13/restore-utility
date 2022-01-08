@echo off
call env.bat
for %%s in (%SCHEMAS%) do (
  echo.         - Dropping %%s
  mysql --defaults-extra-file=.\login.cnf -e "drop schema %%s"
)
echo.
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 echo.         - Restoring mysql dump %1
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
echo|set /p="          Time took for sql restore [milliseconds]: "
powershell "Measure-Command {Get-Process;cmd /c 'mysql --defaults-extra-file=.\login.cnf < .\%1\local.sql'} |Select -Exp TotalMilliseconds"
echo.XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 call data.condition %1
