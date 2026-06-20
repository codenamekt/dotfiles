# ~/.zsh/custom/plugins/dotfiles/dotfiles.plugin.zsh
# shellcheck shell=zsh

function dotfiles {
  local repo="${HOME}/dotfiles"
  local command="${1:-help}"

  case "${command}" in
    stow|reload)
      stow --dotfiles -R zsh vim tmux nvim
      ;;
    pull)
      git -C "${repo}" pull --ff-only
      ;;
    status)
      git -C "${repo}" status --short
      ;;
    help|*)
      cat <<'USAGE'
Usage: dotfiles <command>

Commands:
  stow, reload  Re-apply Stow symlinks for zsh, vim, tmux, and nvim.
  pull          Pull the dotfiles repository with a fast-forward only.
  status        Show dotfiles repository status.
  help          Show this help.
USAGE
      ;;
  esac
}
