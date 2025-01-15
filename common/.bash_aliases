#!/usr/bin/env bash

# NOTE: Remove all previous environment defined aliases
unalias -a

# =====================================================================
# Common
# =====================================================================

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cd..="cd .."

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

alias aliases="alias | cut -c7- | bat -l ini --style=plain"
alias c="clear -x"            # Soft clear screen (keep scrollback)
alias cc="printf '\33c\e[3J'" # Hard clear screen (delete scrollback)

alias b="bat"
alias dfh='df -h $HOME'

alias g="git"
alias gs="git s"

# NOTE: More git aliases are available as part of forgit
# https://github.com/wfxr/forgit#-features
# - ga:  Interactive 'git add' selector
# - glo: Interactive 'git log' viewer
# - gi:  Interactive '.gitignore' generator
# - gd:  Interactive 'git diff' viewer
# - grh: Interactive 'git reset HEAD <file>' selector
# - gcf: Interactive 'git checkout <file>' selector
# - gcb: Interactive 'git checkout <branch>' selector
# - gbd: Interactive 'git branch -D <branch>' selector
# - gct: Interactive 'git checkout <tag>' elector
# - gco: Interactive 'git checkout <commit>' selector
# - grc: Interactive 'git revert <commit>' selector
# - gss: Interactive 'git stash' viewer
# - gsp: Interactive 'git stash push' selector
# - gcp: Interactive 'git cherry-pick' selector
# - grb: Interactive 'git rebase -i' selector
# - grl: Interactive 'git reflog' viewer
# - gbl: Interactive 'git blame' selector
# - gfu: Interactive 'git commit --fixup && git rebase -i --autosquash' selector
# - gclean: Interactive 'git clean' selector

# Public IP
alias ipp="dig +short myip.opendns.com @resolver1.opendns.com"

alias l="less"
alias ll="eza --long --all --group --time=modified"
alias m="man"
alias p='python3'
alias path='printf "%b\n" "${PATH//:/\\n}"'
alias pc="pass-clip"
alias pf="passfzf"
alias please='sudo !!'
alias pping='prettyping --nolegend'
alias rg="rg --smart-case --colors 'line:fg:220,100,0' --colors 'match:bg:yellow' --colors 'match:fg:0,0,0' --colors 'match:style:nobold' --colors 'path:fg:0,180,180' --colors 'path:style:underline'"
alias rmf="rm -rf"

# Neovim
alias v="nvim"
alias vi="vi -u ~/.config/.vimrc"
alias vim="vim -u ~/.config/.vimrc"
# Keep a separate instance of lazyvim handy as 'vv'
# This would be helpful when the main nvim installation starts breaking
alias vv="NVIM_APPNAME=lazyvim nvim"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Docker

alias d="docker"
alias da="docker attach"
alias dc="docker compose"
alias ddt="pkill -9 -f 'docker.*attach'"
alias de="docker exec -ti"
alias dl="docker logs -fn 100"
alias dps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}\""
alias dr="docker restart"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# fzf

alias ff="fzf_find_edit"
alias ffg="fzf_grep_edit"
alias fr="fzf_find_recent_and_edit"

alias gpx="fzf_git_log_pickaxe"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# GPG

alias gpg='gpg --options $HOME/.gnupg/gpg.conf'

# Reload gpg-agent. This operation also helps forget keys in gpg-agent
alias gafk="gpg-connect-agent reloadagent /bye"
# List keys in gpg-agent
alias galk="gpg-connect-agent 'keyinfo --list' /bye"
# Kill any running gpg-agent that might be hung
alias gaka="gpgconf --kill gpg-agent"
# Reset tty in a tmux window
alias gat="gpg-connect-agent updatestartuptty /bye"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Tmux

# Specify tmux.conf location, since Tmux devs have decided not to
# support XDG specifications
# https://github.com/tmux/tmux/issues/142
alias tmux="tmux -f ~/.config/tmux.conf"

alias t="tmux"
alias ta="tmux attach"
alias tl="tmux ls"

# =====================================================================
# OS specific
# =====================================================================

case "$(current_os)" in
linux)
	# Add an "alert" alias for long running commands.
	# Usage: `sleep 10; alert`
	alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

	# Empty trash
	alias empty-trash="rm -rf ~/.local/share/Trash/files/*"

	# Local IP
	alias ipl="ifconfig \
            | grep 'inet addr' \
            | grep -v '127.0.0.1' \
            | cut -d: -f2 \
            | cut -d' ' -f1"

	# Enable color support
	if [ -x /usr/bin/dircolors ]; then
		test -r ~/.dircolors && (eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)")

		alias ls='ls --color=auto'
		alias dir='dir --color=auto'
		alias vdir='vdir --color=auto'
		alias grep='grep --color=auto'
		alias fgrep='fgrep --color=auto'
		alias egrep='egrep --color=auto'
	fi
	;;

macos)
	# Clear DNS cache
	alias clear-dns-cache="sudo dscacheutil -flushcache; \
                       sudo killall -HUP mDNSResponder"

	# Empty the trash, the main HDD and on all mounted volumes,
	# and clear Apple’s system logs to improve shell startup speed
	alias empty-trash="sudo rm -frv /Volumes/*/.Trashes; \
                   sudo rm -frv ~/.Trash; \
                   sudo rm -frv /private/var/log/asl/*.asl; \
                   sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

	# Local IP
	alias ipl="ipconfig getifaddr en0"

	# Enable color support
	alias ls="ls -G"
	;;
esac
