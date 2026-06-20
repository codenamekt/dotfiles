#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${DIR}"

OMZ_DIR="${DIR}/zsh/.zsh/oh-my-zsh"
OMZ_REPO="https://github.com/ohmyzsh/ohmyzsh.git"

install_debian_package() {
  local package="$1"
  if command -v "${package}" >/dev/null 2>&1; then
    return 0
  fi

  if command -v apt-get >/dev/null 2>&1; then
    echo "Installing ${package} with apt…"
    sudo apt-get update
    sudo apt-get install -y "${package}"
  else
    echo "Missing ${package}; install it with your system package manager." >&2
    return 1
  fi
}

install_bootstrap_tools() {
  install_debian_package git
  install_debian_package stow
}

install_zsh() {
  if command -v zsh >/dev/null 2>&1; then
    echo "Zsh is already installed: $(command -v zsh)"
    return 0
  fi

  install_debian_package zsh

  local zsh_path
  zsh_path="$(command -v zsh)"
  if [[ "${SHELL}" != "${zsh_path}" ]]; then
    echo "Setting default shell to ${zsh_path}…"
    chsh -s "${zsh_path}"
  fi
}

clone_oh_my_zsh() {
  if [[ -d "${OMZ_DIR}/.git" ]]; then
    echo "Oh My Zsh is already cloned at ${OMZ_DIR}"
    return 0
  fi

  if [[ -e "${OMZ_DIR}" ]]; then
    echo "${OMZ_DIR} exists but is not a git clone; refusing to overwrite." >&2
    return 1
  fi

  echo "Cloning Oh My Zsh into ${OMZ_DIR}…"
  git clone --depth 1 "${OMZ_REPO}" "${OMZ_DIR}"
}

stow_package() {
  local package="$1"
  if [[ ! -d "${package}" ]]; then
    echo "Skipping ${package}; directory not found."
    return 0
  fi

  echo "Stowing ${package}…"
  stow --dotfiles -S "${package}"
}

install_bootstrap_tools
install_zsh
clone_oh_my_zsh

# Stow all known packages. Run `stow --dotfiles zsh` manually if you only want to refresh Zsh.
for package in tmux zsh vim nvim; do
  stow_package "${package}"
done

echo "Bootstrap complete."
