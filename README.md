# Ashish's Dotfiles

This repo is carefully designed to be declarative, reproducible, and idempotent!

Tools used:

- GNU Stow
- Homebrew
- Bash

## Setup

- Install Homebrew

  - Run installation script from <https://brew.sh>
  - Follow the output in terminal carefully when running the above installation script

- Install `git` using your OS' software manager, if not already present

- Install Nerd Fonts
  - Download `IosevkaTerm.tar.xz` from <https://github.com/ryanoasis/nerd-fonts/releases/latest>
  - Unpack `IosevkaTerm.tar.xz`
  - Install these fonts:
    - `IosevkaTermNerdFontMono-Light.ttf`
    - `IosevkaTermNerdFontMono-LightItalic.ttf`
    - `IosevkaTermNerdFontMono-Bold.ttf`
    - `IosevkaTermNerdFontMono-BoldItalic.ttf`

## Install

```sh
# Clone dotfiles repo
git clone https://github.com/musq/dotfiles.git ~/dotfiles

# Go inside dotfiles directory
cd ~/dotfiles

# Switch to origin/linux branch if your device is running Linux
# origin/main branch is for MacOS
# git switch linux

# Run dotfiles setup script
./entrypoint.sh

# NOTE: In case of issues, resolve errors manually, then rerun ./entrypoint.sh
# NOTE: It is absolutely safe to run ./entrypoint.sh multiple times!
```

## Post Install

### Common

- Set `user.email` in git `~/.config/git/config.local`
- Add keys in GnuPG
  - Fetch Ashish's public keys: `curl -L tug.ro/key | gpg --import`
  - Save Ashish's private keys into ~/.gnupg/private-keys-v1.d/, from you know where :)
- Setup Pass: `git clone https://git.sr.ht/~musq/... ~/.password-store`
- Keyboard: Make <kbd>CapsLock</kbd> behave as <kbd>Control</kbd> key
- Keyboard: Set appropriate key repeat rate and key delay until repeat rate
- Touchpad: Set appropriate tracking speed
- Menu Bar: Show battery percentage in Menu Bar
- Menu Bar: Show seconds in time in Menu Bar

### MacOS

- Change Login Shell from Zsh to Bash
  - Open `Users & Groups`
  - Right click on your account and click `Advanced Options`
  - Change `Login Shell` to `/opt/homebrew/bin/bash`

### Linux Mint

Install these tools using Linux Mint Software manager:

- Font-manager
- GnuPG (WARNING: We don't install GnuPG using Homebrew because it clashes with OS's GnuPG installed version)
- Alacritty
- Brave
- Sublime Text

_NOTE: Follow this guide to setup Linux Mint with Btrfs: <https://github.com/orgs/linuxmint/discussions/549>_

## License

[AGPL-3.0-or-later](/LICENSE)
