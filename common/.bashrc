#!/usr/bin/env bash

# ~/.bashrc: executed by bash(1) for non-login shells.

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# NOTE: File sourcing order is critical here

# First define functions to be used as utils
. "$HOME/.bash_utils"

# Then source custom scripts
for script in "$HOME/.profile.d"/*.sh; do
	if [ -r "$script" ]; then
		# shellcheck disable=SC1090
		. "$script"
	fi
done
unset script

# Then override any custom script settings with our version controlled
# settings
. "$HOME/.bash_exports" # Set environment variables
. "$HOME/.bash_options" # Set runtime options for the interactive shell
. "$HOME/.bash_aliases" # Set aliases to be used by user
. "$HOME/.bash_colors"  # Set colors

# Then bootstrap some tools
. "$HOME/.bash_tools"

# Finally override any previous settings with our ad-hoc local settings
# NOTE: bash.local is not version controlled
. "$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_warning " #####################"
print_warning " ##                 ##"
print_warning " ##  Welcome back!  ##"
print_warning " ##                 ##"
print_warning " #####################"
