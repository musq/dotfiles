#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

init_backup() {

    local -r BACKUP_HOME="$HOME/.backups/dotfiles-backup"

    mkdir -p "$BACKUP_HOME"

    # get the version
    LAST_VERSION=$(
        find "$BACKUP_HOME" -iname 'v[[:alnum:]]*' \
        -type d | \
        sed "s/.*\///" | \
        cut -c 2- | \
        sort -n | \
        tail -1
    )

    CURRENT_VERSION=$((LAST_VERSION + 1))

    BACKUP_DIR="$BACKUP_HOME/v$CURRENT_VERSION"

    mkd "$BACKUP_DIR" \
        || ( print_error "Failed to create backup directory" && exit 1 )

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_backup() {

    local files=$(find_files_to_backup "create_symlinks()")

    for i in $files; do

        sourceFile="$HOME/.$(printf "%s" "$i" \
            | sed "s/\"//g" \
            | sed "s/.*\/\(.*\)/\1/g")"

        targetFile="$BACKUP_DIR/.$(printf "%s" "$i" \
            | sed "s/\"//g" \
            | sed "s/.*\/\(.*\)/\1/g")"

        copy_file "$sourceFile" "$targetFile"

    done


    local files=$(find_files_to_backup "create_full_path_symlinks()")

    for i in $files; do

        sourceFile="$HOME/.$(printf "%s" "$i" \
            | sed "s/\"//g")"

        targetFile="$BACKUP_DIR/.$(printf "%s" "$i" \
            | sed "s/\"//g")"

        copy_file "$sourceFile" "$targetFile"

    done

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_file() {

    if [[ -e "$1" && ! -L "$1" ]]; then

        mkdir -p "$(dirname "$2")"

        # If the source file is not a symlink, take a backup
        execute \
            "cp -a $1 $2" \
            "$1 → $2" \
            || print_error "$1 → $2"

    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

find_files_to_backup() {

    local -r mark="$1"

    local files=$(sed -n "/$mark/,/)$/p" create_symbolic_links.sh \
        | grep "^\ *\".*\"$" \
        | sed -e :a -e ';$!N;s/\n/ /;ta')

    printf "%s" "$files"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

finish_backup() {

    # https://unix.stackexchange.com/questions/8430/how-to-remove-all-empty-directories-in-a-subtree
    find "$BACKUP_DIR" -type d -empty -delete > /dev/null 2>&1

    # The following rmdir command is added as hack to delete the topmost
    # directory on MacOS. The exact bug is mentioned in the link.
    # https://unix.stackexchange.com/questions/497666/relative-path-potentially-not-safe-error-with-find-delete-on-macos
    rmdir "$BACKUP_DIR" > /dev/null 2>&1

    if [ -d "$BACKUP_DIR" ]; then
        print_success "Backup created successfully"
    else
        print_success "Backup is not needed, hence v$CURRENT_VERSION has been deleted"
    fi

}

main() {

    print_in_purple "\n ● Create backup\n\n"

    init_backup
    create_backup
    finish_backup

}

main
