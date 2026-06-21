# ~/.zsh/env.zsh — environment tweaks
# shellcheck shell=zsh

# Prepend common local bin directories without duplicating entries.
path_prepend() {
  [[ -d "$1" ]] || return 0
  path=("$1" "${(@)path:#$1}")
}

path_prepend "${HOME}/.local/bin"
path_prepend "${HOME}/bin"
path_prepend "${HOME}/.local/share/pi-node/node-v22.22.3-linux-x64/bin"

# Less content filters.
if command -v lesspipe >/dev/null 2>&1; then
  export LESSOPEN="${LESSOPEN:-|lesspipe %s}"
fi
