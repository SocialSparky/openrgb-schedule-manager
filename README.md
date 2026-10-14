# OpenRGB Schedule Manager

A lightweight, reboot-proof time-of-day profile scheduler for OpenRGB on Linux with a Zenity GUI.

## Features
- **Reboot Resilient:** Automatically applies the proper time-slot profile on boot or login.
- **Zero Overhead:** Uses a systemd user timer and state tracking so OpenRGB only runs when crossing a time boundary.
- **Simple GUI:** Add, edit, or delete time slots and choose saved `.orp` profiles from a dropdown menu.
- **Native & Flatpak Support:** Detects `.orp` profiles from both standard and Flatpak OpenRGB installations.

## Installation
1. Open a terminal in this folder and run:

    chmod +x install.sh uninstall.sh openrgb-scheduler
    ./install.sh

2. Open your application menu and launch **OpenRGB Schedule Manager**.

## Uninstall
Run `./uninstall.sh` from this directory.
