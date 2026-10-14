#!/usr/bin/env bash

echo "🗑️ Removing OpenRGB Schedule Manager..."

systemctl --user disable --now openrgb-schedule.timer 2>/dev/null || true
rm -f "$HOME/.config/systemd/user/openrgb-schedule.timer"
rm -f "$HOME/.config/systemd/user/openrgb-schedule.service"
systemctl --user daemon-reload

rm -f "$HOME/.local/bin/openrgb-scheduler"
rm -f "$HOME/.local/share/applications/openrgb-scheduler.desktop"
rm -f "/tmp/openrgb_current_profile_${USER}"
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo "✅ Uninstalled! (Note: Your saved schedule at ~/.config/openrgb_schedule.conf was kept in case you reinstall)."
