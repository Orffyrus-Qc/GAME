	@echo off
	echo.
	echo          Server Auto Installer
	echo              7 Days to Die
	echo.
	pause
	cls
	::Steamcmd Install
	IF EXIST "steamcmd.exe" ( goto :SteamCMD-OK ) ELSE (
		powershell -Command "(New-Object Net.WebClient).DownloadFile('https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip', 'steamcmd.zip')"
		powershell -Command "Expand-Archive steamcmd.zip -DestinationPath ./" )
	:SteamCMD-OK
	::Steamcmd Start
	steamcmd +force_install_dir ./ +login anonymous +app_update 294420 validate +quit
	GOTO :MOD_INSTALLED_OK
	::Delete everything into Mods folder
	cd steamapps\common\"7 Days to Die Dedicated Server"\
	del /S /Q Mods
	rmdir /s /q Mods
	md Mods
	cd..
	cd..
	cd..
	cls
	::JUMP MOD INSTALLATION
	GOTO :MOD_INSTALLED_OK
	::Downloading Ravenhearst		
	IF EXIST "ravenhearst_9-main.zip" ( goto :RH-OK ) ELSE (
		echo.
		echo Downloading Ravenhearst . . . 
		echo.
		powershell -Command "(New-Object Net.WebClient).DownloadFile('https://gitlab.com/jaxteller718/ravenhearst_9/-/archive/main/ravenhearst_9-main.zip', 'ravenhearst_9-main.zip')"
		powershell -Command "Expand-Archive ravenhearst_9-main.zip -DestinationPath .\ " )
		cd ravenhearst_9-main
		xcopy /Y /c /s /i *.* ..\steamapps\common\"7 Days to Die Dedicated Server"
		cd..
		cls	
	:MOD_INSTALLED_OK
	cls
	echo.
	echo Accept the firewall notification for Private Network.
	echo Set your server network connection to PRIVATE.
	echo On your router: dst NAT server IP to UDP port 26900
	echo.
	echo Install Complete
	echo.
	pause