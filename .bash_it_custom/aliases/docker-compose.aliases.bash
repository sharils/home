#!/usr/bin/env bash

alias dcob="docker-compose build"
alias dcod="docker-compose down"
alias dcodv="docker-compose down --volumes"
alias dcoe="docker-compose exec"
alias dcorr='docker-compose run --rm --volume $PWD:$PWD --workdir $PWD'
alias dcoru='docker-compose run --rm --user $(id -u):$(id -g) --volume $PWD:$PWD --workdir $PWD'
alias dcou="docker-compose up"
alias dcoud="docker-compose up --detach"
