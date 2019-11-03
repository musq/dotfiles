#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

export GPG_TTY=$(tty)

unset SSH_AGENT_PID

# A Desktop contains private keys
# A Server does not contain private keys. It uses ssh-agent/gpg-agent to
# borrow keys for a temporary duration
#
# Set SSH_AUTH_SOCK only if sshcontrol file contains a keygrip
# It indicates that the current system is a desktop and not a server

if [ -e "$HOME/.gnupg/sshcontrol" ] \
    && egrep -q "^[ ]*[0-9A-Z]{40}" "$HOME/.gnupg/sshcontrol" \
    && [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then

    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

fi

gpg-connect-agent updatestartuptty /bye >/dev/null
