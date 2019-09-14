#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/aliases/bash_aliases"
        "shell/autocomplete/bash_autocomplete"
        "shell/bash_exports"
        "shell/bash_functions"
        "shell/bash_logout"
        "shell/bash_options"
        "shell/bash_profile"
        "shell/bash_prompt"
        "shell/bashrc"
        "shell/colors/bash_colors"
        "shell/curlrc"
        "shell/inputrc"
        "shell/profile.d"
        "shell/wgetrc"

    )

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        create_symlink "$sourceFile" "$targetFile" "$@"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_full_path_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "config/alacritty/alacritty.yml"
        "config/bat.conf"
        "config/cmus/onedark-alt.theme"
        "config/cmus/rc"
        "config/git/attributes"
        "config/git/commit-template"
        "config/git/config"
        "config/git/ignore"
        "config/nvim/init.vim"
        "config/redshift.conf"
        "config/tmux/tmux.conf"
        "config/vim/vimrc"

        "gnupg/gpg.conf"
        "gnupg/gpg-agent.conf"

        "ssh/assh.yml"

    )

    local i=""
    local sourceFile=""
    local targetFile=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$i"

        create_symlink "$sourceFile" "$targetFile" "$@"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n ● Create symbolic links\n\n"

    create_symlinks "$@"
    create_full_path_symlinks "$@"

}

main "$@"
