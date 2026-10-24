# OpenRGB Schedule Manager

A lightweight, reboot-proof time-of-day and weekly profile scheduler for OpenRGB on Linux with a Zenity GUI.

## Features

* **Weekly Scheduling (New in v1.1):** Assign OpenRGB profiles to run Everyday, Weekdays, Weekends, or specific days of the week.
* **Broad Compatibility (New in v1.1):** GUI redesigned to support the latest Zenity updates in Ubuntu 24.04 and Linux Mint 22.
* **Reboot Resilient:** Automatically applies the correct schedule profile on system boot or user login.
* **Zero Overhead:** Uses a systemd user timer and state tracking so OpenRGB only executes when crossing a time boundary, rather than running constantly in the background.
* **Simple GUI:** Add, edit, or delete time slots and select your saved .orp profiles directly from a dropdown menu. 
* **Native & Flatpak Support:** Automatically detects .orp profiles from both standard and Flatpak OpenRGB installations.

## Installation

1. Open a terminal in this folder and make the scripts executable:
   `chmod +x install.sh uninstall.sh openrgb-scheduler`

2. Run the installer:
   `./install.sh`

3. Open your Linux application menu and launch OpenRGB Schedule Manager.

## Uninstall

Run the uninstall script from this directory:
`./uninstall.sh`
