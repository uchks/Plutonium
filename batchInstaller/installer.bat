@echo off
rem https://dss0.cc/alterwarez/download/pluto_t6_full_game.torrent
rem https://plutonium.pw/r353.zip
rem https://dss0.cc/alterwarez/download/t6_dlcs.torrent
rem https://drive.google.com/uc?export=download&confirm=h3SW&id=1jUM6EzrC-O4FWLzcV41z8pk_utoh3KcP
rem Thank god for AlterWarez <3
set workdir=%cd%
set installBO2=No
set installPlutonium=No
set installDLC=No
set installAIO=Yes

if not exist "%workdir%/installerData" goto errorNoDirectory

:print
set "input="
cls
echo.
echo Welcome to the Plutonium Installer!
echo ###################################
echo Type the number in front of the setting to toggle it, type "go" to start installing:
echo.
echo 1. Install the BO2 Basegame: %installBO2%
echo 2. Install the Plutonium Client: %installPlutonium%
echo 3. Install the DLCs: %installDLC%
echo 4. Install all of the above: %installAIO%
echo.
echo The files will be installed to where this file is! Make sure it's in the correct folder!
echo.
set /p input="Enter 1, 2, 3, 4 or go: "

if "%input%"=="1" (
    if "%installBO2%"=="No" (
        set installBO2=Yes
    ) else (
        set installBO2=No
    )
    goto print
) else (
    if "%input%"=="2" (
        if "%installPlutonium%"=="No" (
            set installPlutonium=Yes
        ) else (
            set installPlutonium=No
        )
        goto print
    ) else (
        if "%input%"=="3" (
            if "%installDLC%"=="No" (
                set installDLC=Yes
            ) else (
                set installDLC=No
            )
            goto print
        ) else (
                if "%input%"=="4" (
            if "%installAIO%"=="Yes" (
                set installAIO=No
            ) else (
                set installAIO=Yes
            )
            goto print
        ) else (
            goto start
            )
        )
    )
)

:start
if "%installBO2%"=="No" if "%installPlutonium%"=="No" if "%installDLC%"=="No" if "%installAIO%"=="No" goto errorNoInstallsSelected

cls
cscript //Nologo "%workdir%/installerData/proceedWarning.vbs" "%workdir%"
if %ERRORLEVEL% == 2 exit
echo.
echo By continuing, you confirm that this installer is going to install the files into the correct folder.
echo.
pause

if not exist "%workdir%/installerData/temp" (
    mkdir "%workdir%/installerData/temp"
)

if "%installBO2%"=="Yes" (
    goto installBO2
)
:jump1
if "%installPlutonium%"=="Yes" (
    goto installPlutonium
)
:jump2
if "%installDLC%"=="Yes" (
    goto installDLC
)
:jump3
if "%installAIO%"=="Yes" (
    goto installAIO
)
:jump4
cls
echo.
echo All files installed!
echo.
echo Big thanks to AlterArchive for hosting the files!
echo.
pause
exit

:installBO2
cls
echo.
echo Downloading BO2...
echo.
installerData\wget\wget.exe --directory-prefix=installerData/temp https://dss0.cc/alterwarez/download/pluto_t6_full_game.torrent -q --show-progress
echo.
echo This file is a torrent, you must use a torrent client to install it.
echo This process will be simplified in the near future.
goto jump1

:installPlutonium
cls
echo.
echo Downloading Plutonium...
echo.
installerData\wget\wget.exe --directory-prefix=installerData/temp https://plutonium.pw/r353.zip -q --show-progress
echo.
echo Installing Plutonium...
installerData\7zip\7za.exe x -y .\installerData\temp\r353.zip
echo.
echo Cleaning up...
del installerData\temp\r353.zip
del crash-helper.exe
goto jump2

:installDLC
cls
echo.
echo Downloading DLCs...
echo.
installerData\wget\wget.exe --directory-prefix=installerData/temp https://dss0.cc/alterwarez/download/t6_dlcs.torrent -q --show-progress
echo.
echo This file is a torrent, you must use a torrent client to install it.
echo This process will be simplified in the near future.
goto jump3

:installAIO
cls
echo.
echo Downloading AIO...
echo.
installerData\wget\wget.ext --directory-prefix=installerData/temp https://drive.google.com/uc?export=download&confirm=h3SW&id=1jUM6EzrC-O4FWLzcV41z8pk_utoh3KcP -q --show-progress
echo.
echo Installing AIO...
installerData\7zip\7za.exe x -y .\installerData\temp\Call of Duty Black Ops II.zip
echo.
echo Cleaning up...
del installerData\temp\Call of Duty Black Ops II.zip
del crash-helper.exe
goto jump4

:errorNoInstallsSelected
echo.
echo Error: You didn't select anything to be installed! Please set at least one of the three options to Yes!
echo.
pause
goto print

:errorNoDirectory
echo.
echo Error: Couldn't find the folder "/installerData/" in current folder, make sure you extract both the folder and this file into your BO2 game folder!
echo.
echo Current working directory: %cd%
echo.
pause
exit
