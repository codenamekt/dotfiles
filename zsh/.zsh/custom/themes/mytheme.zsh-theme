# ~/.zsh/custom/themes/mytheme.zsh-theme
# shellcheck shell=zsh

function prompt_git_info {
  if (( $+functions[git_prompt_info] )); then
    git_prompt_info
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}git:%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"

PROMPT='%{$fg_bold[cyan]%}%n@%m%{$reset_color%} %{$fg_bold[yellow]%}%1~%{$reset_color%} $(prompt_git_info)%# '
RPROMPT='%{$fg[green]%}%?%{$reset_color%}'
