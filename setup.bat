@echo off

SET app[0]="./ITBytes-UI"
SET app[3]="./ITBytes-User"
SET app[1]="./ITBytes-OrderService"
SET app[2]="./ITBytes-InventoryManagementService"
SET app[4]="./ITBytes-AuditService"

ECHO ===============================================================
ECHO ITBytes System Setup
ECHO ===============================================================
ECHO This setup script is designed to setup the ITBytes System
ECHO It will automatically:
ECHO  - Locate all ITBytes application directories
ECHO  - Find package.json files in each directory
ECHO  - Install npm dependencies for each application
ECHO  - Start each service in development mode
ECHO NOTE: 
ECHO  - Ensure you have Node.js and npm installed on your system
ECHO  - If you do not have Node.js installed, please visit https://nodejs.org/ to download and install it.
ECHO  - This script requires internet access to download dependencies.
ECHO ===============================================================
ECHO.

ECHO Press Y to continue with the setup or N to exit...
CHOICE /C YN /M ""
IF ERRORLEVEL 2 (
    ECHO Setup cancelled by user.
    EXIT /B
)
ECHO Starting setup...
ECHO.


REM Loop through all defined apps
FOR /L %%i IN (0,1,4) DO (
    CALL :ProcessApp %%i
)
START "" "http://localhost:5173/"
PAUSE

:ProcessApp
    SETLOCAL
    CALL SET "currentApp=%%app[%1]%%"
    IF DEFINED currentApp (
        ECHO Setting up %currentApp%
        PUSHD %currentApp%
        CALL :FindRootAndRun
        IF ERRORLEVEL 1 (
            ECHO Failed to find package.json in %currentApp%
        ) ELSE (
            ECHO Successfully set up %currentApp%
        )
        POPD
    )
    ENDLOCAL
    GOTO :EOF



:FindRootAndRun
    REM Get current directory path
    SET "CURDIR=%CD%"
    
    REM Extract the last folder name in the path
    FOR %%I IN ("%CURDIR%") DO SET "FOLDER=%%~nxI"
    
    ECHO Found folder: %FOLDER%
    
    REM Check if package.json exists in current directory
    IF EXIST "package.json" (
        ECHO Found package.json, installing dependencies...
        START CMD /K "npm i && npm run dev"
        TIMEOUT /T 10 /NOBREAK
        EXIT /B 0
    )
    
    REM If not in current directory, check subdirectories
    FOR /D %%D IN (*) DO (
        IF NOT "%%D"=="node_modules" (
            IF EXIST "%%D\package.json" (
                ECHO Found package.json in subdirectory: %%D
                PUSHD "%%D"
                START CMD /K "npm i && npm run dev"
                TIMEOUT /T 10 /NOBREAK
                POPD
                EXIT /B 0
            )
        )
    )
    
    ECHO No package.json found in current directory or subdirectories
    EXIT /B 0