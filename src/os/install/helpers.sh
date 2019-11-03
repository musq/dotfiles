#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_neovim_python() {

    local -r path="$HOME/.local/share/nvim/pynvim"

    # shellcheck disable=SC2230
    local pythonPath="$(which python3)"

    if [ -x "/usr/bin/python3" ]; then
        pythonPath="/usr/bin/python3"
    elif [ -x "/usr/local/bin/python3" ]; then
        pythonPath="/usr/local/bin/python3"
    fi

    execute \
        "$pythonPath -m venv $path \
            && $path/bin/pip install neovim" \
        "Neovim helper"

}

install_tmux_plugin_manager() {

    local -r path="$HOME/.cache/tmux/plugins/tpm"
    local -r tmuxConfig="$HOME/.config/tmux/tmux.conf"

    execute \
        "rm -rf $path \
            && mkdir -p $path \
            && git clone https://github.com/tmux-plugins/tpm $path" \
        "Tmux Plugin Manager"

    execute \
        "tmux -f $tmuxConfig new -d -s tpm \
            && tmux send-keys -t tpm.1 \". $path/bindings/install_plugins && exit\" ENTER" \
        "Tmux plugins"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Helpers\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_neovim_python
    install_tmux_plugin_manager

}

main
