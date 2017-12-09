[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# You can add these options to $FZF_DEFAULT_OPTS so that they're applied by default. For example,
export FZF_DEFAULT_OPTS='--multi'

# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=!.git'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_dir() {
	rg --files --hidden . 2>/dev/null | awk 'function dirname(fn) { if (fn == "") return ".";  if (fn !~ "[^/]") return "/"; sub("/*$", "", fn); if (fn !~ "/") return "."; sub("/[^/]*$", "", fn); if (fn == "") fn = "/"; return fn } {$0 = dirname($0)} !a[$0]++'
}

_fzf_compgen_path() {
    rg --files --hidden "$1"
}
