# ~/.zsh/aliases.zsh — personal aliases
# shellcheck shell=zsh

# Eza (Better ls)
alias ls='eza --icons'
alias l='eza -F --icons'
alias ll='eza -lh --icons --git'
alias la='eza -lah --icons --git'
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat (Bat)
alias cat='bat'

# Neovim alias
alias vim='nvim'

# Safer destructive operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Core utilities & navigation
alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'
alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -pv'

# zsh follow lf navigation on exit
lf() {
  local tmp
  tmp="$(mktemp)"
  command lf -last-dir-path="${tmp}" "$@"
  if [[ -f "${tmp}" ]]; then
    local dir
    dir="$(cat "${tmp}")"
    rm -f "${tmp}"
    if [[ -d "${dir}" && "${dir}" != "$(pwd)" ]]; then
      cd "${dir}"
    fi
  fi
}

# Git
alias gs='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate --max-count=20'
alias gp='git pull --ff-only'
alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'

# Dotfiles
alias dstow='cd ~/dotfiles && stow --dotfiles -R zsh bat vim tmux nvim fsh eza'
