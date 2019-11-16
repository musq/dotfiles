#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_assh_local() {

    declare -r FILE_PATH="$HOME/.ssh/assh.local.yml"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then

        mkdir -p "$(dirname "$FILE_PATH")"

        printf "%s" \
"templates:
  # Templates are similar to Hosts; you can inherit from them
  # but you cannot ssh to a template
  forward-gpg:
    # Remote-Socket -> gpgconf --list-dir agent-socket
    # Local-Socket  -> gpgconf --list-dir agent-extra-socket
    RemoteForward: Remote-Socket Local-Socket
  forward-ssh:
    ForwardAgent: yes

hosts:

#  example:
#    HostName: example.com
#    User: johndoe
#    ControlMaster: auto
#    Inherits:
#    - forward-gpg
#    - forward-ssh
#    - low-security" \
        > "$FILE_PATH"

    fi

    print_result $? "$FILE_PATH"

}

create_bash_local() {

    declare -r FILE_PATH="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then

        mkdir -p "$(dirname "$FILE_PATH")"

        printf "%s" \
"#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -" \
        > "$FILE_PATH"

    fi

    print_result $? "$FILE_PATH"

}

create_gitconfig_local() {

    declare -r FILE_PATH="$HOME/.config/git/config.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skipQuestions=false

    skip_questions "$1" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then

        mkdir -p "$(dirname "$FILE_PATH")"

        print_in_cyan "\n   Setting up Git local config...\n\n"

        defaultName=$( git config --global user.name )
        defaultEmail=$( git config --global user.email )

        print_in_yellow "   (Press ENTER to continue with [default], or type a new value and then press ENTER)\n"

        tmpName=""
        tmpEmail=""

        if ! "$skipQuestions"; then
            ask "Name:  [$defaultName] "
            tmpName="$(get_answer)"

            ask "Email: [$defaultEmail] "
            tmpEmail="$(get_answer)"
        fi

        printf "%s" \
"[user]
    name = ${tmpName:-$defaultName}
    email = ${tmpEmail:-$defaultEmail}
    # signingkey =

[gpg]
    # program = gpg2

[commit]
    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    # gpgsign = true" \
        > "$FILE_PATH"

    fi

    print_result $? "$FILE_PATH"

}

create_gpg_conf_local() {

    declare -r FILE_PATH="$HOME/.gnupg/gpg.conf.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then

        mkdir -p "$(dirname "$FILE_PATH")"

        printf "%s" \
"# If you have more than 1 secret key in your keyring, you may want to
# uncomment the following option and set your preferred keyid.

#default-key 0x12345678ABCD


# If you do not pass a recipient to gpg, it will ask for one.  Using
# this option you can encrypt to a default key.  Key validation will
# not be done in this case.  The second form uses the default key as
# default recipient.

#default-recipient some-user-id
#default-recipient-self


# Group names may be defined like this:
#   group mynames = paige 0x12345678 joe patti
#
# Any time 'mynames' is a recipient (-r or --recipient), it will be
# expanded to the names 'paige', 'joe', and 'patti', and the key ID
# '0x12345678'.  Note there is only one level of expansion - you
# cannot make an group that points to another group.  Note also that
# if there are spaces in the recipient name, this will appear as two
# recipients.  In these cases it is better to use the key ID.

#group mynames = paige 0x12345678 joe patti" \
        > "$FILE_PATH"

    fi

    print_result $? "$FILE_PATH"

}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.config/vim/vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then

        mkdir -p "$(dirname "$FILE_PATH")"

        printf "%s" \
"\" ----------------------------------------------------------------------
\" | Plugins - nvim-python                                              |
\" ----------------------------------------------------------------------

\" Set the path to the python executables

let g:python3_host_prog = '$HOME/.local/share/nvim/pynvim/bin/python3'" \
        > "$FILE_PATH"

    fi

    print_result $? "$FILE_PATH"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n ● Create local config files\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    create_assh_local
    create_bash_local
    create_gitconfig_local "$@"
    create_gpg_conf_local
    create_vimrc_local

}

main "$@"
