#!/usr/bin/env bash

alias dkbasename='echo $(basename $PWD | tr "[:upper:]" "[:lower:]")'
alias dkb='docker build --tag ${USER}/$(dkbasename) .'
alias dkbr='docker run --interactive --name ${USER}_$(dkbasename) --rm --tty ${USER}/$(basename $PWD)'
alias dkbri='docker rmi ${USER}/$(dkbasename)'
alias dkbrw='docker run --interactive --name ${USER}_$(dkbasename) --rm --tty --volume $PWD:$PWD --workdir $PWD ${USER}/$(basename $PWD)'
alias dkbs='docker stop ${USER}_$(dkbasename)'
alias dkrr='docker run --interactive --rm --tty --volume $PWD:$PWD --workdir $PWD'
alias dkru='docker run --interactive --rm --tty --user $UID:$(id -g) --volume $PWD:$PWD --workdir $PWD'

alias dkri='docker rmi'
alias dkrm='docker rm'
alias dkrmf='docker rm --force'
alias dks='docker stop'
alias dkvl='docker volume ls'
alias dkvr='docker volume rm'
alias dkt='docker tag'
alias dkp='docker push'

alias http='docker run --interactive --rm --tty meltwater/httpie'
