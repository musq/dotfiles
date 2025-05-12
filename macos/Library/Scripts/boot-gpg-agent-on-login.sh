#!/bin/sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# First define functions to be used as utils
. "$HOME/.bash_utils"

# Setup Homebrew env variables (e.g. HOMEBREW_PREFIX) to be used in the
# subsequent scripts
case "$(current_os)" in
linux)
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	;;
macos)
	eval "$(/opt/homebrew/bin/brew shellenv)"
	;;
esac

# Boot and setup gpg-agent
. "$HOME/.profile.d/gpg.sh"
