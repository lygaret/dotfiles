normal="%{$fg[green]%}"
info="%{$fg[blue]%}"
warning="%{$fg[yellow]%}"
danger="%{$fg[red]%}"

function vi_mode_color() {
    echo "${${KEYMAP/vicmd/$warning}/(main|viins)/$normal}"
}

function exit_status_color() {
    echo "%(?,$(job_status_color),$danger)"
}

function job_status_color() {
    echo "%(1j,$info,$normal)"
}

PROMPT='$(exit_status_color)#$(vi_mode_color)#%{$reset_color%} '
RPS1='%{$fg[white]%}%2~$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ∫%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ∫%{$fg[yellow]%}"
