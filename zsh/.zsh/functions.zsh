# ~/.zsh/functions.zsh — helper functions
# shellcheck shell=zsh

# Create a directory and cd into it.
mkcd() {
  [[ $# -eq 1 ]] || {
    echo "Usage: mkcd <directory>" >&2
    return 1
  }

  mkdir -p -- "$1" && cd -- "$1"
}

# Create a directory and cd into it; kept as an alias-like shortcut.
take() {
  mkcd "$@"
}
