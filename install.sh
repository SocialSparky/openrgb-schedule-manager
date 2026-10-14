#!/usr/bin/env bash
set -e

echo "🔧 Installing OpenRGB Schedule Manager..."

if ! command -v zenity >/dev/null 2>&1; then
    echo "❌ Error: 'zenity' is required for the GUI. Install it with: sudo apt install zenity"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.local/bin" "$HOME/.config/systemd/user" "$HOME/.local/share/applications"

cp "$SCRIPT_DIR/openrgb-scheduler" "$HOME/.local/bin/openrgb-scheduler"
chmod +x "$HOME/.local/bin/openrgb-scheduler"

cat << 'SERVICE' > "$HOME/.config/systemd/user/openrgb-schedule.service"
[Unit]
Description=Evaluate and apply OpenRGB time-of-day profile

[Service]
Type=oneshot
ExecStart=%h/.local/bin/openrgb-scheduler
SERVICE

cat << 'TIMER' > "$HOME/.config/systemd/user/openrgb-schedule.timer"
[Unit]
Description=Run OpenRGB scheduler on boot and every minute

[Timer]
OnStartupSec=5s
OnCalendar=*:0/1
AccuracySec=1s

[Install]
WantedBy=timers.target
TIMER

systemctl --user daemon-reload
systemctl --user enable --now openrgb-schedule.timer

cat << DESKTOP > "$HOME/.local/share/applications/openrgb-scheduler.desktop"
[Desktop Entry]
Type=Application
Name=OpenRGB Schedule Manager
Comment=Manage time-of-day lighting profiles for OpenRGB
Exec=$HOME/.local/bin/openrgb-scheduler --gui
Icon=openrgb
Terminal=false
Categories=Utility;Settings;HardwareSettings;
Keywords=rgb;led;lighting;schedule;openrgb;color;
StartupNotify=true
DESKTOP

chmod +x "$HOME/.local/share/applications/openrgb-scheduler.desktop"
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo "✅ Installation complete! Launch 'OpenRGB Schedule Manager' from your app menu."
