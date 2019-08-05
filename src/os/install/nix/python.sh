#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Python\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nix_install "Pipenv" "nixpkgs.pipenv"
