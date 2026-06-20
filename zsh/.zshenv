# ~/.zshenv — managed by Stow from ~/dotfiles/zsh/.zshenv
# shellcheck shell=zsh

# Sourced by every zsh process. Keep this file minimal and side-effect free.
export LANG="${LANG:-C.UTF-8}"

# XDG Base Directories
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Zsh Configuration Directory
export ZDOTDIR="${HOME}/.zsh"

