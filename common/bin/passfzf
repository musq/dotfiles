#!/usr/bin/env bash
# This script unlocks the pass tomb, if any, and then usess fzf to find
# passwords and copy, show, delete, rename and duplicate them, as well as
# to add or generate new passwords, and synchronize them (with git).
# Dependencies: fd, fzf, pass
# Optional dependencies: git, pass-tomb
# 
# MIT License
# 
# Copyright © [2022] Mathieu Laparie <mlaparie [at] disr [dot] it>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

store="$HOME/.password-store/"
swapfile="/swap/swapfile" # Set path to any swapfile not listed in /etc/fstab

# Open pass tomb, if any
if [[ -e "$HOME/.password.tomb" ]]; then
    sudo swapoff -a && sudo swapoff "${swapfile}" 2> /dev/null
    pass open 2> /dev/null
fi

# Select pass entry
main() {
    while :; do
        clear
        selection=$(fd .gpg ~/.password-store/ -d 8 \
                      | fzf --query "${tmp}" \
                            --prompt="# " \
                            --ansi \
                            --extended \
                            --no-border \
                            --with-nth 5.. \
                            --delimiter "/" \
                            --layout=reverse-list \
                            --no-multi \
                            --cycle \
                            --header='
Ret: copy, C-s: show, C-e: edit, C-r: rename, C-d: duplicate,
C-a: add, C-g: generate and copy new password, C-t: trash
C-p: git pull, M-p: git push, C-c/C-q/Esc: clear query or exit' \
                            --margin='1,2,1,2' \
                            --color='16,gutter:-1' \
                            --bind="tab:down" \
                            --bind="btab:up" \
                            --bind="ctrl-s:execute(echo 'show' > /tmp/passfzfarg)+accept" \
                            --bind="ctrl-e:execute(echo 'edit' > /tmp/passfzfarg)+accept" \
                            --bind="ctrl-r:execute(echo 'mv' > /tmp/passfzfarg)+accept" \
                            --bind="ctrl-d:execute(echo 'cp' > /tmp/passfzfarg)+accept" \
                            --bind="ctrl-a:execute(echo 'add' > /tmp/passfzfarg)+print-query" \
                            --bind="ctrl-g:execute(echo 'generate --clip' > /tmp/passfzfarg)+print-query" \
                            --bind="ctrl-t:execute(echo 'rm' > /tmp/passfzfarg)+accept" \
                            --bind="ctrl-p:abort+execute(echo 'git pull' > /tmp/passfzfarg)" \
                            --bind="alt-p:abort+execute(echo 'git push -u --all' > /tmp/passfzfarg)" \
                            --bind="ctrl-c:execute(echo 'quit' > /tmp/passfzfarg)+cancel" \
                            --bind="ctrl-q:execute(echo 'quit' > /tmp/passfzfarg)+cancel" \
                            --bind="esc:execute(echo 'quit' > /tmp/passfzfarg)+cancel")

        if [[ -f "/tmp/passfzfarg" ]]; then
            arg=$(cat /tmp/passfzfarg)
            rm /tmp/passfzfarg
        else
            arg="show --clip"
        fi

        if ! [[ -v "$selection" ]]; then
            clear
            case "$arg" in
                add)
                    printf "\033[0;32mNew password Directory/Name:\033[0m ${selection}"
                    if [[ -n "$selection" ]]; then
                        printf "\033[0;32m\nPress Return to confirm or type new Directory/Name:\033[0m "
                    fi
                    read -r
                    tmp="${REPLY:=$selection}"
                    pass ${arg} "${tmp}"
                    tmp="${selection:=$tmp}"
                    continue
                    ;;
                mv | cp)
                    tmp=${selection::-4} && tmp=${tmp#"$store"}
                    printf "\033[0;32m\nNew Directory/Name to ${arg} '${tmp}' to:\033[0m "
                    read -r
                    if [[ -n "$REPLY" ]]; then
                        pass ${arg} "${tmp}" "${REPLY}"
                    fi
                    tmp="${REPLY:=$tmp}"
                    continue
                    ;;
                "generate --clip")
                    printf "\033[0;32mNew password Directory/Name:\033[0m ${selection}"
                    if [[ -n "$selection" ]]; then
                        printf "\033[0;32m\nPress Return to confirm or type new Directory/Name:\033[0m "
                    fi
                    read -r
                    tmp="${REPLY:=$selection}"
                    printf "\033[0;32mNumber of characters:\033[0m "
                    read -r
                    pass ${arg} --in-place "${tmp}" "${REPLY}" \
                        2> /dev/null || pass ${arg} "${tmp}" "${REPLY}"
                    tmp="${selection:=$tmp}"
                    printf "\nPress any key to continue. "
                    read -rsn1
                    continue
                    ;;
                quit)
                    pkill -P $$
                    return
                    ;;
                *)
                    if [[ -n "$selection" ]]; then
                        tmp=${selection::-4} && tmp=${tmp#"$store"}
                        pass ${arg} "${tmp}"
                    else
                        pass ${arg}
                    fi
                    printf "\nPress any key to continue. "
                    read -rsn1
                    continue
                    ;;
            esac
        fi
    done
}

main

# Close pass tomb, if any
if [[ -e "$HOME/.password.tomb" ]]; then
    printf "\n"
    pass close
    sudo swapon -a && sudo swapon "${swapfile}" 2> /dev/null
fi

printf "\nPress any key to quit. " && read -rsn1
