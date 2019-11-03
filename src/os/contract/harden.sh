#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_permissions() {

    local -r path="$1"

    # CRITICAL: change permissions of the folder and contents
    mkdir -p "$path"

    # Own the folder
    chown -R "$(whoami)" "$path"

    # Make all files inside rw-------
    find "$path" -maxdepth 2 -type f -exec chmod 600 {} ';'

    # Make all directories inside rwx------
    find "$path" -maxdepth 2 -type d -exec chmod 700 {} ';'

    # Make folder rwx------
    chmod 700 "$path"

    print_result "$?" "Set strict permission of $path"

}

main() {

    set_permissions "$HOME/.credentials"
    set_permissions "$HOME/.gnupg"
    set_permissions "$HOME/.ssh"

}

main
