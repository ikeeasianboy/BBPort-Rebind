# BBPort Rebind

BBPort Rebind is an alpha controller-remapping modification for Supermedo's BBPort v1.6 for Bloodborne PC.

## Features

- Customize supported SDL gamepad button and trigger mappings.
- Edit configuration through the browser-based editor in `editor/index.html`.
- Export mappings as `controller-remap.ini`.
- Load mappings in a modified BBPort runtime.

## Configuration

The runtime reads the path specified by `BB_CONTROLLER_REMAP`. If that variable is not set, it looks for `controller-remap.ini` in the process working directory.

The custom runtime must be built from this source for the remapping implementation to work.

## Build

Use an MSYS2 CLANG64 environment and follow the build prerequisites documented in the upstream repository:

https://github.com/Supermedo/bloodborne_pc

Then run:

    bash build.sh

## Limitations

- Analog-stick remapping is not implemented in the editor.
- Keyboard rebinding is not included.
- Controller behavior depends on the SDL gamepad mapping.
- This is an alpha source release. Compatibility should be tested before general distribution.

## License and credits

This project is based on Supermedo's BBPort. See `LICENSE` and the applicable third-party license notices.

Original project: https://github.com/Supermedo/bloodborne_pc

Created by Wooikee.

Contact: https://guns.lol/ikee

No Bloodborne game files are included.
