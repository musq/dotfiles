#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n ● Installs\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if cmd_exists "nix"; then
    ./nix/main.sh "$@"
else
    "./$(get_os)/main.sh" "$@"
fi
