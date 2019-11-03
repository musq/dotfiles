#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Build Essentials\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nix_build "glibcLocales" "glibcLocales"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nix_install "Bash v5" "nixpkgs.bash_5"
nix_install "Coreutils" "nixpkgs.coreutils-full"
nix_install "GnuPG" "nixpkgs.gnupg"
nix_install "Less" "nixpkgs.less"
nix_install "Perl" "nixpkgs.perl"

case "$(get_os_kernel)" in
    Darwin)
        nix_install "Pinentry (GnuPG)" "nixpkgs.pinentry_mac" "$@"
        ;;
    Linux)
        nix_install "Pinentry" "nixpkgs.pinentry" "$@"
        ;;
esac
