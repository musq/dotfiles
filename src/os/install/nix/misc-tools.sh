#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

nix_install "assh" "nixpkgs.assh"
nix_install "bat" "nixpkgs.bat"
nix_install "Buku" "nixpkgs.buku"
nix_install "cmus" "nixpkgs.cmus"
nix_install "hub" "nixpkgs.gitAndTools.hub"
nix_install "Icdiff" "nixpkgs.icdiff"
nix_install "imgcat" "nixpkgs.imgcat"
nix_install "mdcat" "nixpkgs.mdcat"
nix_install "ncdu" "nixpkgs.ncdu"
nix_install "Prettyping" "nixpkgs.prettyping"
nix_install "Tmux" "nixpkgs.tmux"
nix_install "watchexec" "nixpkgs.watchexec"
nix_install "Xclip" "nixpkgs.xclip"
