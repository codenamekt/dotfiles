# ~/.zshenv — managed by Stow from ~/dotfiles/zsh/.zshenv
# shellcheck shell=zsh

# Sourced by every zsh process. Keep this file minimal and side-effect free.
export LANG="${LANG:-C.UTF-8}"

# XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"

# Editors and pagers
export EDITOR=vim
export VISUAL=vim
export PAGER=bat
export MANPAGER="sh -c 'col -b | bat -l man -p'"
export GIT_PAGER=bat
export BAT_THEME="Catppuccin Mocha"
export BAT_PAGER="less -R"
export LESS="${LESS:--R}"

# Zsh Configuration Directory
export ZDOTDIR="${HOME}/.zsh"

