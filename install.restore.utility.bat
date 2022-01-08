@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
      echo. Success: Administrative permissions confirmed.
      cd /D "%~dp0"
      echo.         ------------------------------
      echo.           Installing Restore Scripts
      echo.         ------------------------------
      if "%cd%" == "C:\opt\restore-utility" (
        echo        Already at right place!!!
      ) else (
        xcopy . C:\opt\restore-utility\ /E/I/Y
      )
      echo.           
      echo.           
      echo.           
      echo.         -----------------------------------------------
      echo.         -----------------------------------------------
      echo.           
      echo.         Add C:\opt\restore-utility to System.Path
      echo.           
      echo.         -----------------------------------------------
      echo.         -----------------------------------------------
      echo.           
      echo.           
      echo.     
      
      cd /D "C:\opt\restore-utility"      
      del null
      
      TIMEOUT /T 5

      rundll32 sysdm.cpl,EditEnvironmentVariables

    ) else (
      echo.           
      echo.           
      echo.         -----------------------------------------------
      echo.         -----------------------------------------------
      echo            Failure: Current permissions inadequate.
      echo            Execute Installation as Administrator.
      echo.         -----------------------------------------------
      echo.         -----------------------------------------------
      echo.           
      echo.           
      TIMEOUT /T 5
    )
    pause >null

