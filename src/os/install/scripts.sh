#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

save_script() {

    local -r name="$1"
    local -r url="$2"

    local -r path="$HOME/bin/$name"

    execute \
        "wget -qO $path $url &> /dev/null \
            && chmod +x $path" \
        "$name"

}

main() {

    print_in_purple "\n   Scripts\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    save_script "fzf-tmux" \
        "https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux"

    save_script "git-icdiff" \
        "https://raw.githubusercontent.com/jeffkaufman/icdiff/master/git-icdiff"

}

main
