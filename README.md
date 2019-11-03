# Ashish’s dotfiles

[![Travis](https://img.shields.io/travis/musq/dotfiles/master)](https://travis-ci.org/musq/dotfiles)
[![Version](https://img.shields.io/github/release/musq/dotfiles)](https://github.com/musq/dotfiles/releases/latest)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg)](https://github.com/RichardLitt/standard-readme)


These are the base configurations that I start with when I set up a
new environment.

`sudo` is **not required**.

---

**BEWARE** — This tool modifies your local configurations.
**Proceed with caution.**

**DO NOT** run the `setup.sh` script if you don't fully understand
[what it does](src/os/setup.sh).
Seriously, **DON'T**!

---

## Table of Contents

- [Background](#background)
- [Requirements](#requirements)
- [Install](#install)
  - [One-line installer](#one-line-installer)
  - [Manual](#manual)
  - [Update](#update)
  - [Non-Interactive](#non-interactive)
- [Screenshots](#screenshots)
- [Acknowledgements](#acknowledgements)
- [Contributing](#contributing)
- [License](#license)


## Background

Manually setting up a usable environment on a brand new machine is
always a tiring experience. I felt the need to create a tool which
would automate this process as smoothly as possible. It should ideally —

- Work without `sudo`
- Perform some hardening operations
- Install necessary tools
- Manage local configurations

It should also **follow these standards** —

- Bootstrap itself using only `wget` or `curl`
- Be idempotent
- Be easy to audit

## Requirements

This tool is only meant for Linux variants. It has been verified to
work on —

- Debian 9
- Ubuntu 16.04+
- MacOS Mojave+ (Nix might not work on some packages)

It is **strongly recommended** to use
[dotfiles-system](https://github.com/musq/dotfiles-system) to install
[`Nix`](https://nixos.org/nix) beforehand.

## Install

The setup process will:

- Download the dotfiles on your computer (by default it will suggest
`~/projects/dotfiles`)
- Take versioned [backup](src/os/create_backup.sh) of files that might
be changed and store them in `~/.backups/dotfiles-backup/v*`
- [Symlink](src/os/create_symbolic_links.sh) the [`config`](src/config),
[`gnupg`](src/gnupg), [`shell`](src/shell), and [`ssh`](src/ssh) files
- [Harden](src/os/contract/harden.sh) `ssh` and `gnupg` direcories
- [Install](src/os/install/nix) packages using `Nix`
- Set custom [`macOS`](src/os/preferences/macos),
[`Debian/Ubuntu`](src/os/preferences/debian) preferences
- Install [`fonts`](src/os/contract/fonts.sh),
[`tmux plugins`](src/os/install/helpers.sh), and
[`vim plugins`](src/os/contract/vim.sh)

### One-line installer


| Tool | Snippet |
|:---|:---|
| `wget` | `bash -c "$(wget -qO - https://raw.githubusercontent.com/musq/dotfiles/master/src/os/setup.sh)"` |
| `cURL` | `bash -c "$(curl -LsS https://raw.githubusercontent.com/musq/dotfiles/master/src/os/setup.sh)"` |


### Manual

```bash
# Clone this repo
git clone https://github.com/musq/dotfiles.git

# Go inside
cd dotfiles

# Run installer
./src/os/setup.sh
```

### Update

```bash
# Go inside the project repo
cd path/to/dotfiles

# Update git repo
git pull origin master

# Run installer
./src/os/setup.sh
```

### Non-Interactive

Pass `-y` or `--yes` to automatically answer yes to all the questions.

`./src/os/setup.sh -y`


## Screenshots

### Install in action

<img
    src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/install.gif"
    alt="Setup process in action"
    width="100%">

<br>

### Previews

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/fzf-cd.png" alt="Jump directory using fzf" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/git-b.png" alt="Detailed git branches list" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>Fuzzy directory jump</td>
            <td>List git branches</td>
        </td>
    </tbody>
</table>

<br>

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/git-l.png" alt="Git log" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/git-rf.png" alt="Git reflog" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>Git log</td>
            <td>Git reflog</td>
        </td>
    </tbody>
</table>

<br>

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/git-d.png" alt="Git diff (unified)" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/git-i.png" alt="Git icdiff (side-by-side)" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>Git diff (unified)</td>
            <td>Git icdiff (side-by-side)</td>
        </td>
    </tbody>
</table>

<br>

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/fzf_git_log.png" alt="Fuzzy git log with preview using fzf" width="100%">
            </td>
            <td>
                <img src="https://raw.githubusercontent.com/musq/assets/master/dotfiles/tmux.png" alt="Tmux" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>Fuzzy git log with preview</td>
            <td>Tmux</td>
        </td>
    </tbody>
</table>



## Acknowledgements

Inspiration and code were taken from many sources, including:

- [Cătălin's dotfiles](https://github.com/alrra/dotfiles)
- [Bluz71's dotfiles](https://github.com/bluz71/dotfiles)
- [Whiteinge's dotfiles](https://github.com/whiteinge/dotfiles)


## Contributing

Feel free to dive in!
[Open an issue](https://github.com/musq/dotfiles/issues/new)
or submit PRs.

See [contributing guidelines](CONTRIBUTING.md).

If you decide to **fork this project**, do not forget to substitute my
username with your own in the
[`one-line installer`](#one-line-installer) and in the
[`setup script`][setup line]

## License

- The code is available under [GNU GPL v3, or later](LICENSE) license
- Parts taken from other sources are still available under their
original licenses

<!-- Link labels: -->

[setup line]: blob/master/src/os/setup.sh#L3
