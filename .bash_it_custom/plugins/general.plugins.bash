unalias bshhp
function bshhp() {
	if [ "$#" -eq 0 ]; then
		bash-it help plugins
	else
		$PAGER "$HOME/.bash_it/plugins/available/$1.plugin.bash"
	fi
}
