# BBPort Gesture Menu Fix v1.0

An input fix for Supermedo's Bloodborne PC port, Windows v1.7.2.

## Features

- G opens the Gesture Menu.
- Tab remains supported.
- Xbox View/Back opens the Gesture Menu.
- Holding L3 opens the Gesture Menu after approximately 600 ms.
- A short L3 press preserves its normal action.
- Simulated touchpad input uses updated touch tracking.

## Source

Base project:
https://github.com/Supermedo/bloodborne_pc

Base version: windows-v1.7.2

The modified source files are included in the gesture-menu-fix-v1.0 branch of https://github.com/ikeeasianboy/BBPort-Rebind.
The exact source patch is also provided as gesture-menu-fix.patch.

## Build from source

1. Install and configure MSYS2 CLANG64 according to the upstream
   repository's Windows build instructions.
2. Clone this repository's bbport-stability branch:

   git clone --branch gesture-menu-fix-v1.0 https://github.com/ikeeasianboy/BBPort-Rebind.git

3. Enter the repository:

   cd bloodborne_pc

4. Build the runtime:

   bash build.sh

5. Package the Windows build:

   bash packaging/windows/package.sh

This repository contains the published Gesture Menu Fix source and build instructions.

## Installation

See packaging/gesture-menu-fix/README.txt.

The prebuilt installer targets the original Supermedo Windows v1.7.2
runtime. It verifies the original runtime before applying changes and
creates a backup for restoration.

## Testing

The Gesture Menu controls were tested offline using an Xbox One S
controller. The Gesture Menu also worked with Play Online enabled.
Full matchmaking and summon compatibility have not been exhaustively
tested.

## Licensing

This is based on the upstream project's GPL-2.0-or-later codebase.
See the repository's existing LICENSE and third-party license notices.
