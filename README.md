# LinuxFedoraConfig

This repository contains a curated set of Wayland desktop configuration files for Fedora, focused on a compact Hyprland-based setup. The configs live under `.config` and cover the compositor, wallpaper daemon, terminal, launcher, and a customized Waybar status bar.

## Overview

- **Compositor:** Hyprland — configured in [.config/hypr/hyprland.conf](.config/hypr/hyprland.conf).
- **Wallpaper daemon:** Hyprpaper — wallpaper settings are in [.config/hypr/hyprpaper.conf](.config/hypr/hyprpaper.conf) and it's autostarted from Hyprland.
- **Terminal:** Kitty — main terminal configuration is in [.config/kitty/kitty.conf](.config/kitty/kitty.conf).
- **Launcher / Menu:** Rofi — theming and layout in [.config/rofi/config.rasi](.config/rofi/config.rasi). Hyprland points `$menu` to a rofi drun configuration.
- **Status bar:** Waybar — main entry is [.config/waybar/config.jsonc](.config/waybar/config.jsonc); style and tokens live in the same folder.

## Key files and where to edit

- Hyprland config: [.config/hypr/hyprland.conf](.config/hypr/hyprland.conf)
	- Defines keybindings, workspaces, autostart (eg. `exec-once = waybar & hyprpaper`), variables for `kitty`, `rofi`, and other programs.
- Hyprpaper wallpaper: [.config/hypr/hyprpaper.conf](.config/hypr/hyprpaper.conf)
- Kitty terminal: [.config/kitty/kitty.conf](.config/kitty/kitty.conf)
- Rofi theme / menu: [.config/rofi/config.rasi](.config/rofi/config.rasi)
- Waybar configuration: [.config/waybar/config.jsonc](.config/waybar/config.jsonc)
	- Visual styling: [.config/waybar/style.css](.config/waybar/style.css)
	- Module files: [.config/waybar/modules/](.config/waybar/modules/) (audio, battery, clock, connections, distro, groups, idle-ihibitor, power-profiles-daemon, storage, system, tray-notif, workspace)
	- CSS tokens (variables): [.config/waybar/tokens/](.config/waybar/tokens/)

## Programs used and purpose

- Hyprland — a tiling Wayland compositor. Configured here for multi-monitor layouts, animations, gaps, workspace rules, and keybinds. The config sets convenience variables such as `$terminal = kitty` and `$menu = rofi -show drun`.
- Hyprpaper — lightweight wallpaper daemon used to set per-monitor wallpapers and integrated via Hyprland autostart.
- Kitty — GPU-accelerated terminal emulator; the `kitty.conf` included here customizes fonts, colors, and behavior.
- Rofi — application launcher and window switcher; `config.rasi` contains theme colors, sizes, and behavior to match the desktop style.
- Waybar — Wayland status bar; the setup uses a modular layout (left/center/right) and includes modules for audio, network/bluetooth, battery, clock, system metrics, workspace indicators, and a tray/notification area. Tokens in `tokens/` centralize colors and spacing.

## Waybar modules (what they do)

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
- `hyprpaper`
- `kitty`
- `rofi`
- `waybar`
- `hyprshot`
- `pipewire` / `pipewire-pulse` (or PulseAudio compatibility)
- `playerctl`, `wpctl`, `nm-applet`, `blueman` (optional integrations)

2. Ensure that the following fonts are installed:
- `JetBrainsMono Nerd Font`: https://www.nerdfonts.com/font-downloads

3. Start or restart Hyprland (log out / log in) to pick up the new config. Hyprland's `exec-once` will start Waybar and Hyprpaper automatically if present.

## Customization pointers

- Colors & tokens: edit files under [.config/waybar/tokens/](.config/waybar/tokens/) and [.config/waybar/style.css](.config/waybar/style.css).
- Launcher visuals: tweak [.config/rofi/config.rasi](.config/rofi/config.rasi).
- Keybindings, autostart, and workspace rules: edit [.config/hypr/hyprland.conf](.config/hypr/hyprland.conf).

## Credits

This setup combines Hyprland, Hyprpaper, Kitty, Rofi, and Waybar with custom theming. See individual project documentation for deeper customization options.

---
Updated: generated documentation for the `.config` folder in this repository.
