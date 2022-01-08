@echo off

echo.         ------------------------------
echo.           Updating Restore Scripts
echo.         ------------------------------
cd /D "."
if "%cd%" == "." (
  git.refresh
  import.backup empty
  import.backup test
  xcopy .\test .\dev /E/I/Y
  readme.version
) else (
  echo Missing correct directory "."!!!
)
