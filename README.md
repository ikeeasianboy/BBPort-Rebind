# BBPort Rebind

**Controller Remapping for Bloodborne PC**

Created by **Wooikee**.

BBPort Rebind is an experimental controller-remapping modification for Supermedo's BBPort v1.6 on Windows. It adds configurable controller button and trigger mappings through a modified runtime and a browser-based editor.

## Controller Remapper

**[Open the BBPort Rebind Controller Remapper](https://ikeeasianboy.github.io/BBPort-Rebind/)**

Use the editor to customize supported controller inputs, save your configuration, and download `controller-remap.ini`.

The editor runs in your browser. Your configuration is not uploaded by the editor.

**Important:** The editor only creates the configuration file. A compatible modified BBPort runtime is required for the remappings to work in-game.

## Features

- Remap supported controller buttons and triggers.
- Assign actions such as Cross, Circle, Square, Triangle, L1, R1, L2, R2, Options, and D-pad actions.
- Load an existing `controller-remap.ini` into the editor.
- Download and reuse customized controller configurations.
- Keep the remapping changes separate from the original BBPort installation.

## How It Works

1. Open the [Controller Remapper](https://ikeeasianboy.github.io/BBPort-Rebind/).
2. Choose the desired action for each supported controller input.
3. Download `controller-remap.ini`.
4. Use the configuration with a compatible BBPort Rebind runtime. Restart the game after changing the configuration.

The modified runtime reads the configuration path specified by `BB_CONTROLLER_REMAP`. If that variable is not set, it looks for `controller-remap.ini` in the process working directory.

## Requirements

- Supermedo's BBPort v1.6 for Windows.
- A compatible build of the modified BBPort Rebind runtime.
- For building from source, MSYS2 CLANG64 and the required build dependencies.

Original project: [Supermedo/bloodborne_pc](https://github.com/Supermedo/bloodborne_pc)

## Current Status

**Alpha**

The controller-remapping implementation has been tested in-game on the developer's setup. Broader controller compatibility and clean-install testing are still needed.

This repository currently provides the source changes and browser-based editor, not a ready-to-install BBPort Rebind binary release. The prebuilt package is being held back while an antivirus detection is investigated.

## Limitations

- Analog-stick direction remapping is not implemented.
- Keyboard key rebinding is not included.
- Back/View and touchpad inputs share the same touchpad action in the current implementation.
- Controller behavior may vary depending on the controller and its SDL gamepad mapping.

## Building from Source

Use an MSYS2 CLANG64 environment and follow the build prerequisites documented by the upstream project.

Run:

```bash
bash build.sh
```

Review the source and the upstream project documentation before building.

## Credits and License

BBPort Rebind is based on [Supermedo's BBPort](https://github.com/Supermedo/bloodborne_pc).

See the repository's `LICENSE` file and applicable third-party license notices.

No Bloodborne game files are included.

**Contact me in Discord:** [guns.lol/ikee](https://guns.lol/ikee)
