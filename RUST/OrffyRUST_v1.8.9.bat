@echo off
::To rename this script: First, rename this file. Then edit it in notepad++ / select the Title above and press CTRL+F / use replace tool, use the name you want and press the Replace All button.
Title _OrffyRUST_v1.8.9
::Comment the line below to skip the update process and directly start the server. But this will break some others fetures of the script recommanded to use it after game file was created. For script dev. usage only.
GOTO :JUMP_START-SERVER
:START-SERVER
::
:: !! WARNING !! This sign ^ need to be added at the end of each line but not at last line. And if you put it at end of a commented line it will break the code to execute.
:: !! Don't change server.identity or auto-backup will stop working !!
::
:: About Windows Security Alert; When server start for the first time it will ask you for "Windows Security Alert" and you will chose "Private networks" only.
:: Also your Windows networks setting must be set to Private networks.
:: You can also make your server ip static. This is optional but usefull in case of router replacement or long power outage. Otherwise DHCP can change the server ip.
:: For more info Google it!
::
::                                                  SERVER START AND PARAMETERS
:: Other possible parameters:
:: -swnet (under investigation) https://clients.hostez.io/plugin/support_manager/knowledgebase/view/21/how-rust-s-move-from-raknet-to-steam-query-port-will/
::About server.levelurl you can use it locally (single player use) with file:///  Ex: -server.levelurl "file:///C:/Rust_Maps/Voxi Island 1.0.2.map"
::Or for multiplayers use, you must provide a URL, you can put your map into dropbox or rustmaps.com that offer to upload 5 free custom map with a free account.
::
:: If you want train that spawn into your map, you need a minimum size of 4250
::
:: -server.levelurl "yourMapURL"
:: -server.headerimage "yourImageURL"
:: -server.url "yourDiscordURL"
:: -server.logoimage "https://i.imgur.com/nFDxFdH.png"
:: -server.gamemode hardcore
:: -wipeDayofWeek 4
:: -wipeHourofDay 8
:: -fps.limit 30
:: -server.saveinterval 600
:: -server.itemdespawn 300
:: -gc.interval 300
:: -decay.scale 0.5
:: -chicken.population 0
:: -server.maximummapmarkers 8
:: -sentry.interferenceradius 20
:: -sentry.maxinterference 20
:: -max_sleeping_bags 12
:: -bradley.respawndelayminutes 120
:: -hackablelockedcrate.requiredhackseconds 600
::
:: FOR CUSTOM MAP
::
:: -server.levelurl "https://www.dropbox.com/scl/fi/prtmc171z4fyaak3j09ud/Chernobyl.map?rlkey=mijn8r1dvxuf76g8pmf45ftc3&dl=1"
::  or
:: -server.levelurl "file:///C:/Rust_Maps/Voxi Island 1.0.2.map"   (ONLY FOR LOCAL TEST)
::
:: OR
::
:: FOR DEFAULT MAP
::
:: -server.level "Procedural Map"
:: -server.seed 2322396
:: -server.worldsize 3500
::  or
:: -server.level "Barren"
::                HapisIsland
::                SavasIsland
::                Craggy Island
::
echo %~dp0 && cd _rust
call RustDedicated.exe -batchmode -server.port 28015 -queryport 28016 -rcon.port 28017 -app.port 28018 ^
-server.hostname "RUSTERA.LT 2x Weekly" ^
-rcon.password "39301311199" ^
-server.seed 2322396 ^
-server.worldsize 3500 ^
-server.identity "backupSystem" ^
-server.maxplayers 120 ^
-server.secure 0
cls && cd..
GOTO :QUIT-SERVER
::
::FOR ADVANCE SERVER ADMINS. ONLY (This section is where admin. can link his plugins config. files to dropbox or other web file hosting methode)
::
::Exemple: The plugin RaidTracker have many configs. options and can be link to Discord under "Server Settings > Integration / WebHooks".
::So if you want to keep it into this script and be able to recreate all your server and all plugins configurations + user preferences, custom map link ect. with only this script;
::You will have to follow instructions below and setup your one dropbox with your personal server files.
::
::To begin a free dropbox account will be enought (max.2Go). It is more usefull to install dropbox app into your pc. And when they ask, chose keep my file local and online.
::So now you will see Dropbox folder icon on the left into your Windows File Explorer. There is where you will put your rust server config files.
::
::I recommend that you using the same folder architecture in dropbox that what it is into rust server.
::Exemple: dropboxFolder/_Rust/oxide/config/
::Exemple: dropboxFolder/_Rust/oxide/data/
::Exemple: dropboxFolder/_Rust/oxide/data/Kits/
::Exemple: dropboxFolder/_Rust/oxide/plugins/
::Exemple: dropboxFolder/_Rust/server/backupSystem/cfg/
::
::For oxide.config.json I made an exception and create 2 folders. Because this script contain both of this variant ready to be activate. Or you can use the default one.
::Exemple: dropboxFolder/_Rust/oxide/oxide.config.json_Community/oxide.config.json
::Exemple: dropboxFolder/_Rust/oxide/oxide.config.json_Modded/oxide.config.json
::
::This is for a special use in case you want to use this script to make a new server and have all your config files restored.
::In other case you only need to setup what is in the section above (START-SERVER).
::
::*Info. about what you will find in this script.
::
::	- _Rust/oxide/plugins/forSomePlugins.cs         (for the script that can not auto download because maby it require to login or you modified it or again because you buy it)
::	- _Rust/oxide/config/forSomeConfig.json         (for usage like you can read in the exemple above).
::	- _Rust/oxide/data/forPluginsData               (if you are using Kit plugin or MonumentAddons or maby GUIShop and HumanNPC ect.)
::	- _Rust/oxide/data/oxide.groups.data            (to restore oxide plugins group permissions)
::	- _Rust/oxide/data/oxide.users.data             (to restore oxide plugins users permissions)
::	- _Rust/oxide/oxide.config.json                 (main usage of this file is to make server appear into Community or Modded into server list)
::                                                  (also these is an option called plugin watcher that check the plugin folder to auto-load newly added plugin)
::	- _Rust/server/backupSystem/cfg/bans.cfg        (to restore players bans list)
::	- _Rust/server/backupSystem/cfg/users.cfg       (store ownerid "to become admin"), (ownerid or removeowner + steam id of the player) Ex: ownerid 12345678901234567 
::
::	- _Rust/server/backupSystem/cfg/serverauto.cfg  (store config that you add in server console or F1 console as admin), (work with writecfg after entering a config)
::		Exemple: antihack.flyhack_protection 0 (that is usefull when players get kicked for nothing or when using Vanish)
::		Exemple: hackablelockedcrate.requiredhackseconds 300 (when you want to change Timed Crate timer from 15 to 5)
::
::	- _Rust/oxide/data/copypaste/ (for advance use)	If you copy an ingame structure, it will be save in oxide\data\copypaste\ folder as long as the server not restart.
::		- If you want to use this copied structure permanently; copy it from oxide\data\copypaste\ to your dropbox before restarting the server.
::		- You must create in your dropbox a folder call copypaste and put your file inside. 
::		- Then you have to copy the dropbox link of this folder to the destination mentioned below.
::
::You must copy the file mentioned above into your dropbox and click right to a file / Copy dropbox link. And paste link in section below caled OXIDE PLUGINS.
::
::In section (OXIDE PLUGINS) you will comment   ::   or uncomment the  GOTO :JUMP_  line to allow or not the plugin/config to be download or not. Ex: ::GOTO :JUMP_PermissionsManager.cs
::If you are not familiar with the BATCH language you can just read the code and you will enderstand the logic of   ::GOTO :JUMP_   or   GOTO :JUMP_  (download Notepad++ because it color code and make it easyer to enderstand).
::A commented line will not execute and it begin by this sign  ::  That mean  ::GOTO :JUMP_  mean activated and  GOTO :JUMP_  not activated. Just finish to read this section and go down under OXIDE PLUGINS. You will see.
::
::*about dropbox after you copied the link if you create new folder into drop box and drag/drop the file into it, the link stay the same.
::And you paste the copied link at the corresponding location in the section below (OXIDE PLUGINS). Add more plugins, config, data, maps and server file if you wish.
::
::Exemple: powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/2hv0t8l8wlmhio2ex75kv/PermissionsManager.cs?rlkey=wkmojk7ahygbnd2kw1taqvrxt&dl=1" \"" -OutFile ".\PermissionsManager.cs"
::
::With the dropbox link copied you will have a 0 at the end of the link. Remove it and replace it by a 1
::*Because the link with the 0 at the end is for opening a dropbox page in browser and the 1 is to make it direct download.
::
::I know it can be a bit confusing, but it's easier to learn how to use it than to write it from scratch.
::
:JUMP_START-SERVER
::------------------------------------------------------------------------------------------------------------------------------------------------------------
::------------------------------------------------------------------------------------------------------------------------------------------------------------
GOTO :JUMP_autoRestart
cls
echo. && echo                                                   RUST SERVER                                                      && echo.
echo. && echo ------------------------------------------- CREATING autoRestart.bat---------------------------------------------- && echo.
timeout /t 5 > nul
::
::autoRestart.bat content >>>
::
set line0=Title autoRestart
set line1=@echo off
::line1.1
::line1.2
set line1.3=focusServerWindow.vbs
set line1.4=del focusServerWindow.vbs
set line2=:retryDelay
set line3=cls
set line4=CALL :checkForBatchIsRunning "_OrffyRUST_v1.8.9"
set line5=echo.
set line6=echo                 AUTO-RESTART for RUST SERVER
set line7=echo.
set line8=echo Checking for auto-restart Rust server, dont close this window.
set line9=echo If you want to shutdown the server close this window before sending QUIT command on the server.
set line10=IF "%%is_running%%" EQU "0" (_OrffyRUST_v1.8.9.bat EXIT /b) ELSE (GOTO :WAIT)
set line11=:WAIT
set line12=TIMEOUT /t 10
set line13=GOTO :retryDelay
set line14=:checkForBatchIsRunning
set line15=IF "%%~1?" EQU "?" GOTO :EOF
set line16=SET "_window_title=%%~1"
::  line17
set line18=SET "_window_title="
set line19=GOTO :EOF
echo %line0% > autoRestart.bat
echo %line1% >> autoRestart.bat
echo echo Dim ObjShell :Set ObjShell = CreateObject("Wscript.Shell") ^> focusServerWindow.vbs >> autoRestart.bat
echo echo ObjShell.AppActivate("_OrffyRUST_v1.8.9") ^>^> focusServerWindow.vbs >> autoRestart.bat
echo %line1.3% >> autoRestart.bat
echo %line1.4% >> autoRestart.bat
echo %line2% >> autoRestart.bat
echo %line3% >> autoRestart.bat
echo %line4% >> autoRestart.bat
echo %line5% >> autoRestart.bat
echo %line6% >> autoRestart.bat
echo %line7% >> autoRestart.bat
echo %line8% >> autoRestart.bat
echo %line9% >> autoRestart.bat
echo %line10% >> autoRestart.bat
echo %line11% >> autoRestart.bat
echo %line12% >> autoRestart.bat
echo %line13% >> autoRestart.bat
echo %line14% >> autoRestart.bat
echo %line15% >> autoRestart.bat
echo %line16% >> autoRestart.bat
echo TASKLIST /FI "Status eq Running" /FI "Windowtitle eq %%_window_title%%" /FO "TABLE" ^| FINDSTR /c:"PID" ^> NUL ^&^& ( SET "is_running=1" ) ^|^| ( SET "is_running=0" ) >> autoRestart.bat
echo %line18% >> autoRestart.bat
echo %line19% >> autoRestart.bat
::
::autoRestart.bat content <<<
::
START .\autoRestart.bat
cls
:JUMP_autoRestart
::
::############################################ Install SteamCMD ################################################
::GOTO :JUMP-steamcmd
::SteamCMD (To install steam dedicated server)
IF EXIST "steamcmd.exe" ( goto :SteamCMD-OK ) ELSE (
echo. && echo Downloading SteamCMD
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip', 'steamcmd.zip')"
powershell -Command "Expand-Archive steamcmd.zip -DestinationPath ./" )
:SteamCMD-OK
echo. && echo SteamCMD-OK
:JUMP-steamcmd
::
::#################################### Install RUST server using SteamCMD ######################################
::GOTO :JUMP-steam_isatall-update
::	NEED TO BE TESTED and if map change or not change did bp's stay?--- If the command below run after the forced wipe day, it will auto-wipe and override the players Blueprints.
echo. && echo Install RUST server using SteamCMD
::steamcmd +force_install_dir ./_RUST/ +login anonymous +app_update 258550 validate +quit
steamcmd +force_install_dir ./_RUST/ +login anonymous +app_update 258550 -beta staging +quit
::To use -beta Staging Branch: Uncomment the line above and comment the other line above (comment a line with :: also prevent the line to be excute).
::
::GAME CHANGE TIPS
::Staging branch is usefull 1 or 2 day before the forced wipe, you can to try random server.worldsize and server.seed to find a good map with all monuments and map shape you want, just to be ready for the next force wipe.
::Because Procedural map always change at force wipe. It help to start fast right after the force wipe, also help to get more population because otherwise you can get a bad map without good monuments.
::
:JUMP-steam_isatall-update
::
::######################################## Oxide.Ext.RustEdit.dll ##############################################
echo. && echo Updating Oxide.Ext.RustEdit.dll (For Custom Map Use)
cd _rust\RustDedicated_Data\Managed\ && IF EXIST "Oxide.Ext.RustEdit.dll" (del /Q Oxide.Ext.RustEdit.dll && goto :Oxide.Ext.RustEdit.dll-download) ELSE (goto :Oxide.Ext.RustEdit.dll-download)
:Oxide.Ext.RustEdit.dll-download
powershell -Command Invoke-WebRequest -Uri "https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll" -OutFile ".\Oxide.Ext.RustEdit.dll"
cd.. && cd.. && cd..
::
::### Carbon or Oxide, not both ############## INSTALL CARBON ##################################################
GOTO :JUMP-CARBON
echo. && echo Updating Carbon, the core to run all mods / plugins.
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Windows.Release.zip', 'Carbon.Windows.Release.zip')"
powershell -Command "Expand-Archive Carbon.Windows.Release.zip -DestinationPath .\Carbon.Windows.Release"
xcopy /s /Y /E /H /C /I .\Carbon.Windows.Release\ .\_rust\
rmdir /S /Q Carbon.Windows.Release && del /Q Carbon.Windows.Release.zip
GOTO :START-SERVER
:JUMP-CARBON
::
::### Oxide or Carbon, not both ############## INSTALL OXIDE ###################################################
::################################################ START #######################################################
GOTO :JUMP-OXIDE
echo. && echo Updating Oxide, the core to run all mods / plugins.
powershell -Command Invoke-WebRequest -Uri "https://umod.org/games/rust/download?tag=public" -OutFile ".\Oxide.Rust.zip"
powershell -Command "Expand-Archive Oxide.Rust.zip -DestinationPath ./"
xcopy /s /Y RustDedicated_Data .\_rust\RustDedicated_Data\
rmdir /S /Q RustDedicated_Data && del /Q Oxide.Rust.zip
::
::             Create folder for AllSetupOnFirstStart
::
echo. && echo Creating directory oxide/config/ + oxide/data/ + oxide/plugins/
cd _rust && IF EXIST "oxide\" (goto :oxideFolderExist) ELSE (md oxide && cd oxide && md data && md config && md plugins && cd.. && goto :oxideFolderExist)
:oxideFolderExist
cd..
::--------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
echo. && echo Creating directory oxide/data/Kits/
echo.
cd _rust\oxide\data\ && IF EXIST "Kits\" (goto :data-Kits_FolderExist) ELSE (md Kits && goto :data-Kits_FolderExist)
:data-Kits_FolderExist
cd.. && cd.. && cd..
::--------------------------------------------------------------------------------------------------------------------------------------------------------
::Go to plugin section and if AAlertRaid.cs is activated then return here and create folder.
GOTO :JUMP_AAlertRaid_md
:AAlertRaid_md
echo. 
echo. && echo Creating directory oxide/data/AAlertRaid/
echo. 
cd _rust\oxide\data\ && IF EXIST "AAlertRaid\" (goto :data-AAlertRaid_FolderExist) ELSE (md AAlertRaid && goto :data-Kits_FolderExist)
:data-AAlertRaid_FolderExist
cd.. && cd.. && cd..
GOTO :AAlertRaid_md_RETURN
:JUMP_AAlertRaid_md
::--------------------------------------------------------------------------------------------------------------------------------------------------------
::UNDER CONSTRUCTION
echo. 
echo. && echo Creating directory oxide/config_off
echo. 
cd _rust\oxide\ && IF EXIST "config_off\" (goto :config_off_FolderExist) ELSE (md config_off && goto :config_off_FolderExist)
:config_off_FolderExist
cd.. && cd..
::--------------------------------------------------------------------------------------------------------------------------------------------------------
echo. 
echo. && echo Creating directory oxide/data_off
echo. 
cd _rust\oxide\ && IF EXIST "data_off\" (goto :data_off_FolderExist) ELSE (md data_off && goto :data_off_FolderExist)
:data_off_FolderExist
cd.. && cd..
::--------------------------------------------------------------------------------------------------------------------------------------------------------
echo. 
echo. && echo Creating directory oxide/lang_off
echo. 
cd _rust\oxide\ && IF EXIST "lang_off\" (goto :lang_off_FolderExist) ELSE (md lang_off && goto :lang_off_FolderExist)
:lang_off_FolderExist
cd.. && cd..
::--------------------------------------------------------------------------------------------------------------------------------------------------------
echo. 
echo. && echo Creating directory oxide/plugins_off
echo. 
cd _rust\oxide\ && IF EXIST "plugins_off\" (goto :plugins_off_FolderExist) ELSE (md plugins_off && goto :plugins_off_FolderExist)
:plugins_off_FolderExist
cd.. && cd..
::--------------------------------------------------------------------------------------------------------------------------------------------------------
::
::
::                                                    OXIDE PLUGINS | Install / Update
::
::HOW TO ESCAPE SPECIAL CARACTERE &    \""&\""    (because dropbox using  &  sign in link name and batch language dont like it).
::It can also be add before and after entire link. Ex: \"" "https://www.dropbox.com/scl/fi/2hv0t8l8wlmhio2ex75kv/PermissionsManager.cs?rlkey=wkmojk7ahygbnd2kw1taqvrxt&dl=1" \""
::
::                             !!  In this section you must use comment this sign   ::   before GOTO to enable it  !!
::
		 echo                                          OXIDE PLUGINS Install / Update
