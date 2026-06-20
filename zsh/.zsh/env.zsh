# ~/.zsh/env.zsh — environment tweaks
# shellcheck shell=zsh

# Prepend common local bin directories without duplicating entries.
path_prepend() {
  [[ -d "$1" ]] || return 0
  path=("$1" "${(@)path:#$1}")
}

path_prepend "${HOME}/.local/bin"
path_prepend "${HOME}/bin"

# Editors and pagers.
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-${EDITOR}}"
export LESS="${LESS:--R}"
