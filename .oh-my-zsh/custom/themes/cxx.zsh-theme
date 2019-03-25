ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

local exit_code="%(?,,%{$fg[red]%}%?%{$reset_color%})"

#PROMPT='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%})
PROMPT='%(?, ,)
%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}: %{$fg_bold[blue]%}%~%{$reset_color%}$(git_prompt_info) %{$fg[white]%}[%*]%{$reset_color%} $exit_code
%_$(prompt_char) '
# RPROMPT='%(?, ,%{$fg[red]%}$?%{$reset_color%})'
# RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'
