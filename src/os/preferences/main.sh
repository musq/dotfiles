#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n ● Preferences\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

isDesktop="$1"

if "$isDesktop"; then

    "./$(get_os)/main.sh"

else

    printf "\n"
    print_warning "Don't set up desktop preferences because this is a server"

fi
