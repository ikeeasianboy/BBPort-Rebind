# BBPort Rebind

**Custom Controller Remapping for Bloodborne PC**

Created by **Wooikee**.

BBPort Rebind is an experimental controller-remapping modification for Supermedo's BBPort v1.6 on Windows. It adds configurable controller button and trigger mappings through a modified runtime and a browser-based editor.

## Features

- Customize supported controller button mappings.
- Assign actions such as Cross, Circle, Square, Triangle, L1, R1, L2, R2, and D-pad directions.
- Save and reload mappings using `controller-remap.ini`.
- Customize controls through the included HTML editor.
- Keep the original BBPort installation separate from the custom runtime.

## Repository Contents

- `src/runtime_pad.c`: Controller input and remapping implementation.
- `editor/index.html`: Browser-based controller configuration editor.
- `docs/controller-remap.patch`: Controller-remapping source patch.
- `BBPORT_REBIND.md`: Additional project information.

## Requirements

- Supermedo BBPort v1.6 for Windows.
- MSYS2 CLANG64 and the build dependencies documented by the upstream project.

## Current Status

**Alpha.** The source changes and editor are published for review. In-game compatibility and clean-install behavior still need testing.

No prebuilt binary release is provided here at this time. Do not treat the source publication as a verified, ready-to-install release.

## Current Limitations

- Analog stick directions cannot currently be remapped through the editor.
- View/Back and touchpad inputs share the same Bloodborne touchpad action.
- Keyboard key rebinding is not included.

## Credits and License

Based on [Supermedo's BBPort](https://github.com/Supermedo/bloodborne_pc).

This repository retains the upstream project license and applicable third-party licenses. See `LICENSE` and the relevant notices.

Bloodborne game files are not included.

**Contact me in Discord:** https://guns.lol/ikee
