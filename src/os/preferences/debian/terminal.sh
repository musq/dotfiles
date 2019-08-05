#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_custom_profile() {

    local DCONF_DIR="/org/gnome/terminal/legacy/profiles:"

    local PROFILE_NAME="dotfiles"

    local regex="/\[:[a-z0-9-]+\]/||/visible-name='$PROFILE_NAME'/"
    #            └─ extract only the UUIDs and the required visible-name line

    local UUID=($(dconf dump /org/gnome/terminal/legacy/profiles:/ |\
                    awk $regex |\
                    tac |\
                #   └─ revert the list
                    sed -n '/visible/ {n;p}' |\
                #   └─ Output the line next to visible-name=
                    cut -c 3-38))
                #   └─ Cut out the UUID

    ask_for_confirmation "'$PROFILE_NAME' profile already exists, would you like to skip this part?"

    if answer_is_yes; then
        return 1
    fi

    print_in_yellow "\n   (Press ENTER to continue with [default], or type a new value and then press ENTER)\n"

    ask "New profile name: [$PROFILE_NAME] "

    PROFILE_NAME=${get_answer:-$PROFILE_NAME}

    local regex="/\[:[a-z0-9-]+\]/||/visible-name='$PROFILE_NAME'/"
    #            └─ extract only the UUIDs and the required visible-name line

    local UUID=($(dconf dump /org/gnome/terminal/legacy/profiles:/ |\
                    awk $regex |\
                    tac |\
                #   └─ revert the list
                    sed -n '/visible/ {n;p}' |\
                #   └─ Output the line next to visible-name=
                    cut -c 3-38))
                #   └─ Cut out the UUID

    while [ ! -z $UUID ]; do
        ask_for_confirmation "'$PROFILE_NAME' already exists, do you want to overwrite it?"

        if answer_is_yes; then
            break
        else

            ask "Enter a different name: "
            PROFILE_NAME="$(get_answer)"

            while [ -z $PROFILE_NAME ]; do
                ask "Name cannot be empty: "
                PROFILE_NAME="$(get_answer)"
            done

            local regex="/\[:[a-z0-9-]+\]/||/visible-name='$PROFILE_NAME'/"
            #            └─ extract only the UUIDs and the required visible-name line

            local UUID=($(dconf dump /org/gnome/terminal/legacy/profiles:/ |\
                            awk $regex |\
                            tac |\
                        #   └─ revert the list
                            sed -n '/visible/ {n;p}' |\
                        #   └─ Output the line next to visible-name=
                            cut -c 3-38))
                        #   └─ Cut out the UUID
        fi

    done

    # Reset the existing profile
    # This will not delete the profile, only reset it to defaults
    # and name it 'Unnamed'
    dconf reset -f $DCONF_DIR/:$UUID/

    # Generate a random UUID
    UUID=$(uuidgen)

    local profile_ids=($(dconf list $DCONF_DIR/ |\
                        grep ^: |\
                        sed 's/\///g' |\
                        sed 's/://g'))

    # If some profiles already exist, define a delimiter
    [ ${#profile_ids[@]} -gt 0 ] &&\
        local delimiter=","

    dconf write "$DCONF_DIR/list" \
        "$(dconf read "$DCONF_DIR"/list | tr -d ']')${delimiter} '$UUID']"
        #  │                                         └─ add a demiliter, if necessary
        #  └─ extract the existing list

    dconf write "$DCONF_DIR/:$UUID/visible-name" "'$PROFILE_NAME'"

    dconf write "$DCONF_DIR/:$UUID/use-theme-colors" "false"
    dconf write "$DCONF_DIR/:$UUID/use-theme-transparency" "false"
    dconf write "$DCONF_DIR/:$UUID/use-system-font" "false"

    dconf write "$DCONF_DIR/:$UUID/background-color" "'rgb(38,38,38)'"
    dconf write "$DCONF_DIR/:$UUID/foreground-color" "'rgb(187,187,187)'"
    dconf write "$DCONF_DIR/:$UUID/palette" "['rgb(0,0,0)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']"

    dconf write "$DCONF_DIR/:$UUID/font" "'Ubuntu Mono 15'"

    dconf write "$DCONF_DIR/:$UUID/allow-bold" "true"
    dconf write "$DCONF_DIR/:$UUID/bold-color-same-as-fg" "true"
    dconf write "$DCONF_DIR/:$UUID/bold-color" "'rgb(170,29,29)'"

    dconf write "$DCONF_DIR/:$UUID/use-transparent-background" "false"
    dconf write "$DCONF_DIR/:$UUID/background-transparency-percent" "0"

    dconf write "$DCONF_DIR/:$UUID/login-shell" "true"
    dconf write "$DCONF_DIR/:$UUID/rewrap-on-resize" "true"
    dconf write "$DCONF_DIR/:$UUID/scroll-on-output" "true"

    dconf write "$DCONF_DIR/default" "'$UUID'"
    print_success "'$PROFILE_NAME' set as default profile"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n   Terminal\n\n"

    create_custom_profile
}

main
