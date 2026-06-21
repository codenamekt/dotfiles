# ~/.zsh/custom/themes/mytheme.zsh-theme
# shellcheck shell=zsh

function prompt_git_info {
  if (( $+functions[_omz_git_prompt_info] )); then
    _omz_git_prompt_info
  elif (( $+functions[git_prompt_info] )); then
    git_prompt_info
  fi
}

# Catppuccin Mocha themed Git indicators
ZSH_THEME_GIT_PROMPT_PREFIX="%F{#94e2d5}❯%f%F{#cdd6f4}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%f%F{#f38ba8}✘%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%f%F{#a6e3a1}•%f"

# Custom prompt layout: Bright White Cross, Lavender Path, Teal/Text Git Info, and Blue Hostname on right
PROMPT=' %F{15}✟%f %B%F{#b4befe}%1~%f%b$(prompt_git_info) '
RPROMPT='%F{#89b4fa}%m%f'
