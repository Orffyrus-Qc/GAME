# Rust Dedicated Server Auto Installer & Manager

**OrffyRUST v1.8.9** — Advanced Windows batch script for installing, updating, running, and maintaining a Rust dedicated server with minimal effort.

This script provides a "set and forget" experience for hosting Rust servers (including modded setups).

## Features

- **SteamCMD Integration** — Automatically downloads SteamCMD (if missing), installs, and keeps the Rust dedicated server up to date.
- **Automatic Restart System** — Creates `autoRestart.bat` + helper VBScript to monitor and restart the server if it crashes or is closed. Keeps the server running reliably.
- **Smart Auto-Backups** — Uses a dedicated `server.identity "backupSystem"` so that world/player data is automatically backed up (do **not** change the identity or backups will break).
- **Extensive Server Configuration** — Heavily documented launch parameters for:
  - Scheduled wipes (`-wipeDayofWeek`, `-wipeHourofDay`)
  - Custom maps (Dropbox, rustmaps.com, or local `file:///` URLs)
  - Performance tuning (`-fps.limit`, save intervals, decay, etc.)
  - RCON, query ports, app ports
  - Hardcore / specific gamemodes
- **Advanced Plugin & Config Sync** (optional) — Section for linking plugin configuration files to Dropbox or other hosting so a single script can fully recreate a complex modded server (including all settings and user preferences).
- **Windows Security & Network Notes** — Clear guidance for first-run firewall prompts and private network requirements.

## Quick Start

1. Place the script in its own folder (e.g. `C:\Rust_Server\`).
2. Run `_OrffyRUST_v1.8.9.bat` as Administrator.
3. The script will:
   - Download/install SteamCMD + Rust server files into a `_rust` subfolder
   - Create the auto-restart helper
   - Launch the server with the configured parameters
4. On first launch, approve the Windows Security Alert for **Private networks**.

## Important Notes

- The script expects to be run from its own directory.
- Do **not** rename or change `server.identity "backupSystem"` if you want the built-in auto-backup behavior to continue working.
- For custom maps, use the examples in the script header (Dropbox direct links or local files for testing).
- The server runs in `-batchmode` with specific ports (28015 game, 28016 query, 28017 RCON, 28018 app).
- Edit the launch parameters inside the script (search for the `call RustDedicated.exe` line) to customize hostname, seed, worldsize, maxplayers, RCON password, etc.

## Recommended Folder Layout

```
C:\Rust_Server\
├── _OrffyRUST_v1.8.9.bat
├── autoRestart.bat          (generated)
├── focusServerWindow.vbs    (generated)
└── _rust\                   (created by script - contains RustDedicated.exe + server data)
    └── ...
```

## Related Projects in This Collection

- [7DaysToDie_Server_AutoInstaller](../7DaysToDie_Server_AutoInstaller) — Similar automated installer for 7 Days to Die
- [STATIONEERS](../STATIONEERS) — Large collection of Stationeers game server tools and IC10 scripts

## Credits

Script created and maintained by Orffyrus (OrffyRUST series).

For the latest version or modifications, contact the author or check updates in this repository.

---

**Warning:** Running game servers requires a stable machine, good network, and proper firewall/router configuration (port forwarding for 28015/28016/28017 if public).
