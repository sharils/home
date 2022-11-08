#!/usr/bin/env sh

v() {
  if [ $# -eq 0 ]; then
    if [ -s Session.vim ]; then
      vim -S Session.vim
    else
      vim +Obsession
    fi
    return
  fi

  cmd=$1
  shift

  case "$cmd" in

  c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | jsx | lua | md | mdx | mw | pegjs | php | py | rs | scss | sh | sql | story | t | ts | tsx | txt | wat | xhtml | yaml | yml | zep)
    [ "$cmd" != 't' ] && cmd="$cmd.$cmd"
    vim "$(z t && echo "$PWD")/$cmd"
    ;;

  d | p) vim -"$cmd" "$@" ;;

  R) vim README.md ;;
  dco) vim docker-compose.yml ;;
  dk) vim Dockerfile ;;
  i) vim index."${*:-tsx}" ;;
  mk) vim Makefile ;;
  ns) vim server.js ;;
  pj) vim package.json ;;
  rc) vim ~/git/github.com/sharils/home/.vimrc ;;
  tor) vim ~/Library/Application\ Support/TorBrowser-Data/Tor/torrc ;;

  *) vim "$cmd" "$@" ;;

  esac
}

# alias vpc='vim +PlugClean'
# alias vpi='vim +PlugInstall'
# alias vps="vim +'PlugSnapshot! ~/.vim/snapshot.vim'"
# alias vpu='vim +PlugUpdate'

# alias vbh='vim ~/.bash_history'
# alias vnc='vim next.config.js'
# alias vtigrc='vim ~/.tigrc'
