# My dotfiles

This repository contains my personal dotfiles for configuring my development environment.

## Setup

These instructions are intended for Apple Silicon Macs. An internet connection and a macOS
user account with administrator privileges are required.

### 1. Install Homebrew

Follow the installation instructions on the [official Homebrew website](https://brew.sh/),
including any post-installation steps shown by the installer.

### 2. Install mise

Install only mise directly with Homebrew. The remaining packages will be installed by the
subsequent bootstrap process.

```sh
/opt/homebrew/bin/brew install mise
```

### 3. Clone the repository

```sh
git clone https://github.com/takeyaqa/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 4. Bootstrap the environment

```sh
mise trust
mise bootstrap
```

This command installs packages and language runtimes, clones repositories, creates symlinks for
the dotfiles, and applies the macOS settings. If existing dotfiles cause conflicts, review and
either move or remove them before running the command again.

When the command finishes, restart your shell or terminal to load the configuration.
