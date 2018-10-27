unalias bshhp
function bshhp() {
	if [ "$#" -eq 0 ]; then
		bash-it help plugins
	else
		$PAGER "$HOME/.bash_it/plugins/available/$1.plugin.bash"
	fi
}

bshva() {
	vim "$HOME/git/github.com/sharils/home/.bash_it_custom/aliases/$1.aliases.bash"
}

bshvp() {
	vim "$HOME/git/github.com/sharils/home/.bash_it_custom/plugins/$1.plugins.bash"
}
