# ~/.zsh/aliases.zsh — personal aliases
# shellcheck shell=zsh

# General
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -pv'

# Safer destructive operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Git
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate --max-count=20'
alias gp='git pull --ff-only'

# Dotfiles
alias dstow='stow --dotfiles -R zsh vim tmux nvim'
