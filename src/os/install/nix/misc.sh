#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nix_install "Alacritty" "nixpkgs.alacritty" "$@"
nix_install "Filezilla" "nixpkgs.filezilla" "$@"
nix_install "Grip" "nixpkgs.python37Packages.grip" "$@"
nix_install "Meld" "nixpkgs.gnome3.meld" "$@"
nix_install "mpv" "nixpkgs.mpv" "$@"
nix_install "Zathura" "nixpkgs.zathura" "$@"
nix_install "Redshift" "nixpkgs.redshift" "$@"
nix_install "Sxiv" "nixpkgs.sxiv" "$@"
