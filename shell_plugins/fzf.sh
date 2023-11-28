#!/usr/bin/env sh
# https://github.com/junegunn/fzf/blob/master/README.md

# shellcheck source=/dev/null
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

export FZF_COMPLETION_TRIGGER='*'
export FZF_DEFAULT_COMMAND="fd --hidden --unrestricted --color always --ignore-file $HOME/.fdignore --ignore-file $PWD/gitignore.fdignore"
export FZF_DEFAULT_OPTS='--ansi --cycle --multi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat --color=always --line-range :500 {}"'
export FZF_ALT_C_COMMAND="fd --hidden --unrestricted --color always --ignore-file $HOME/.fdignore --ignore-file $PWD/gitignore.fdignore --type d"

# https://github.com/junegunn/fzf/blob/master/README.md#supported-commands
_fzf_setup_completion path b g l v w x
_fzf_setup_completion dir z

_fzf_compgen_path() {
   $FZF_DEFAULT_COMMAND "$1"
}
