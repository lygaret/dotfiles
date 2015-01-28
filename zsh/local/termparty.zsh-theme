function vi_mode_prompt_info() {
    echo "${${KEYMAP/vicmd/ⁿ}/(main|viins)/ⁱ}"
}

PROMPT='%(?,%{$fg_bold[blue]%},%{$fg_bold[red]%})%m%{$fg[yellow]%}$(vi_mode_prompt_info) %{$reset_color%}'
RPS1='%{$fg[white]%}%2~$(git_prompt_info)'

# beep ᶜⁿⁱ 

MODE_INDICATOR="ⁿ"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ∫%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ∫%{$fg[yellow]%}"
