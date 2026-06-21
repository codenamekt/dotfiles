# ~/.zsh/custom/plugins/dotfiles/dotfiles.plugin.zsh
# shellcheck shell=zsh

function dotfiles {
  local repo="${DOTFILES_DIR}"
  local command="${1:-help}"

  case "${command}" in
    stow|reload)
      stow --dotfiles -R zsh bat vim tmux nvim fsh eza
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
  stow, reload  Re-apply Stow symlinks for zsh, bat, vim, tmux, nvim, fsh, and eza.
  pull          Pull the dotfiles repository with a fast-forward only.
  status        Show dotfiles repository status.
  help          Show this help.
USAGE
      ;;
  esac
}
