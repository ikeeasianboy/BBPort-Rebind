# BBPort Rebind

**Custom Controller Remapping for Bloodborne PC**

Created by **Wooikee**.

BBPort Rebind lets you customize controller button mappings for Supermedo's BBPort v1.6 on Windows.

## Download

1. Open the [latest GitHub release](https://github.com/ikeeasianboy/BBPort-Rebind/releases/latest).
2. Find the `BBPort_Rebind.zip` file under **Assets**.
3. Download the ZIP and extract it using Windows File Explorer or your preferred archive tool.

## Installation Guide

### Step 1: Locate Your BBPort Folder

Find the folder where your existing BBPort installation is located. This is the folder containing `Bloodborne.exe`.

**Do not delete or replace your original BBPort files.**

### Step 2: Install BBPort Rebind

After extracting the archive, locate the `BBPort Rebind` folder.

Place it inside your existing BBPort folder so the directory structure looks like this:

```text
Your BBPort Folder/
├── Bloodborne.exe
└── BBPort Rebind/
    ├── Launch BBPort with Controller Remap.bat
    ├── controller-remap.ini
    └── runtime/
        └── BBPort_Controller_Remapper.html
```

The other files included with the package should remain in their original locations.

### Step 3: Launch the Game

1. Open the `BBPort Rebind` folder.
2. Double-click `Launch BBPort with Controller Remap.bat`.
3. Once BBPort opens, press **Play** to launch Bloodborne.

**Important:** Always launch the game using the included batch file when you want controller remapping enabled. Launching through your original shortcut may not load the custom configuration.

## How to Customize Your Controls

### Step 1: Open the Controller Editor

Open this link:

**[BBPort Rebind Controller Remapper](https://ikeeasianboy.github.io/BBPort-Rebind/)**

The editor runs in your web browser. You do not need to install a separate application.

### Step 2: Choose Your Button Mappings

Select the desired Bloodborne action for each supported physical controller input.

Available actions include:

- Cross, Circle, Square, and Triangle
- L1, R1, L2, and R2
- L3 and R3
- Options and touchpad
- D-pad directions
- None, to disable a mapped action

For example, to swap Cross and Circle, assign Circle to the physical input that normally sends Cross, and Cross to the physical input that normally sends Circle.

### Step 3: Download Your Configuration

1. Finish customizing your mappings.
2. Click **Download INI** in the editor.
3. Your browser will download `controller-remap.ini`.

### Step 4: Replace the Existing Configuration

1. Open your `BBPort Rebind` folder.
2. Replace the existing `controller-remap.ini` with the downloaded file.
3. Make sure the new file has the exact name `controller-remap.ini`, not `controller-remap (1).ini` or `controller-remap.ini.txt`.

### Step 5: Test Your Controls

Close the game if it is running.

Launch it again using `Launch BBPort with Controller Remap.bat` and press **Play**. Your updated mappings should now be active.

Repeat these steps whenever you want to change your controls.

## Restore Default Controls

1. Open the [Controller Remapper](https://ikeeasianboy.github.io/BBPort-Rebind/).
2. Select **Reset to Standard Defaults**.
3. Download the new `controller-remap.ini`.
4. Replace the existing configuration file in your `BBPort Rebind` folder.
5. Restart the game using the included batch file.

## Troubleshooting

**My controls have not changed.**

Make sure you replaced the correct `controller-remap.ini` file and relaunched the game after changing the configuration.

**BBPort launches, but the remapping does not work.**

Make sure you launched the game using `Launch BBPort with Controller Remap.bat` rather than the original shortcut.

**The editor does not remember my previous selections.**

The editor saves selections in your browser's local storage. Opening it in a different browser or clearing that browser's site data may reset your selections. Your downloaded INI file remains a separate configuration.

## Current Limitations

- Analog-stick directions cannot currently be remapped.
- Keyboard key rebinding is not included.
- Back/View and touchpad inputs share the same touchpad action.

## Security Notice

One antivirus scanner has flagged the release archive. The cause has not been conclusively identified. Review the source and scan the archive before running it. Do not disable your security software to install the mod.

## Credits and License

Based on [Supermedo's BBPort](https://github.com/Supermedo/bloodborne_pc).

See the repository's `LICENSE` file and applicable third-party license notices.

No Bloodborne game files are included.

**Contact me in [Discord](https://guns.lol/ikee)**
