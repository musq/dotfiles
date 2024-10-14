# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Read the INVOCATION section in `man bash` to learn how bash executes
# its startup files.

# Bash startup sequence summary (Non-Posix mode):
# - Interactive Login Shell:
#   - Bash reads ~/.bash_profile, ~/.bash_login, ~/.profile in that order
#   - So ensure ~/.bash_profile and ~/.bash_login must not exist if we
#     want bash to execute ~/.profile
#   - During exit bash executes ~/.bash_logout if it exists
# - Interactive Non-Login Shell:
#   - Bash executes /etc/bash.bashrc and ~/.bashrc if they exist
# - Non-Interactive Shell:
#   - Bash executes the file mentioned in $BASH_ENV if it exists

# Bash startup sequence summary (Posix mode):
# If bash is invoked with the name sh, it tries to mimic the startup
# behavior of historical versions of sh as closely as possible, while
# conforming to the POSIX standard as well.
# - Interactive Login Shell:
#   - Bash executes /etc/profile and ~/.profile in that order
#   - Bash executes the file mentioned in $ENV if it exists
# - Non-Interactive Shell:
#   - Bash does not execute any startup file

# NOTE: As explained in bash startup sequence above, we must keep all
# the bash startup logic in ~/.bashrc and execute ~/.bashrc from here to
# cover both Login & Non-Login cases of Interactive Shell.

# If running bash...
if [ -n "$BASH_VERSION" ]; then
  # Execute .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi
