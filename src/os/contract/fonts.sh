#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_fonts_locally() {

    skipQuestions=false

    skip_questions "$1" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    local -r message="Activate downloaded fonts"
    local -r sourcePath="$HOME/.nix-profile/share/fonts"

    local -r kernel="$(get_os_kernel)"

    if [ "$kernel" == "Darwin" ]; then
        local -r targetPath="$HOME/Library/Fonts"
    else
        local -r targetPath="$HOME/.local/share/fonts"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ -d "$sourcePath" ]; then

        execute \
            "cp -f "$sourcePath"/*/* "$targetPath" \
                && fc-cache -v" \
            "$message"

    else

        print_error "$message"
        return 1

    fi

}

main() {

    copy_fonts_locally

}

main
