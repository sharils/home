export FZF_DEFAULT_COMMAND='fd --type f --exclude package-lock.json'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d'

_fzf_compgen_path() {
   $FZF_DEFAULT_COMMAND "$1"
}
