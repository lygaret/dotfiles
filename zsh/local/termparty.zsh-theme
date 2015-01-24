PROMPT='%{$fg_bold[blue]%}%m%(?,,%{$fg_bold[red]%}) → '
RPS1='%{$fg[white]%}%2~$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ∫%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} ∫%{$fg[yellow]%}"
