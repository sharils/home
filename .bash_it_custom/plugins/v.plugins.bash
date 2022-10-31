#!/usr/bin/env sh

random="$(awk 'BEGIN { srand(); print int(rand()*32768) }')"

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

  c | css | csv | eex | erl | ex | exs | gql | html | java | jq | js | json | \
    jsx | lua | md | mdx | mw | pegjs | php | py | rs | scss | sh | sql | \
    story | ts | tsx | txt | wat | xhtml | yaml | yml | zep)
    vim "/tmp/$cmd-$USER-$random.$cmd"
    ;;

  R) vim README.md ;;
  d) vimdiff "$@" ;;
  dco) vim docker-compose.yml ;;
  dk) vim Dockerfile ;;
  gi) vim .gitignore ;;
  pj) vim package.json ;;
  rc) vim ~/git/github.com/sharils/home/.vimrc ;;
  t) vim "/tmp/$USER-$random" ;;

  *) vim "$cmd" "$@" ;;

  esac
}

# alias vpc='vim +PlugClean'
# alias vpi='vim +PlugInstall'
# alias vps="vim +'PlugSnapshot! ~/.vim/snapshot.vim'"
# alias vpu='vim +PlugUpdate'

# alias vbh='vim ~/.bash_history'
# alias vgie='vim .git/info/exclude'
# alias vicss='vim index.css'
# alias vihtml='vim index.html'
# alias vijs='vim index.js'
# alias vijsx='vim index.jsx'
# alias vits='vim index.ts'
# alias vmf='vim Makefile'
# alias vnc='vim next.config.js'
# alias vsj='vim server.js'
# alias vtigrc='vim ~/.tigrc'
# alias vtorrc='vim ~/Library/Application\ Support/TorBrowser-Data/Tor/torrc'
