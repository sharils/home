#!/usr/bin/env sh

b() {
	cmd=$1
	shift

	case $cmd in
	i)
		brew install "$@"
		;;

	inf)
		brew info "$@"
		;;

	sr)
		brew search "$@"
		;;
	esac
}
