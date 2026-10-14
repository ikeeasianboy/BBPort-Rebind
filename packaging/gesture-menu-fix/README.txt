BBPort Gesture Menu Fix v1.0
================================

Target: Supermedo BBPort Windows v1.7.2.

CONTROLS
- G: Gesture Menu
- Tab: Gesture Menu
- Xbox View/Back: left touchpad action
- Short L3 press: normal L3 action
- Hold L3 for about 600 ms: Gesture Menu

INSTALLATION
1. Close Bloodborne and the BBPort launcher.
2. Extract this ZIP.
3. Run Install.bat.
4. Enter the full folder path of your existing v1.7.2 installation,
   for example: D:\BBPort\bbport-windows
5. Follow the installer output.

The installer checks the original v1.7.2 runtime, backs up files it
replaces and input.ini, overlays only changed runtime files, and adds
the G binding. It does not delete existing runtime files, saves,
launcher files, or bbbridge-cli.exe.

RESTORATION
Run Restore.bat, enter the same BBPort installation folder, and choose
the backup you want to restore.

IMPORTANT
- Close the game and launcher before installation or restoration.
- This is a runtime/input fix, not a Bloodborne asset-folder mod.
- Intended for the official Windows v1.7.2 package only.
- It does not include Bloodborne game data.
- Offline controls were tested. Online co-op should be retested after
  installation before this package is described as fully compatible.

Source changes and applicable license information are included.