echo. && echo ---------------------------------------- Server Administration plugins-------------------------------------------- && echo.
::
:: INDEX OF ACTIVE PLUGINS
::
::	Line  357: ::GOTO :JUMP_PermissionsManager.cs             (dropbox) Orffyrus
::	Line  519: ::GOTO :JUMP_CopyPaste.cs

::  INDEX OF MY FAVORITE PLUGINS (DEACTIVATED)
::	Line  591: ::GOTO :JUMP_BuildingSkins.cs
::	Line  601: ::GOTO :JUMP_SkinBox.cs
::	Line  783: ::GOTO :JUMP_RaidblockBuildingHealth.cs
::	Line  792: ::GOTO :JUMP_BuildingHealth.cs
::	Line  801: ::GOTO :JUMP_BuildingHealth.json
::	Line  810: ::GOTO :JUMP_OtherBuildingHealth.cs            (dropbox) Orffyrus	(removed barils double health)
::	Line  833: ::GOTO :JUMP_Economics.cs
::	Line  842: ::GOTO :JUMP_EconomicsBalanceGUI.cs
::	Line  851: ::GOTO :JUMP_EconomicsBalanceGUI.json          (dropbox) Orffyrus	(display config. and positionning)
::	Line  860: ::GOTO :JUMP_GUIShop.cs
::	Line  869: ::GOTO :JUMP_GUIShop.json                      (dropbox) Orffyrus	(Traders -Ressources)
::	Line  879: ::GOTO :JUMP_HumanNPC.cs
::	Line  896: ::GOTO :JUMP_PathFinding.cs
::	Line  905: ::GOTO :JUMP_Waypoints.cs
::	Line  914: ::GOTO :JUMP_ImageLibrary.cs
::	Line  927: ::GOTO :JUMP_Kits.cs
::	Line  937: ::GOTO :JUMP_kits_data.json                    (dropbox) Orffyrus	(kits for traders npc)
::
::---------------------------------
::PermissionsManager.cs
::GOTO :JUMP_PermissionsManager.cs
cd _rust\oxide\plugins\ && IF EXIST "PermissionsManager.cs" (del /Q PermissionsManager.cs && goto :PermissionsManager.cs-download) ELSE (goto :PermissionsManager.cs-download)
:PermissionsManager.cs-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/2hv0t8l8wlmhio2ex75kv/PermissionsManager.cs?rlkey=wkmojk7ahygbnd2kw1taqvrxt&dl=1" \"" -OutFile ".\PermissionsManager.cs"
cd.. && cd.. && cd..
echo  PermissionsManager.cs Updated
:JUMP_PermissionsManager.cs
::---------------------------------
::PlayerAdministration.cs
GOTO :JUMP_PlayerAdministration.cs
cd _rust\oxide\plugins\ && IF EXIST "PlayerAdministration.cs" (del /Q PlayerAdministration.cs && goto :PlayerAdministration.cs-download) ELSE (goto :PlayerAdministration.cs-download)
:PlayerAdministration.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/PlayerAdministration.cs" -OutFile ".\PlayerAdministration.cs"
cd.. && cd.. && cd..
echo  PlayerAdministration.cs Updated
:JUMP_PlayerAdministration.cs
::---------------------------------
::Vanish.cs
GOTO :JUMP_Vanish.cs
cd _rust\oxide\plugins\ && IF EXIST "Vanish.cs" (del /Q Vanish.cs && goto :Vanish.cs-download) ELSE (goto :Vanish.cs-download)
:Vanish.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/Vanish.cs" -OutFile ".\Vanish.cs"
cd.. && cd.. && cd..
echo  Vanish.cs Updated
:JUMP_Vanish.cs
::---------------------------------
::AdminRadar.cs
GOTO :JUMP_AdminRadar.cs
cd _rust\oxide\plugins\ && IF EXIST "AdminRadar.cs" (del /Q AdminRadar.cs && goto :AdminRadar.cs-download) ELSE (goto :AdminRadar.cs-download)
:AdminRadar.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/AdminRadar.cs" -OutFile ".\AdminRadar.cs"
cd.. && cd.. && cd..
echo  AdminRadar.cs Updated
:JUMP_AdminRadar.cs
::---------------------------------
::AdminRadar.json
GOTO :JUMP_AdminRadar.json
cd _rust\oxide\config\ && IF EXIST "AdminRadar.json" (del /Q AdminRadar.json && goto :AdminRadar.json-download) ELSE (goto :AdminRadar.json-download)
:AdminRadar.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/znf6d9lmjzf5pnqnrxp71/AdminRadar.json?rlkey=qkmqg77um060krnedgj4ysjky&dl=1" \"" -OutFile ".\AdminRadar.json"
cd.. && cd.. && cd..
echo  AdminRadar.json Updated
:JUMP_AdminRadar.json
::---------------------------------
::NoGiveNotices.cs
GOTO :JUMP_NoGiveNotices.cs
cd _rust\oxide\plugins\ && IF EXIST "NoGiveNotices.cs" (del /Q NoGiveNotices.cs && goto :NoGiveNotices.cs-download) ELSE (goto :NoGiveNotices.cs-download)
:NoGiveNotices.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/NoGiveNotices.cs" -OutFile ".\NoGiveNotices.cs"
cd.. && cd.. && cd..
echo  NoGiveNotices.cs Updated
:JUMP_NoGiveNotices.cs
::---------------------------------
::RaidTracker.cs
GOTO :JUMP_RaidTracker.cs
cd _rust\oxide\plugins\ && IF EXIST "RaidTracker.cs" (del /Q RaidTracker.cs && goto :RaidTracker.cs-download) ELSE (goto :RaidTracker.cs-download)
:RaidTracker.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/RaidTracker.cs" -OutFile ".\RaidTracker.cs"
cd.. && cd.. && cd..
echo  RaidTracker.cs Updated
:JUMP_RaidTracker.cs
::---------------------------------
::RaidTracker.json (Discord WebHook Setting)
GOTO :JUMP_RaidTracker.json
cd _rust\oxide\config\ && IF EXIST "RaidTracker.json" (del /Q RaidTracker.json && goto :RaidTracker.json-download) ELSE (goto :RaidTracker.json-download)
:RaidTracker.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/01i3lwge04mprub33v3zs/RaidTracker.json?rlkey=xpt7vt3j0iyntifzysilbs9hw&dl=1" \"" -OutFile ".\RaidTracker.json"
cd.. && cd.. && cd..
echo  RaidTracker.json Updated
:JUMP_RaidTracker.json
::---------------------------------
::AdminLogger.cs
GOTO :JUMP_AdminLogger.cs
cd _rust\oxide\plugins\ && IF EXIST "AdminLogger.cs" (del /Q AdminLogger.cs && goto :AdminLogger.cs-download) ELSE (goto :AdminLogger.cs-download)
:AdminLogger.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/AdminLogger.cs" -OutFile ".\AdminLogger.cs"
cd.. && cd.. && cd..
echo  AdminLogger.cs Updated
:JUMP_AdminLogger.cs
::---------------------------------
::AdminLogger.json (Discord WebHook Setting)
GOTO :JUMP_AdminLogger.json
cd _rust\oxide\config\ && IF EXIST "AdminLogger.json" (del /Q AdminLogger.json && goto :AdminLogger.json-download) ELSE (goto :AdminLogger.json-download)
:AdminLogger.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\AdminLogger.json"
cd.. && cd.. && cd..
echo  AdminLogger.json Updated
:JUMP_AdminLogger.json
::---------------------------------
::NoGreen.cs
GOTO :JUMP_NoGreen.cs
cd _rust\oxide\plugins\ && IF EXIST "NoGreen.cs" (del /Q NoGreen.cs && goto :NoGreen.cs-download) ELSE (goto :NoGreen.cs-download)
:NoGreen.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/NoGreen.cs" -OutFile ".\NoGreen.cs"
cd.. && cd.. && cd..
echo  NoGreen.cs Updated
:JUMP_NoGreen.cs
::---------------------------------
::AdminHammer.cs
GOTO :JUMP_AdminHammer.cs
cd _rust\oxide\plugins\ && IF EXIST "AdminHammer.cs" (del /Q AdminHammer.cs && goto :AdminHammer.cs-download) ELSE (goto :AdminHammer.cs-download)
:AdminHammer.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/AdminHammer.cs" -OutFile ".\AdminHammer.cs"
cd.. && cd.. && cd..
echo  AdminHammer.cs Updated
:JUMP_AdminHammer.cs
::---------------------------------
::TimeOfDay.cs
GOTO :JUMP_TimeOfDay.cs
cd _rust\oxide\plugins\ && IF EXIST "TimeOfDay.cs" (del /Q TimeOfDay.cs && goto :TimeOfDay.cs-download) ELSE (goto :TimeOfDay.cs-download)
:TimeOfDay.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/TimeOfDay.cs" -OutFile ".\TimeOfDay.cs"
cd.. && cd.. && cd..
echo  TimeOfDay.cs Updated
:JUMP_TimeOfDay.cs
::---------------------------------
::TimeOfDay.json
GOTO :JUMP_TimeOfDay.json
cd _rust\oxide\config\ && IF EXIST "TimeOfDay.json" (del /Q TimeOfDay.json && goto :TimeOfDay.json-download) ELSE (goto :TimeOfDay.json-download)
:TimeOfDay.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/b6zn6w3yxlzy7mzfk1myo/TimeOfDay.json?rlkey=a82odi2t4vvi4otcm4ei2biqu&dl=1" \"" -OutFile ".\TimeOfDay.json"
cd.. && cd.. && cd..
echo  TimeOfDay.json Updated
:JUMP_TimeOfDay.json
::---------------------------------
::HeliControl.cs
GOTO :JUMP_HeliControl.cs
cd _rust\oxide\plugins\ && IF EXIST "HeliControl.cs" (del /Q HeliControl.cs && goto :HeliControl.cs-download) ELSE (goto :HeliControl.cs-download)
:HeliControl.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/HeliControl.cs" -OutFile ".\HeliControl.cs"
cd.. && cd.. && cd..
echo  HeliControl.cs Updated
:JUMP_HeliControl.cs
::---------------------------------
::ItemRetriever.cs
GOTO :JUMP_ItemRetriever.cs
cd _rust\oxide\plugins\ && IF EXIST "ItemRetriever.cs" (del /Q ItemRetriever.cs && goto :ItemRetriever.cs-download) ELSE (goto :ItemRetriever.cs-download)
:ItemRetriever.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/ItemRetriever.cs" -OutFile ".\ItemRetriever.cs"
cd.. && cd.. && cd..
echo  ItemRetriever.cs Updated
:JUMP_ItemRetriever.cs
::---------------------------------
::ServerArmour.cs
GOTO :JUMP_ServerArmour.cs
cd _rust\oxide\plugins\ && IF EXIST "ServerArmour.cs" (del /Q ServerArmour.cs && goto :ServerArmour.cs-download) ELSE (goto :ServerArmour.cs-download)
:ServerArmour.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/ServerArmour.cs" -OutFile ".\ServerArmour.cs"
cd.. && cd.. && cd..
echo  ServerArmour.cs Updated
:JUMP_ServerArmour.cs
::---------------------------------
::ServerArmour.json
GOTO :JUMP_ServerArmour.json
cd _rust\oxide\config\ && IF EXIST "ServerArmour.json" (del /Q ServerArmour.json && goto :ServerArmour.json-download) ELSE (goto :ServerArmour.json-download)
:ServerArmour.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\ServerArmour.json"
cd.. && cd.. && cd..
echo  ServerArmour.json Updated
:JUMP_ServerArmour.json
::---------------------------------
::CopyPaste.cs
GOTO :JUMP_CopyPaste.cs
cd _rust\oxide\plugins\ && IF EXIST "CopyPaste.cs" (del /Q CopyPaste.cs && goto :CopyPaste.cs-download) ELSE (goto :CopyPaste.cs-download)
:CopyPaste.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/CopyPaste.cs" -OutFile ".\CopyPaste.cs"
cd.. && cd.. && cd..
echo  CopyPaste.cs Updated
:JUMP_CopyPaste.cs
::---------------------------------
::CopyPaste.json
GOTO :JUMP_CopyPaste.json
cd _rust\oxide\config\ && IF EXIST "CopyPaste.json" (del /Q CopyPaste.json && goto :CopyPaste.json-download) ELSE (goto :CopyPaste.json-download)
:CopyPaste.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\CopyPaste.json"
cd.. && cd.. && cd..
echo  CopyPaste.json Updated
:JUMP_CopyPaste.json
::---------------------------------
::copypasteDATA
GOTO :JUMP_copypasteDATA
cd _rust\oxide\data\ && IF EXIST "copypaste" (rmdir /S /Q copypaste && goto :copypasteDATA-download) ELSE (goto :copypasteDATA-download)
:copypasteDATA-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fo/zr6a64abw0ru7nx3iz81f/h?rlkey=txab0eyx1hpjy8383wuilokg9&dl=1" \"" -OutFile ".\copypaste.zip"
powershell -Command "Expand-Archive copypaste.zip -DestinationPath ./copypaste"
del /Q copypaste.zip
cd.. && cd.. && cd..
echo  copypasteDATA Updated
:JUMP_copypasteDATA
::---------------------------------
::
echo. && echo ------------------------------------------------ Server Plugins -------------------------------------------------- && echo.
::
::---------------------------------
::Oxide.Ext.Discord.dll
GOTO :JUMP_Oxide.Ext.Discord.dll
cd _rust\RustDedicated_Data\Managed\ && IF EXIST "Oxide.Ext.Discord.dll" (del /Q Oxide.Ext.Discord.dll && goto :Oxide.Ext.Discord.dll-download) ELSE (goto :Oxide.Ext.Discord.dll-download)
:Oxide.Ext.Discord.dll-download             
powershell -Command Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/8h7ii2yqa5jogmwc8jtr1/Oxide.Ext.Discord.dll?rlkey=d7jiavrxpmxysoq2as5bwjk35`&dl=1" -OutFile ".\Oxide.Ext.Discord.dll"
cd.. && cd.. && cd..
echo  Oxide.Ext.Discord.dll Updated
:JUMP_Oxide.Ext.Discord.dll
::---------------------------------
::PlaceholderAPI.cs
GOTO :JUMP_PlaceholderAPI.cs
cd _rust\oxide\plugins\
IF EXIST "PlaceholderAPI.cs" (del /Q PlaceholderAPI.cs && goto :PlaceholderAPI.cs-download) ELSE (goto :PlaceholderAPI.cs-download)
:PlaceholderAPI.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/placeholder-api.cs" -OutFile ".\PlaceholderAPI.cs"
echo  PlaceholderAPI.cs Updated
cd.. && cd.. && cd..
:JUMP_PlaceholderAPI.cs
::---------------------------------
::ImgurApi.cs
GOTO :JUMP_ImgurApi.cs
cd _rust\oxide\plugins\
IF EXIST "ImgurApi.cs" (del /Q ImgurApi.cs && goto :ImgurApi.cs-download) ELSE (goto :ImgurApi.cs-download)
:ImgurApi.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/imgur-api.cs" -OutFile ".\ImgurApi.cs"
echo  ImgurApi.cs Updated
cd.. && cd.. && cd..
:JUMP_ImgurApi.cs
::---------------------------------
::RustMapApi.cs
GOTO :JUMP_RustMapApi.cs
cd _rust\oxide\plugins\
IF EXIST "RustMapApi.cs" (del /Q RustMapApi.cs && goto :RustMapApi.cs-download) ELSE (goto :RustMapApi.cs-download)
:RustMapApi.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/rust-map-api.cs" -OutFile ".\RustMapApi.cs"
echo  RustMapApi.cs Updated
cd.. && cd.. && cd..
:JUMP_RustMapApi.cs
::---------------------------------
::BuildingSkins.cs
GOTO :JUMP_BuildingSkins.cs
cd _rust\oxide\plugins\
IF EXIST "BuildingSkins.cs" (del /Q BuildingSkins.cs && goto :BuildingSkins.cs-download) ELSE (goto :BuildingSkins.cs-download)
:BuildingSkins.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/building-skins.cs" -OutFile ".\BuildingSkins.cs"
echo  BuildingSkins.cs Updated
cd.. && cd.. && cd..
:JUMP_BuildingSkins.cs
::---------------------------------
::SkinBox.cs
GOTO :JUMP_SkinBox.cs
cd _rust\oxide\plugins\
IF EXIST "SkinBox.cs" (del /Q SkinBox.cs && goto :SkinBox.cs-download) ELSE (goto :SkinBox.cs-download)
:SkinBox.cs-download
powershell -Command Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/d205zvk5kc34rgew87653/SkinBox.cs?rlkey=r0cn32oz2ners7w6i1n5wa808`&dl=1" -OutFile ".\SkinBox.cs"
echo  SkinBox.cs Updated
cd.. && cd.. && cd..
:JUMP_SkinBox.cs
::---------------------------------
::ChaosExtensionDownloader.cs
GOTO :JUMP_ChaosExtensionDownloader.cs
cd _rust\oxide\plugins\
IF EXIST "ChaosExtensionDownloader.cs" (del /Q ChaosExtensionDownloader.cs && goto :ChaosExtensionDownloader.cs-download) ELSE (goto :ChaosExtensionDownloader.cs-download)
:ChaosExtensionDownloader.cs-download
powershell -Command Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/fhnmqps7tku2zaigecnp3/ChaosExtensionDownloader.cs?rlkey=n5l34auaxus4h28x94hwzfief`&dl=1" -OutFile ".\ChaosExtensionDownloader.cs"
echo  ChaosExtensionDownloader.cs Updated
cd.. && cd.. && cd..
:JUMP_ChaosExtensionDownloader.cs
::---------------------------------
::GroupLimits.cs
GOTO :JUMP_GroupLimits.cs
cd _rust\oxide\plugins\
IF EXIST "GroupLimits.cs" (del /Q GroupLimits.cs && goto :GroupLimits.cs-download) ELSE (goto :GroupLimits.cs-download)
:GroupLimits.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/group-limits.cs" -OutFile ".\GroupLimits.cs"
echo  GroupLimits.cs Updated
cd.. && cd.. && cd..
:JUMP_GroupLimits.cs
::---------------------------------
::MaxCupboardAuths.cs
GOTO :JUMP_MaxCupboardAuths.cs
cd _rust\oxide\plugins\
IF EXIST "MaxCupboardAuths.cs" (del /Q MaxCupboardAuths.cs && goto :MaxCupboardAuths.cs-download) ELSE (goto :MaxCupboardAuths.cs-download)
:MaxCupboardAuths.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/max-cupboard-auths.cs" -OutFile ".\MaxCupboardAuths.cs"
echo  MaxCupboardAuths.cs Updated
cd.. && cd.. && cd..
:JUMP_MaxCupboardAuths.cs
::---------------------------------
::DoorLimiter.cs
GOTO :JUMP_DoorLimiter.cs
cd _rust\oxide\plugins\
IF EXIST "DoorLimiter.cs" (del /Q DoorLimiter.cs && goto :DoorLimiter.cs-download) ELSE (goto :DoorLimiter.cs-download)
:DoorLimiter.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/door-limiter.cs" -OutFile ".\DoorLimiter.cs"
echo  DoorLimiter.cs Updated
cd.. && cd.. && cd..
:JUMP_DoorLimiter.cs
::---------------------------------
::AAlertRaid.cs
GOTO :JUMP_AAlertRaid.cs
::Do not comment the next line!
GOTO :JUMP_AAlertRaid_md
cd _rust\oxide\plugins\
IF EXIST "AAlertRaid.cs" (del /Q AAlertRaid.cs && goto :AAlertRaid.cs-download) ELSE (goto :AAlertRaid.cs-download)
:AAlertRaid.cs-download
powershell -Command Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/bamdcgisa202dmp9tm36a/AAlertRaid.cs?rlkey=lwu9dwdh86fwjob8w490jv682`&dl=1" -OutFile ".\AAlertRaid.cs"
echo  AAlertRaid.cs Updated
cd.. && cd.. && cd..
:JUMP_AAlertRaid.cs
:AAlertRaid_md_RETURN
::---------------------------------
::FERMENSData.json
GOTO :JUMP_FERMENSData.json
cd _rust\oxide\data\AAlertRaid\
IF EXIST "FERMENSData.json" (del /Q FERMENSData.json && goto :FERMENSData.json-download) ELSE (goto :FERMENSData.json-download)
:FERMENSData.json-download
powershell -Command Invoke-WebRequest -Uri "https://www.dropbox.com/scl/fi/76prukpoex65ec9wuksjn/FERMENSData.json?rlkey=l9ekubgw390cn4sat7mzlywkk`&dl=1" -OutFile ".\FERMENSData.json"
echo  FERMENSData.json Updated
cd.. && cd.. && cd.. && cd..
:JUMP_FERMENSData.json
::---------------------------------
::AntiOfflineRaid.cs
GOTO :JUMP_AntiOfflineRaid.cs
cd _rust\oxide\plugins\ && IF EXIST "AntiOfflineRaid.cs" (del /Q AntiOfflineRaid.cs && goto :AntiOfflineRaid.cs-download) ELSE (goto :AntiOfflineRaid.cs-download)
:AntiOfflineRaid.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/AntiOfflineRaid.cs" -OutFile ".\AntiOfflineRaid.cs"
cd.. && cd.. && cd..
echo  AntiOfflineRaid.cs Updated
:JUMP_AntiOfflineRaid.cs
::---------------------------------
::AntiOfflineRaid.json - Modified by Orffyrus
GOTO :JUMP_AntiOfflineRaid.json
cd _rust\oxide\config\ && IF EXIST "AntiOfflineRaid.json" (del /Q AntiOfflineRaid.json && goto :AntiOfflineRaid.json-download) ELSE (goto :AntiOfflineRaid.json-download)
:AntiOfflineRaid.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\AntiOfflineRaid.json"
cd.. && cd.. && cd..
echo  AntiOfflineRaid.json Updated
:JUMP_AntiOfflineRaid.json
::---------------------------------
::TruePVE.cs
GOTO :JUMP_TruePVE.cs
cd _rust\oxide\plugins\ && IF EXIST "TruePVE.cs" (del /Q TruePVE.cs && goto :TruePVE.cs-download) ELSE (goto :TruePVE.cs-download)
:TruePVE.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/TruePVE.cs" -OutFile ".\TruePVE.cs"
cd.. && cd.. && cd..
echo  TruePVE.cs Updated
:JUMP_TruePVE.cs
::---------------------------------
::TruePVE.json
GOTO :JUMP_TruePVE.json
cd _rust\oxide\config\ && IF EXIST "TruePVE.json" (del /Q TruePVE.json && goto :TruePVE.json-download) ELSE (goto :TruePVE.json-download)
:TruePVE.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\TruePVE.json"
cd.. && cd.. && cd..
echo  TruePVE.json Updated
:JUMP_TruePVE.json
::---------------------------------
::RaidHours - Based on TruePVE by nivex and modified by Orffyrus, need to be updated and rebuild when updated. *For help, send me a message on Discord / add me as Orffyrus
::To modify TruePVE for RaidHours; In TruePVE.cs you must replace the chat announcement for True PVE to Raid Hours and maby more. Just check the inside the .cs file and do some tests.
::RaidHours.cs   work with ZoneManager.cs
GOTO :JUMP_RaidHours.cs
cd _rust\oxide\plugins\ && IF EXIST "RaidHours.cs" (del /Q RaidHours.cs && goto :RaidHours.cs-download) ELSE (goto :RaidHours.cs-download)
:RaidHours.cs-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\RaidHours.cs"
cd.. && cd.. && cd..
echo  RaidHours.cs Updated
:JUMP_RaidHours.cs
::---------------------------------
::RaidHours.json
GOTO :JUMP_RaidHours.json
cd _rust\oxide\config\ && IF EXIST "RaidHours.json" (del /Q RaidHours.json && goto :RaidHours.json-download) ELSE (goto :RaidHours.json-download)
:RaidHours.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\RaidHours.json"
cd.. && cd.. && cd..
echo  RaidHours.json Updated
:JUMP_RaidHours.json
::---------------------------------
::ZoneManager.cs
GOTO :JUMP_ZoneManager.cs
cd _rust\oxide\plugins\ && IF EXIST "ZoneManager.cs" (del /Q ZoneManager.cs && goto :ZoneManager.cs-download) ELSE (goto :ZoneManager.cs-download)
:ZoneManager.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/ZoneManager.cs" -OutFile ".\ZoneManager.cs"
cd.. && cd.. && cd..
echo  ZoneManager.cs Updated
:JUMP_ZoneManager.cs
::---------------------------------
::
echo. && echo ------------------------------------ CustomVendingSetup and MonumentAddons --------------------------------------- && echo.
::
::---------------------------------
::CustomVendingSetup.cs
GOTO :JUMP_CustomVendingSetup.cs
cd _rust\oxide\plugins\ && IF EXIST "CustomVendingSetup.cs" (del /Q CustomVendingSetup.cs && goto :CustomVendingSetup.cs-download) ELSE (goto :CustomVendingSetup.cs-download)
:CustomVendingSetup.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/CustomVendingSetup.cs" -OutFile ".\CustomVendingSetup.cs"
cd.. && cd.. && cd..
echo  CustomVendingSetup.cs Updated
:JUMP_CustomVendingSetup.cs
::---------------------------------
::CustomVendingSetup.json - Modified by Orffyrus
GOTO :JUMP_CustomVendingSetup.json
cd _rust\oxide\config\ && IF EXIST "CustomVendingSetup.json" (del /Q CustomVendingSetup.json && goto :CustomVendingSetup.json-download) ELSE (goto :CustomVendingSetup.json-download)
:CustomVendingSetup.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/qzemtlerz9r900t99eqyr/CustomVendingSetup.json?rlkey=54v4tkkulv0lldhe70jt8upm2&dl=1" \"" -OutFile ".\CustomVendingSetup.json"
cd.. && cd.. && cd..
echo  CustomVendingSetup.json - Modified by Orffyrus - Updated
:JUMP_CustomVendingSetup.json
::---------------------------------
::MonumentFinder.cs
GOTO :JUMP_MonumentFinder.cs
cd _rust\oxide\plugins\ && IF EXIST "MonumentFinder.cs" (del /Q MonumentFinder.cs && goto :MonumentFinder.cs-download) ELSE (goto :MonumentFinder.cs-download)
:MonumentFinder.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/MonumentFinder.cs" -OutFile ".\MonumentFinder.cs"
cd.. && cd.. && cd..
echo  MonumentFinder.cs Updated
:JUMP_MonumentFinder.cs
::---------------------------------
::MonumentAddons.cs
GOTO :JUMP_MonumentAddons.cs
cd _rust\oxide\plugins\ && IF EXIST "MonumentAddons.cs" (del /Q MonumentAddons.cs && goto :MonumentAddons.cs-download) ELSE (goto :MonumentAddons.cs-download)
:MonumentAddons.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/MonumentAddons.cs" -OutFile ".\MonumentAddons.cs"
cd.. && cd.. && cd..
echo  MonumentAddons.cs Updated
:JUMP_MonumentAddons.cs
::---------------------------------
::
echo. &&  echo ------------------------------------ BuildingHealth and OtherBuildingHealth -------------------------------------- && echo.
::
::---------------------------------
::RaidblockBuildingHealth.cs
GOTO :JUMP_RaidblockBuildingHealth.cs
cd _rust\oxide\plugins\ && IF EXIST "RaidblockBuildingHealth.cs" (del /Q RaidblockBuildingHealth.cs && goto :RaidblockBuildingHealth.cs-download) ELSE (goto :RaidblockBuildingHealth.cs-download)
:RaidblockBuildingHealth.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/RaidblockBuildingHealth.cs" -OutFile ".\RaidblockBuildingHealth.cs"
cd.. && cd.. && cd..
echo  RaidblockBuildingHealth.cs Updated
:JUMP_RaidblockBuildingHealth.cs
::---------------------------------
::BuildingHealth.cs
GOTO :JUMP_BuildingHealth.cs
cd _rust\oxide\plugins\ && IF EXIST "BuildingHealth.cs" (del /Q BuildingHealth.cs && goto :BuildingHealth.cs-download) ELSE (goto :BuildingHealth.cs-download)
:BuildingHealth.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/BuildingHealth.cs" -OutFile ".\BuildingHealth.cs"
cd.. && cd.. && cd..
echo  BuildingHealth.cs Updated
:JUMP_BuildingHealth.cs
::---------------------------------
::BuildingHealth.json - Modified by Orffyrus
GOTO :JUMP_BuildingHealth.json
cd _rust\oxide\config\ && IF EXIST "BuildingHealth.json" (del /Q BuildingHealth.json && goto :BuildingHealth.json-download) ELSE (goto :BuildingHealth.json-download)
:BuildingHealth.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/9iaffr1989hru46xb2w5a/BuildingHealth.json?rlkey=ahk8zj0nud33aqbecrnhercz2&dl=1" \"" -OutFile ".\BuildingHealth.json"
cd.. && cd.. && cd..
echo  BuildingHealth.json - Modified by Orffyrus - Updated
:JUMP_BuildingHealth.json
::---------------------------------
::OtherBuildingHealth.cs - Modified by Orffyrus
GOTO :JUMP_OtherBuildingHealth.cs
cd _rust\oxide\plugins\ && IF EXIST "OtherBuildingHealth.cs" (del /Q OtherBuildingHealth.cs && goto :OtherBuildingHealth.cs-download) ELSE (goto :OtherBuildingHealth.cs-download)
:OtherBuildingHealth.cs-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/dhx3e4xu0lcxhods3uhki/OtherBuildingHealth.cs?rlkey=bnbwxlfu9iy6uatqfr48jsxmk&dl=1" \"" -OutFile ".\OtherBuildingHealth.cs"
cd.. && cd.. && cd..
echo  OtherBuildingHealth.cs - Modified by Orffyrus - Updated
:JUMP_OtherBuildingHealth.cs
::---------------------------------
::
::
::echo. && echo ------------------------------------------ Economics and dependency ------------------------------------------------ && echo.
::
:: TO  ACTIVATE / DEACTIVATE  Plugins: Into Notepad++ select ::GOTO :JUMP_ and do CTRL+F and click the button "Find ALL In Current Document"
:: You will see a list with all ACTIVE Plugins. It also indicate at which line to find it. To deactivate a plugin you need to remove :: before GOTO :JUMP_
:: Note that :: in batch script is use to comment a line that will not be execute.
::
::If you are using HumanNPC plugin and after server wipe you change custom map or if you using procedural map you must read this below.
::YOU NEED TO:   -Remove this file when server wipe. Because it contain the Npc Trader spawn location. \oxide\data\HumanNPC\NpcData.json
::
::For GUIShop plugin running in dependency with HumanNPC you must read this below.
::TO ADD TRADER: -Ingame as an admin; open the chat and type /npc_add then type npc_name theName and type /npc_end
::               -Open oxide\data\HumanNPC\NpcData.json and copy the "userid", exemple: 3567439013
::               -Open oxide\config\GUIShop.json, press CTRL+F to search "Resources" and paste the userid into "NPCId": "",
::               -Save oxide\config\GUIShop.json, goto the game, press F1 and open console. Type o.reload GUIShop, return to the game and talk to your trader.
::
::---------------------------------
::Economics.cs
GOTO :JUMP_Economics.cs
cd _rust\oxide\plugins\ && IF EXIST "Economics.cs" (del /Q Economics.cs && goto :Economics.cs-download) ELSE (goto :Economics.cs-download)
:Economics.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/Economics.cs" -OutFile ".\Economics.cs"
cd.. && cd.. && cd..
echo  Economics.cs Updated
:JUMP_Economics.cs
::---------------------------------
::EconomicsBalanceGUI.cs
GOTO :JUMP_EconomicsBalanceGUI.cs
cd _rust\oxide\plugins\ && IF EXIST "EconomicsBalanceGUI.cs" (del /Q EconomicsBalanceGUI.cs && goto :EconomicsBalanceGUI.cs-download) ELSE (goto :EconomicsBalanceGUI.cs-download)
:EconomicsBalanceGUI.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/EconomicsBalanceGUI.cs" -OutFile ".\EconomicsBalanceGUI.cs"
cd.. && cd.. && cd..
echo  EconomicsBalanceGUI.cs Updated
:JUMP_EconomicsBalanceGUI.cs
::---------------------------------
::EconomicsBalanceGUI.json - Modified by Orffyrus
GOTO :JUMP_EconomicsBalanceGUI.json
cd _rust\oxide\config\ && IF EXIST "EconomicsBalanceGUI.json" (del /Q EconomicsBalanceGUI.json && goto :EconomicsBalanceGUI.json-download) ELSE (goto :EconomicsBalanceGUI.json-download)
:EconomicsBalanceGUI.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/1y29w064k525j9tjfgq0l/EconomicsBalanceGUI.json?rlkey=6mrd005wgabnjw00x01qg2ty6&dl=1" \"" -OutFile ".\EconomicsBalanceGUI.json"
cd.. && cd.. && cd..
echo  EconomicsBalanceGUI.json - Modified by Orffyrus - Updated
:JUMP_EconomicsBalanceGUI.json
::---------------------------------
::GUIShop.cs
GOTO :JUMP_GUIShop.cs
cd _rust\oxide\plugins\ && IF EXIST "GUIShop.cs" (del /Q GUIShop.cs && goto :GUIShop.cs-download) ELSE (goto :GUIShop.cs-download)
:GUIShop.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/GUIShop.cs" -OutFile ".\GUIShop.cs"
cd.. && cd.. && cd..
echo  GUIShop.cs Updated
:JUMP_GUIShop.cs
::---------------------------------
::GUIShop.json - Modified by Orffyrus  This file will be be download only if not exist. (to prevent the lost of NpcIds)  Also contain GUIShop Resources config.
GOTO :JUMP_GUIShop.json
cd _rust\oxide\config\ && IF EXIST "GUIShop.json" (goto :GUIShop.json-OK) ELSE (goto :GUIShop.json-download)
:GUIShop.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/2yoetb8di1njnuzccyzzy/GUIShop.json?rlkey=wlrd8d41iv51mvechy1lbtla5&dl=1" \"" -OutFile ".\GUIShop.json"
:GUIShop.json-OK
cd.. && cd.. && cd..
echo  GUIShop.json - Modified by Orffyrus - Updated
:JUMP_GUIShop.json
::---------------------------------
::HumanNPC.cs
GOTO :JUMP_HumanNPC.cs
cd _rust\oxide\plugins\ && IF EXIST "HumanNPC.cs" (del /Q HumanNPC.cs && goto :HumanNPC.cs-download) ELSE (goto :HumanNPC.cs-download)
:HumanNPC.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/HumanNPC.cs" -OutFile ".\HumanNPC.cs"
cd.. && cd.. && cd..
echo  HumanNPC.cs Updated
:JUMP_HumanNPC.cs
::---------------------------------
::NpcData.json - Modified by Orffyrus
GOTO :JUMP_NpcData.json
cd _rust\oxide\data\HumanNPC\ && IF EXIST "NpcData.json" (del /Q NpcData.json && goto :NpcData.json-download) ELSE (goto :NpcData.json-download)
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\NpcData.json"
cd.. && cd.. && cd.. && cd..
echo  NpcData.json - Modified by Orffyrus - Updated
:JUMP_NpcData.json
::---------------------------------
::PathFinding.cs
GOTO :JUMP_PathFinding.cs
cd _rust\oxide\plugins\ && IF EXIST "PathFinding.cs" (del /Q PathFinding.cs && goto :PathFinding.cs-download) ELSE (goto :PathFinding.cs-download)
:PathFinding.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/PathFinding.cs" -OutFile ".\PathFinding.cs"
cd.. && cd.. && cd..
echo  PathFinding.cs Updated
:JUMP_PathFinding.cs
::---------------------------------
::Waypoints.cs
GOTO :JUMP_Waypoints.cs
cd _rust\oxide\plugins\ && IF EXIST "Waypoints.cs" (del /Q Waypoints.cs && goto :Waypoints.cs-download) ELSE (goto :Waypoints.cs-download)
:Waypoints.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/Waypoints.cs" -OutFile ".\Waypoints.cs"
cd.. && cd.. && cd..
echo  Waypoints.cs Updated
:JUMP_Waypoints.cs
::---------------------------------
::ImageLibrary.cs
GOTO :JUMP_ImageLibrary.cs
cd _rust\oxide\plugins\ && IF EXIST "ImageLibrary.cs" (del /Q ImageLibrary.cs && goto :ImageLibrary.cs-download) ELSE (goto :ImageLibrary.cs-download)
:ImageLibrary.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/ImageLibrary.cs" -OutFile ".\ImageLibrary.cs"
cd.. && cd.. && cd..
echo  ImageLibrary.cs Updated
:JUMP_ImageLibrary.cs
::---------------------------------
::
echo. && echo ------------------------------------------- Kits for Econimics NPC -----------------------------------------------
::
::---------------------------------
::Kits.cs
GOTO :JUMP_Kits.cs
cd _rust\oxide\plugins\ && IF EXIST "Kits.cs" (del /Q Kits.cs && goto :Kits.cs-download) ELSE (goto :Kits.cs-download)
:Kits.cs-download
powershell -Command Invoke-WebRequest -Uri "https://umod.org/plugins/Kits.cs" -OutFile ".\Kits.cs"
cd.. && cd.. && cd..
echo  Kits.cs Updated
:JUMP_Kits.cs
::---------------------------------
::KITS
::kits_data.json - Modified by Orffyrus  This file will be be download only if not exist.
GOTO :JUMP_kits_data.json
cd _rust\oxide\data\Kits\ && IF EXIST "kits_data.json" (goto :kits_data.json-OK) ELSE (goto :kits_data.json-download)
:kits_data.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/18n54hpcbjffjlkatgv8o/kits_data.json?rlkey=qbzhoqypkb09ptikm1tsvr107&dl=1" \"" -OutFile ".\kits_data.json"
:kits_data.json-OK
cd.. && cd.. && cd.. && cd..
echo  kits_data.json - Modified by Orffyrus - Updated
:JUMP_kits_data.json
::---------------------------------
::KITS CONFIG
::Kits.json
GOTO :JUMP_Kits.json
cd _rust\oxide\config\ && IF EXIST "Kits.json" (del /Q Kits.json && goto :Kits.json-download) ELSE (goto :Kits.json-download)
:Kits.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\Kits.json"
cd.. && cd.. && cd.. && cd..
echo  Kits.json Updated
:JUMP_Kits.json
::---------------------------------
::KITS PLAYERS
::player_data.json
GOTO :JUMP_player_data.json
cd _rust\oxide\data\Kits\ && IF EXIST "player_data.json" (del /Q player_data.json && goto :player_data.json-download) ELSE (goto :player_data.json-download)
:player_data.json-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\player_data.json"
cd.. && cd.. && cd.. && cd..
echo  player_data.json Updated
:JUMP_player_data.json
::---------------------------------
::
::################################################ end of OXIDE plugins ########################################
::
::++++++++++++++++++++++++++++++++++++++++++++++++++++ ADVANCE +++++++++++++++++++++++++++++++++++++++++++++++++
::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
::                   Make server appear in COMMUNITY / MODDED list (based on _rust\oxide\oxide.config.json)
::oxide.config.json
GOTO :JUMP_oxide.config.json
echo. && echo -------------------------------------- Oxide and sever default permissions --------------------------------------- && echo.
cd _rust\oxide\ && IF EXIST "oxide.config.json" (del /Q oxide.config.json && goto :oxide.config.json-download) ELSE (goto :oxide.config.json-download)
:oxide.config.json-download
powershell -Command Invoke-WebRequest -Uri \"" "https://www.dropbox.com/scl/fi/npjgfuicjmqpwn992vpmq/oxide.config.json?rlkey=quajuxntp7jwpi7jxu8q9gmrh&dl=1" \"" -OutFile ".\oxide.config.json"
cd.. && cd..
echo  oxide.config.json Updated
:JUMP_oxide.config.json
::******************************************* (For advance users only) *****************************************
::************************ About "oxide.groups.data" and "oxide.users.data" permissions ************************
::
::If you using this option, each time the server restart it will reset/return to your dropbox file model.
::To use this advance option, uncomment the line below.
::GOTO :useAdvancePerms
::In case you make change and want to copy it into dropbox to actualyze your files. Go to \_BACKUP\oxide\data\ 
::
GOTO :JUMP_backup-cfg
echo. && echo --------------------- Copying server config. to _BACKUP folder (for advance users only). ------------------------- && echo.
::
cd _rust\oxide\data\ && IF EXIST "oxide.groups.data" (cd..&&cd..&&cd..&& xcopy /Y /c .\_rust\oxide\data\oxide.groups.data .\_BACKUP\oxide\data\) ELSE (cd..&&cd..&&cd..&& goto :oxide.groups.data-notExist)
:oxide.groups.data-notExist
cd _rust\oxide\data\ && IF EXIST "oxide.users.data" (cd..&&cd..&&cd..&& xcopy /Y /c .\_rust\oxide\data\oxide.users.data .\_BACKUP\oxide\data\) ELSE (cd..&&cd..&&cd..&& goto :oxide.users.data-notExist)
:oxide.users.data-notExist
:JUMP_backup-cfg
GOTO :JUMP_AdvancePerms
:useAdvancePerms
echo. && echo ------------------------------------------------ RESTORING PERMS. ------------------------------------------------ && echo.
::oxide.groups.data
GOTO :JUMP_o.group.data
cd _rust\oxide\data\ && IF EXIST "oxide.groups.data" (del /Q oxide.groups.data && goto :oxide.groups.data-download) ELSE (goto :oxide.groups.data-download)
:oxide.groups.data-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\oxide.groups.data"
cd.. && cd.. && cd..
echo  oxide.groups.data - Updated
::oxide.users.data
cd _rust\oxide\data\ && IF EXIST "oxide.users.data" (del /Q oxide.users.data && goto :oxide.users.data-download) ELSE (goto :oxide.users.data-download)
:oxide.users.data-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\oxide.users.data"
cd.. && cd.. && cd..
echo  oxide.users.data - Updated
timeout /t 8 > nul
cls
:JUMP_o.group.data
:JUMP_AdvancePerms
:JUMP-OXIDE
::************************************** end of advance users section ******************************************
::################################################ OXIDE #######################################################
::################################################# END ########################################################
::
::********************************************************** (For advance users only) ******************************************
::************************************************** About serverauto.cfg, users.cfg & bans.cfg ********************************
::
::serverauto.cfg (where server parameters are stored, added on console or F1 menu for admin. only) !! USE writecfg COMMAND TO SAVE NEW PARAMETERS ADDED !!
::  Usefull parameters:		antihack.flyhack_protection 0	 |	  hackablelockedcrate.requiredhackseconds 300	  |	  minicopter.insidedecayminutes   ect.
::
::If you using this option, each time the server restart it will reset/return to your dropbox file model.
::To use this advance option, uncomment the line below.
::GOTO :useAdvanceCfg
::In case you make change and want to copy it into dropbox to actualyze your files. Go to \_BACKUP\server\backupSystem\cfg\ , copy it to your dropbox and setup it into the section - SERVER ADMIN. SETUP - (on top of this script).
GOTO :JUMP_copy-cfg
echo. && echo ------------------------------------- COPYING SERVER CFG (for advance use) --------------------------------------- && echo.
IF EXIST "_rust\server\backupSystem\cfg\serverauto.cfg" (xcopy /Y /c .\_rust\server\backupSystem\cfg\serverauto.cfg .\_BACKUP\server\backupSystem\cfg\) ELSE (goto :serverauto.cfg-notExist)
:serverauto.cfg-notExist
IF EXIST "_rust\server\backupSystem\cfg\users.cfg" (xcopy /Y /c .\_rust\server\backupSystem\cfg\users.cfg .\_BACKUP\server\backupSystem\cfg\) ELSE (goto :users.cfg-notExist)
:users.cfg-notExist
IF EXIST "_rust\server\backupSystem\cfg\bans.cfg" (xcopy /Y /c .\_rust\server\backupSystem\cfg\bans.cfg .\_BACKUP\server\backupSystem\cfg\) ELSE (goto :bans.cfg-notExist)
:bans.cfg-notExist
:JUMP_copy-cfg
::
GOTO :JUMP_AdvanceCfg
:useAdvanceCfg
echo. && echo ------------------------------------ RESTORING SERVER CFG (for advance use) -------------------------------------- && echo.
::serverauto.cfg
IF EXIST "_rust\server\backupSystem\cfg\serverauto.cfg" (del /Q _rust\server\backupSystem\cfg\serverauto.cfg && goto :serverauto.cfg-download) ELSE (goto :serverauto.cfg-download)
:serverauto.cfg-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\serverauto.cfg"
echo  serverauto.cfg - Updated
::users.cfg
IF EXIST "_rust\server\backupSystem\cfg\users.cfg" (del /Q _rust\server\backupSystem\cfg\users.cfg && goto :users.cfg-download) ELSE (goto :users.cfg-download)
:users.cfg-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\users.cfg"
echo  users.cfg - Updated
::bans.cfg
IF EXIST "_rust\server\backupSystem\cfg\bans.cfg" (del /Q _rust\server\backupSystem\cfg\bans.cfg && goto :bans.cfg-download) ELSE (goto :bans.cfg-download)
:bans.cfg-download
powershell -Command Invoke-WebRequest -Uri \"" "pasteYourDropboxLinkHere" \"" -OutFile ".\bans.cfg"
echo  bans.cfg - Updated
:JUMP_AdvanceCfg
::
::-----------------------
timeout /t 8 > nul && cls
::-----------------------
::
::++++++++++++++++++++++++++++++++++++++++++++++++++++ ADVANCE +++++++++++++++++++++++++++++++++++++++++++++++++
::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
::
echo.
echo. && echo ----------------------------------------------- STARTING SERVER -------------------------------------------------- && echo.
echo  To close server type:  server.save  and press ENTER and type:  QUIT  and press ENTER.
echo. && timeout /t 30
GOTO :START-SERVER
:QUIT-SERVER
echo. && echo ----------------------------------------------- CREATING BACKUP -------------------------------------------------- && echo.
::IMPORTANT README !!
::In RUST server console to save and quit you must write QUIT. This will save Blueprints, Economics, Users Auth. level and Oxide permissions.
::Not sure but I think we must manually restore players blueprints after forced wipe. Named by date/time in .\RustServer_DATA\noBPsWipe-Backup\ you chose the most resent folder and copy the files into .\_rust\server\noBPsWipe\
for /f "tokens=1* delims=" %%a in ('date /T') do set datestr=%%a
set time=%TIME:~0,2%h%TIME:~3,2%
::
::Blueprints
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\*.db"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\"%date:/=%_%time%"\)
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\*.db-journal"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\"%date:/=%_%time%"\)
::
::Map save game
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\*.sav"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\"%date:/=%_%time%"\)
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\*.sav.1"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\"%date:/=%_%time%"\)
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\*.sav.2"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\"%date:/=%_%time%"\)
::
::Oxide permissions
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\oxide\data\oxide.users.data"') do (xcopy /i /Y /c "%%i" .\_BACKUP\oxide\data\"%date:/=%_%time%"\)
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\oxide\data\oxide.groups.data"') do (xcopy /i /Y /c "%%i" .\_BACKUP\oxide\data\"%date:/=%_%time%"\)
::
::Server cfg
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\cfg\serverauto.cfg"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\cfg\"%date:/=%_%time%"\)
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\cfg\users.cfg"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\cfg\"%date:/=%_%time%"\)
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\server\backupSystem\cfg\bans.cfg"') do (xcopy /i /Y /c "%%i" .\_BACKUP\server\backupSystem\cfg\"%date:/=%_%time%"\)
::
::Economics
for /f "delims=" %%i in ('dir /s /b /a-d ".\_rust\oxide\data\Economics.json"') do (xcopy /i /Y /c "%%i" .\_BACKUP\oxide\data\"%date:/=%_%time%"\)
::
cls && echo. && echo                        SAVE COMPLETE && echo. && timeout /t 3 > nul && EXIT