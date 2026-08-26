#!/usr/bin/env bash
# Warns on low battery for the laptop and any BlueZ device exposing battery (headphones, mice, etc)

THRESHOLD_LOW=20
THRESHOLD_CRIT=10

for dev in $(upower -e); do
    echo "$dev" | grep -qE "line_power|DisplayDevice" && continue

    info=$(upower -i "$dev")
    percentage=$(echo "$info" | awk -F': *' '/percentage/ {gsub("%","",$2); print $2}')
    state=$(echo "$info" | awk -F': *' '/state/ {print $2}')
    [ -z "$percentage" ] && continue

    name=$(echo "$dev" | sed -E 's|.*/devices/||; s/_/ /g')

    if [ "$state" = "discharging" ]; then
        if [ "$percentage" -le "$THRESHOLD_CRIT" ]; then
            notify-send -u critical -i battery-caution "Low battery: $name" "${percentage}% remaining"
        elif [ "$percentage" -le "$THRESHOLD_LOW" ]; then
            notify-send -u normal -i battery-low "Battery low: $name" "${percentage}% remaining"
        fi
    fi
done
