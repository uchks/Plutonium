@echo off
rem https://dss0.cc/alterwarez/download/pluto_t6_full_game.torrent - BO2
rem https://cdn.plutonium.pw/updater/plutonium.exe - Plutonium Launcher  
rem https://dss0.cc/alterwarez/download/t6_dlcs.torrent - DLCs
rem https://drive.google.com/uc?export=download&confirm=h3SW&id=1jUM6EzrC-O4FWLzcV41z8pk_utoh3KcP - AIO
rem Big thanks to AlterArchive @ https://dss0.cc/ for hosting the files!
set workdir=%cd%
if not "%1" == "max" start /MAX cmd /c %0 max & exit/b
title Unofficial Plutonium Legacy Installer by qdx

if not exist "%workdir%/installerData" goto errorNoDirectory

if not exist "%workdir%/installerData/temp" (
    mkdir "%workdir%/installerData/temp"
)

:admincheck
echo [40;31mChecking for Administrator Permissions...
    timeout 2 >nul
    net session >nul 2>&1
    if %errorLevel% == 0 (
	goto main
    ) else (
	cls
        echo Error: Please Run As Administrator.
	timeout 2 >nul
	exit /b 1
    )

:main
cls
echo                                               ..,,,,,'.                                             
echo                                              .:;'...';:,.                                           
echo                                            .,c'       .:;.                                          
echo                                           .,c.         .::.                                         
echo                                           'c'           .:;.                                        
echo                                          .c,             'c,                                        
echo                                         .;:.             .;:.                                       
echo                                         .c'               .c,                                       
echo                   ..',,;;,,,,,'....    .;:.               .;:.    ....',,,;,,,;,,..                 
echo                  .;:,'.......'',,,;;,'.'c,                 .c,.',,;;,,''........';:'                
echo                 .;c.              ...',cl:,...          ..';lc;,...              .;c.               
echo                 .;c.                   ;c'',;;,'.. ...,;;,'.::.                  .;:.               
echo                  ,l;.                 .:;.   .';cc::c:'..   'c'                 .,c'                
echo                  ':c:.                .c,  ..,;;,'..,;;,'.  .c,                .;:.                 
echo                  ';;cc,.              'c,.;;;'..      .',;;''c;               .:;.                  
echo                 .';,;,;:'.           .;l:,'.             ..,:lc.            .;:'.                   
echo                 .';,;. .;;'.      .';;cc.     ..........    .:l:;,.       .;:'.                     
echo                  ';;,.  ..;:'. ..,;,..;c.    .;c;,,,,,;:,.  .;:..,;;'. ..;;'.                       
echo                  ';,'.     .;:;:;'.  .;:.    .:l,.....'l:.  .;:.  ..;:;::'.                         
echo                 .';'.      .;:;::'.  .;c.    .:l;,,,,,,;'    ;:.  ..;:;;;'.                         
echo                 .,,.   ..;;'. ..,:;..;c.    .:l'           .;:..,;;.. ..;:,.                       
echo                  .,. ..;;.       .';;cc.    ..'.           .:l:;'.       .;:,.                     
echo                   ....;:.            .;lc;'.             ..,:lc.            .;:'.                   
echo                    .,:'.              'c,.,;;,..      .';;,''c;               .:;.                  
echo                   .::.                .c,  ..,;;;'.',;;,..  .c,                .;c'                 
echo                  .:;.                 .:;.   .';cc::c:'..   'c.                 .,c'                
echo                  ;c.                  .;c'',;;,'..  ..,;;;,':c.                  .;:.               
echo                 .;c.             ...',,cl:'..           ..';lc;,'...             .;c.               
echo                  .;:,'.......',,;;;,,'.'c,                 'c,.',,;;;,,''.......,;:.                
echo                   ..',,,,,,,,''...     .;:.               .;c.     ...'',,,,,,,,,..                 
echo                                         .c,               .c,                                       
echo                                         .;:.             .;:.                                       
echo                                          .c,             'c'                                        
echo                                           'c'           .:;.                                        
echo                                           .,c'         .::.                                         
echo                                            .,c,.      .:;.                                          
echo                                             .;:,...';:'.                                           
echo                                               ..,,,,,..                                                                                                                                              
echo.
echo [40;37mWelcome, %username%, to the Unofficial Plutonium Legacy Installer!
echo ##########################################
echo It should be noted this installer is entirely unofficial and
echo support will not be offered  by the Plutonium Forums, Discord, or Emosewaj.
echo Thank you! -qdx
echo.
echo 1. Install BO2 [40;31m(Piracy)
echo [40;37m2. Install the Plutonium Launcher
echo 3. Install the DLCs [40;31m(Piracy)
echo [40;37m4. Install all of the above [40;31m(Piracy)
echo [40;37m5. Exit
echo.
echo [40;37mThe files will be installed to where this file is! Make sure it's in the correct folder!
echo.
set /p main=Type the number corresponding to your selection: 
if %main% == 1 goto BO2
if %main% == 2 goto Plutonium
if %main% == 3 goto DLC
if %main% == 4 goto AIO
if %main% == 5 goto exit

:BO2
cls
echo Downloading BO2 (.torrent)...
installerData\wget\wget.exe --directory-prefix=installerData/temp https://dss0.cc/alterwarez/download/pluto_t6_full_game.torrent -q -nc
timeout 2 >nul
cls
echo Finished
echo This file is a torrent, you must use a torrent client to install it.
echo This process will be simplified in the near future.
timeout 2 >nul
goto main

:Plutonium
cls
echo Downloading Plutonium...
installerData\wget\wget.exe --directory-prefix=installerData/temp https://cdn.plutonium.pw/updater/plutonium.exe -q -nc
timeout 2 >nul
cls
echo Finished
echo Launcher located in "installerData\temp"
timeout 2 >nul
goto main

:DLC
cls
echo Downloading DLCs (.torrent)...
installerData\wget\wget.exe --directory-prefix=installerData/temp https://dss0.cc/alterwarez/download/t6_dlcs.torrent -q -nc
timeout 2 >nul
cls
echo Finished
echo This file is a torrent, you must use a torrent client to install it.
echo This process will be simplified in the near future.
timeout 2 >nul
goto main

:installAIO
cls
echo Downloading AIO...
echo This will take a very long time.
installerData\wget\wget.exe --directory-prefix=installerData/temp https://drive.google.com/uc?export=download&confirm=h3SW&id=1jUM6EzrC-O4FWLzcV41z8pk_utoh3KcP -q -nc
cls
echo Installing AIO...
installerData\7zip\7za.exe x -y .\installerData\temp\Call of Duty Black Ops II.zip
cls
echo Cleaning up...
del installerData\temp\Call of Duty Black Ops II.zip
del crash-helper.exe
timeout 2 >nul
goto main

:errorNoDirectory
echo.
echo Error: Couldn't find the folder "/installerData/" in current folder, make sure you extract both the folder and this file into your BO2 game folder!
echo.
echo Current working directory: %cd%
echo.
pause
exit