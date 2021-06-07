#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_directories() {

    declare -a DIRECTORIES=(
        "$HOME/.cache/vim/autoload"
        "$HOME/.cache/vim/backups"
        "$HOME/.cache/vim/plugged"
        "$HOME/.cache/vim/swaps"
        "$HOME/.cache/vim/undos"
        "$HOME/.config"
        "$HOME/.credentials"
        "$HOME/.local/share/vim"
        "$HOME/.local/share/nvim/backups"
        "$HOME/.local/share/nvim/plugged"
        "$HOME/.local/share/nvim/swaps"
        "$HOME/.local/share/nvim/undos"
        "$HOME/.ssh/sockets"
        "$HOME/bin"
        "$HOME/projects"
    )

    for i in "${DIRECTORIES[@]}"; do
        mkd "$i"
    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n ● Create directories\n\n"

    create_directories

}

main
