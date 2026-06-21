# ~/.zsh/completions.zsh — completion path setup
# shellcheck shell=zsh

# Keep compinit's zcompdump under XDG cache unless the user has already set
# ZSH_COMPDUMP to an XDG cache path.
ZSH_COMPDUMP_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/zsh"
if [[ -z "${ZSH_COMPDUMP:-}" || "${ZSH_COMPDUMP}" != "${ZSH_COMPDUMP_DIR}/"* ]]; then
  ZSH_COMPDUMP="${ZSH_COMPDUMP_DIR}/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
fi
mkdir -p "${ZSH_COMPDUMP:h}"

ZSH_COMPLETIONS_DIR="${HOME}/.zsh/completions"
if [[ -d "${ZSH_COMPLETIONS_DIR}" ]]; then
  fpath=("${ZSH_COMPLETIONS_DIR}" "${fpath[@]}")
fi
