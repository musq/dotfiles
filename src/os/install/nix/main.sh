#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Nix\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

isDesktop="$1"

full="no"

if "$isDesktop"; then
    full="yes"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

backup_current_generation
update
upgrade

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./build-essentials.sh "$full"

./browsers.sh "$full"
./downloaders.sh
./editors.sh
./fonts.sh "$full"
./git.sh
./misc.sh "$full"
./misc-tools.sh "$full"
./navigators.sh
./python.sh

./../helpers.sh
./../scripts.sh

./cleanup.sh
