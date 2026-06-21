#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${DIR}"

OMZ_DIR="${DIR}/zsh/.zsh/oh-my-zsh"
OMZ_REPO="https://github.com/ohmyzsh/ohmyzsh.git"

CATPPUCCIN_BAT_THEMES_DIR="${DIR}/bat/.config/bat/themes/catppuccin"
CATPPUCCIN_BAT_REPO="https://github.com/catppuccin/bat.git"

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

ensure_bat_command() {
  if command -v bat >/dev/null 2>&1; then
    return 0
  fi

  local batcat_path
  batcat_path="$(command -v batcat 2>/dev/null || true)"
  if [[ -z "${batcat_path}" ]]; then
    echo "batcat was not found after installing bat." >&2
    return 1
  fi

  local link_dir="/usr/local/bin"
  if [[ ! -w "${link_dir}" ]]; then
    link_dir="${HOME}/.local/bin"
  fi

  echo "Creating ${link_dir}/bat symlink to ${batcat_path}…"
  if [[ "${link_dir}" == "/usr/local/bin" ]]; then
    sudo mkdir -p "${link_dir}"
    sudo ln -sf "${batcat_path}" "${link_dir}/bat"
  else
    mkdir -p "${link_dir}"
    ln -sf "${batcat_path}" "${link_dir}/bat"
  fi
}

install_bat_with_apt() {
  if ! command -v apt-get >/dev/null 2>&1; then
    return 1
  fi

  if ! command -v sudo >/dev/null 2>&1 || ! sudo -n true >/dev/null 2>&1; then
    echo "Passwordless sudo is not available; falling back to a local bat install." >&2
    return 1
  fi

  echo "Installing bat with apt…"
  sudo apt-get update
  sudo apt-get install -y bat
}

install_bat_local() {
  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required for the local bat install fallback." >&2
    return 1
  fi

  local version="${BAT_VERSION:-0.24.0}"
  local arch
  case "$(uname -m)" in
    x86_64|amd64)
      arch="x86_64-unknown-linux-musl"
      ;;
    aarch64|arm64)
      arch="aarch64-unknown-linux-musl"
      ;;
    *)
      echo "Unsupported architecture for local bat install: $(uname -m)" >&2
      return 1
      ;;
  esac

  local asset="bat-v${version}-${arch}.tar.gz"
  local url="https://github.com/sharkdp/bat/releases/download/v${version}/${asset}"
  local tmp
  tmp="$(mktemp -d)"

  echo "Installing bat locally from ${url}…"
  curl -fsSL "${url}" -o "${tmp}/${asset}" || return 1
  tar -xzf "${tmp}/${asset}" -C "${tmp}" || return 1
  mkdir -p "${HOME}/.local/bin"
  install -m 0755 "${tmp}/bat-v${version}-${arch}/bat" "${HOME}/.local/bin/bat" || return 1
  rm -rf "${tmp}"
}

install_bat() {
  if command -v bat >/dev/null 2>&1 || command -v batcat >/dev/null 2>&1; then
    echo "bat is already installed: $(command -v bat 2>/dev/null || command -v batcat)"
    ensure_bat_command
    return 0
  fi

  if install_bat_with_apt; then
    ensure_bat_command
    return 0
  fi

  install_bat_local
  ensure_bat_command
}

install_manpager_tools() {
  if command -v col >/dev/null 2>&1; then
    return 0
  fi

  if command -v apt-get >/dev/null 2>&1; then
    echo "Installing bsdextrautils with apt for col…"
    sudo apt-get update
    sudo apt-get install -y bsdextrautils
  else
    echo "Missing col; install bsdextrautils with your system package manager." >&2
    return 1
  fi
}

install_bootstrap_tools() {
  install_debian_package git
  install_debian_package stow
  install_debian_package less
  install_manpager_tools
  install_bat
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

clone_catppuccin_bat_themes() {
  if [[ -d "${CATPPUCCIN_BAT_THEMES_DIR}/.git" ]]; then
    echo "Catppuccin bat themes are already cloned at ${CATPPUCCIN_BAT_THEMES_DIR}"
    return 0
  fi

  if [[ -e "${CATPPUCCIN_BAT_THEMES_DIR}" ]]; then
    echo "${CATPPUCCIN_BAT_THEMES_DIR} exists but is not a git clone; refusing to overwrite." >&2
    return 1
  fi

  echo "Cloning Catppuccin bat themes into ${CATPPUCCIN_BAT_THEMES_DIR}…"
  mkdir -p "$(dirname "${CATPPUCCIN_BAT_THEMES_DIR}")"
  git clone --depth 1 "${CATPPUCCIN_BAT_REPO}" "${CATPPUCCIN_BAT_THEMES_DIR}"
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

build_bat_cache() {
  if ! command -v bat >/dev/null 2>&1; then
    return 0
  fi

  if [[ ! -d "${HOME}/.config/bat/themes/catppuccin" ]]; then
    return 0
  fi

  echo "Building bat theme cache…"
  bat cache --build --source "${HOME}/.config/bat/themes/catppuccin"
}

install_bootstrap_tools
install_zsh
clone_oh_my_zsh
clone_catppuccin_bat_themes

# Stow all known packages. Run `stow --dotfiles zsh` manually if you only want to refresh Zsh.
for package in tmux zsh bat vim nvim; do
  stow_package "${package}"
done

build_bat_cache

echo "Bootstrap complete."
