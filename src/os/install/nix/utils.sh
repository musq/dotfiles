#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

backup_current_generation() {

    local path="$HOME/.nix-generation-old"

    local generation=$(nix-env --list-generations \
            | grep "current" \
            | awk '{print $1}')

    execute \
        "echo $generation > $path" \
        "Store current generation ($generation) in $path"

}

nix_build() {

    declare -r FULL_INSTALL="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if [ "$FULL_INSTALL" == "no" ]; then
        print_warning "$PACKAGE_READABLE_NAME"
    else

        execute \
            "nix-build --no-out-link \"<nixpkgs>\" -A $PACKAGE" \
            "$PACKAGE_READABLE_NAME"

    fi

}

nix_collect_garbage() {

    # Delete all the store directories which are not being used
    # in any other profiles or generations

    execute \
        "nix-store --gc" \
        "Collect garbage"

}

nix_install() {

    declare -r FULL_INSTALL="$3"
    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    local installedFlag="$(nix-env -qasA $PACKAGE | cut -c1)"

    if [ "$installedFlag" == "I" ]; then
        print_success "$PACKAGE_READABLE_NAME"
    else

        if [ "$FULL_INSTALL" == "no" ]; then
            print_warning "$PACKAGE_READABLE_NAME"
        else

            execute \
                "nix-env --install --attr $PACKAGE" \
                "$PACKAGE_READABLE_NAME"

        fi

    fi

}

nix_optimize() {

    # Reduce Nix storage space by hard linking identical files

    execute \
        "nix-store --optimise" \
        "Optimize nix store"

    nix_collect_garbage

}

update() {

    # Resynchronize the Nix expressions of all subscribed channels.

    execute \
        "nix-channel --update" \
        "Nix (update)"

}

upgrade() {

    # Install the newest versions of all packages installed.

    # List down the attribute names of all the packages which are found
    # in this directory

    if [ $(cmd_version grep) == "gnu" ]; then
        local packages=$(grep -r "nix_install " \
            | cut -d "\"" -f4 \
            | grep "nixpkgs" \
            | sed -e :a -e ';$!N;s/\n/ /;ta')
    else
        local packages=$(grep -R "nix_install " . \
            | cut -d "\"" -f4 \
            | grep "nixpkgs" \
            | sed -e :a -e ';$!N;s/\n/ /;ta')
    fi

    execute \
        "nix-env --upgrade -A $packages" \
        "Nix (upgrade)"

}
