# LinuxFedoraConfig

This repository contains a curated set of Wayland desktop configuration files for Fedora, focused on a compact **Hyprland + Noctalia** setup. The configs live under `.config`.

Noctalia now provides the launcher, status bar, notifications, and other desktop utilities that were previously handled by Rofi, Waybar, and Mako. Those older configurations are still kept in this repository for reference and to preserve how the desktop used to be assembled.

## Overview

- **Compositor:** Hyprland — active configuration is [.config/hypr/hyprland.lua](.config/hypr/hyprland.lua).
- **Desktop shell:** Noctalia — provides the launcher, bar, notifications, control panels, and related utilities. It is autostarted from Hyprland and driven through its IPC (`noctalia msg ...`).
- **Terminal:** Kitty — main terminal configuration is in [.config/kitty/kitty.conf](.config/kitty/kitty.conf).
- **Wallpaper daemon:** Hyprpaper — wallpaper settings are in [.config/hypr/hyprpaper.conf](.config/hypr/hyprpaper.conf). It is no longer autostarted by the current config and remains available as an optional/legacy component.
- **Legacy components (retained for reference):** Rofi, Waybar, and Mako — see [Legacy configuration](#legacy-configuration) below.

## Current setup: Hyprland + Noctalia

The current Hyprland config is the Lua one, [.config/hypr/hyprland.lua](.config/hypr/hyprland.lua):

- Autostarts Noctalia on Hyprland start: `hl.exec_cmd("noctalia")`.
- Routes the launcher through Noctalia instead of Rofi:
  `hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))`.
- Keeps the rest of the desktop behavior (monitors, animations, keybindings, workspace rules, media keys, screenshots) largely unchanged from the original setup.
- Noctalia manages the bar and notifications, so Waybar and Mako are not started anymore. The old autostart lines remain commented in the legacy config as a trace of the previous setup.

Noctalia stores its settings in `~/.config/noctalia/` (including `settings.json` and `plugins.json`). That folder is synced into this repository by [copy-config.sh](copy-config.sh).

## Key files and where to edit

- **Hyprland (active):** [.config/hypr/hyprland.lua](.config/hypr/hyprland.lua)
  - Defines monitors, keybindings, workspaces, animations, window rules, and autostart (Noctalia).
  - Launcher bind: `SUPER + R` → Noctalia launcher.
- **Hyprland (legacy reference):** [.config/hypr/hyprland.conf](.config/hypr/hyprland.conf)
  - The previous `.conf`-based configuration. Kept for reference; it still shows the old `exec-once` lines for Waybar, Hyprpaper, and Mako (now commented out).
- **Hyprpaper wallpaper:** [.config/hypr/hyprpaper.conf](.config/hypr/hyprpaper.conf)
- **Kitty terminal:** [.config/kitty/kitty.conf](.config/kitty/kitty.conf)
- **Rofi theme / menu (legacy):** [.config/rofi/config.rasi](.config/rofi/config.rasi)
- **Waybar (legacy):** [.config/waybar/config.jsonc](.config/waybar/config.jsonc)
  - Visual styling: [.config/waybar/style.css](.config/waybar/style.css)
  - Module files: [.config/waybar/modules/](.config/waybar/modules/) (audio, battery, clock, connections, distro, groups, idle-inhibitor, power-profiles-daemon, storage, system, tray-notif, workspace)
  - CSS tokens (variables): [.config/waybar/tokens/](.config/waybar/tokens/)
- **Mako (legacy):** [.config/mako/config](.config/mako/config), with related settings in [.config/hypr/hyprland.conf](.config/hypr/hyprland.conf)

## Programs used and purpose

### Active

- **Hyprland** — a tiling Wayland compositor. Configured here for multi-monitor layouts, animations, gaps, workspace rules, and keybinds.
- **Noctalia** — a Wayland desktop shell that supplies the launcher, status bar, notification daemon, control center, and other utilities. It replaces the separate Rofi, Waybar, and Mako processes with a single integrated shell.
- **Kitty** — GPU-accelerated terminal emulator; the `kitty.conf` included here customizes fonts, colors, and behavior.
- **Hyprpaper** — lightweight wallpaper daemon used to set per-monitor wallpapers. Optional in the current setup since it is no longer autostarted.

### Legacy configuration

These components are no longer part of the main Hyprland + Noctalia setup, but their configurations are intentionally kept so the previous desktop composition and usage can be reproduced.

- **Rofi** — application launcher and window switcher. `config.rasi` contains the theme colors, sizes, and behavior used before Noctalia's launcher. It was invoked through `$menu = rofi -show drun` in the old Hyprland config.
- **Waybar** — Wayland status bar. The setup used a modular left/center/right layout with modules for audio, network/Bluetooth, battery, clock, system metrics, workspace indicators, and a tray/notification area. Tokens in `tokens/` centralized colors and spacing.
- **Mako** — notification daemon. It received system notifications and displayed them according to its profile, with related blur settings in the old Hyprland config. It was started via `exec-once = mako`.

## Legacy Waybar modules (what they did)

These modules are documented for reference while the Waybar config is retained:

- `audio` — shows current output device and volume (requires PipeWire / wpctl / playerctl).
- `battery` — displays battery state and percentage.
- `clock` — time and date.
- `connections` — network / Bluetooth status (integration with `nm-applet` / blueman expected).
- `distro` — small launcher/embed for apps.
- `groups` — logical grouping used in left/right sections (e.g., distro, storage, system).
- `idle-ihibitor` — indicates idle inhibitions; used by media apps to prevent screen sleep.
- `power-profiles-daemon` — toggle power profiles (Saver / Balance / Performance).
- `storage` / `system` — disk usage, CPU, RAM, temps.
- `tray-notif` — tray area + notification center (SwayNC or similar).
- `workspace` (hyprland/workspaces) — shows Hyprland workspaces and active windows.

## Installation notes

To use these configs on your Fedora system (example):

1. Ensure the following programs are installed (package names may vary by distro):

- `hyprland` : https://wiki.hypr.land/Getting-Started/Installation/#packages | https://copr.fedorainfracloud.org/coprs/lionheartp/Hyprland
- `noctalia` : https://noctalia.dev/ (Wayland desktop shell — bar, launcher, notifications)
- `kitty`
- `fish`
- `hyprpaper` (optional)
- `hyprshot`
- `pipewire` / `pipewire-pulse` (or PulseAudio compatibility)
- `playerctl`, `wpctl`, `nm-applet`, `blueman` (optional integrations)

Optional, only if you want to reproduce the legacy setup:

- `rofi`
- `waybar`
- `mako`

2. Ensure that the following fonts are installed:

- `JetBrainsMono Nerd Font`: https://www.nerdfonts.com/font-downloads

3. Start or restart Hyprland (log out / log in) to pick up the new config. The current Hyprland config starts Noctalia automatically.

## Customization pointers

- **Launcher, bar, notifications:** configure them inside Noctalia (typically `~/.config/noctalia/settings.json`).
- **Colors & tokens (legacy Waybar):** edit files under [.config/waybar/tokens/](.config/waybar/tokens/) and [.config/waybar/style.css](.config/waybar/style.css).
- **Launcher visuals (legacy Rofi):** tweak [.config/rofi/config.rasi](.config/rofi/config.rasi).
- **Keybindings, autostart, and workspace rules:** edit [.config/hypr/hyprland.lua](.config/hypr/hyprland.lua).

## Credits

The current setup combines Hyprland, Noctalia, Kitty, and Hyprpaper with custom theming. The earlier Hyprland + Rofi + Waybar + Mako configuration is preserved here as a reference. See each project's documentation for deeper customization options.

## Cloud connections

In this case I'm using rclone with the command I mount the connection that I created called Onedrive:
rclone mount Onedrive: ~/Onedrive --daemon

---

Updated: documentation for the `.config` folder, reflecting the move to Hyprland + Noctalia.
