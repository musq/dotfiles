#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if cmd_exists "setxkbmap"; then

    execute "setxkbmap -option ctrl:nocaps" \
        "Map CapsLock key to Ctrl"

fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if cmd_exists "gsettings"; then

    execute "gsettings set com.canonical.indicator.bluetooth visible true" \
        "Show bluetooth icon in the menu bar"

    execute "gsettings set com.canonical.indicator.sound visible true" \
        "Show volume icon in the menu bar"

    execute "gsettings set com.canonical.indicator.power show-time false" \
        "Hide time left in battery in the menu bar"

    execute "gsettings set com.canonical.indicator.datetime custom-time-format '%a %b %d %l:%M:%S %p' && \
            gsettings set com.canonical.indicator.datetime time-format 'custom'" \
        "Use custom date format in the menu bar"

    execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
        "Set desktop background image options"

    execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us', 'ro' ]\"" \
        "Set keyboard languages"

    execute "gsettings set com.canonical.Unity.Launcher favorites \"[
                'ubiquity-gtkui.desktop',
                'nautilus-home.desktop'
            ]\"" \
        "Set Launcher favorites"

fi
