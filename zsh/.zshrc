# ~/.zshrc — managed by Stow from ~/dotfiles/zsh/.zshrc
# shellcheck shell=zsh

# Only source this file from an interactive shell.
[[ -o interactive ]] || return

# Prevent repeated sourcing if a shell reloads .zshrc.
if [[ -n "${ZDOTFILES_ZSHRC_LOADED:-}" ]]; then
  return
fi
ZDOTFILES_ZSHRC_LOADED=1

# Directory where this Zsh package lives after Stow creates symlinks.
export ZSH="${HOME}/.zsh/oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.zsh/custom"

# Keep Oh My Zsh from prompting to update during interactive sessions.
DISABLE_AUTO_UPDATE="true"

# Theme: dotfiles/zsh/custom/themes/mytheme.zsh-theme after Stow.
ZSH_THEME="mytheme"

# Plugins: official Oh My Zsh plugins + our local dotfiles plugin.
plugins=(
  git
  z
  docker
  dotfiles
)

# Modular config lives under ~/.zsh/*.zsh.
ZSH_CONFIG_DIR="${HOME}/.zsh"
source_if_exists() {
  [[ -r "$1" ]] && source "$1"
}

# Load environment and completion path before Oh My Zsh initializes compinit.
source_if_exists "${ZSH_CONFIG_DIR}/env.zsh"
source_if_exists "${ZSH_CONFIG_DIR}/completions.zsh"

# Load Oh My Zsh if it has been bootstrapped.
if [[ -f "${ZSH}/oh-my-zsh.sh" ]]; then
  source "${ZSH}/oh-my-zsh.sh"
else
  echo "⚠️  Oh My Zsh not found at ${ZSH}" >&2
  echo "   Run: cd ~/dotfiles && ./bootstrap.sh" >&2
fi

# Load the rest of our modular config after Oh My Zsh is available.
source_if_exists "${ZSH_CONFIG_DIR}/aliases.zsh"
source_if_exists "${ZSH_CONFIG_DIR}/functions.zsh"

# History
HISTFILE="${HISTFILE:-${HOME}/.zsh_history}"
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt inc_append_history
setopt share_history

# Shell behavior
setopt auto_cd
setopt extended_glob

# Keybindings
bindkey '^R' history-incremental-search-backward
