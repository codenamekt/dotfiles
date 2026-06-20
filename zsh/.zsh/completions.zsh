# ~/.zsh/completions.zsh — completion path setup
# shellcheck shell=zsh

ZSH_COMPLETIONS_DIR="${HOME}/.zsh/completions"
if [[ -d "${ZSH_COMPLETIONS_DIR}" ]]; then
  fpath=("${ZSH_COMPLETIONS_DIR}" "${fpath[@]}")
fi
