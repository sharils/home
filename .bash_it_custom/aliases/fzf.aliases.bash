export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
   $FZF_DEFAULT_COMMAND "$1"
}
