# ~/.zsh/.zprofile — managed by Stow from ~/dotfiles/zsh/.zsh/.zprofile
# shellcheck shell=zsh

# Login-shell PATH additions. zsh ties the $path array to $PATH.
for dir in "${HOME}/.local/bin" "${HOME}/bin"; do
  if [[ -d "$dir" ]]; then
    path=("$dir" "${(@)path:#$dir}")
  fi
done

# Mount remote projects over SSHFS when WSL starts.
if [[ "$(uname -r)" == *microsoft* ]]; then
  mount_projects_sshfs() {
    local mountpoint="${HOME}/projects"

    command -v sshfs >/dev/null 2>&1 || return 0

    mkdir -p "$mountpoint"

    # Avoid spawning another sshfs process if it is already mounted.
    if findmnt -T "$mountpoint" >/dev/null 2>&1; then
      return 0
    fi

    sshfs codenamekt-nuc:/home/codenamekt/projects "$mountpoint"
  }

  mount_projects_sshfs
  unfunction mount_projects_sshfs
fi
