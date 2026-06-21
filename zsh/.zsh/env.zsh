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

# Force 24-bit TrueColor support for modern terminal applications
export COLORTERM=truecolor

# Unset default system colors so eza uses the custom theme.yml file
unset LS_COLORS EZA_COLORS
