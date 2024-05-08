#!/usr/bin/env sh

# alias dk='docker '
# alias dkbasename='echo $(basename $PWD | tr "[:upper:]" "[:lower:]")'
# alias dkbrw='docker run --interactive --name ${USER}_$(dkbasename) --rm --tty --volume $PWD:$PWD --workdir $PWD ${USER}/$(basename $PWD)'
# alias dkbs='docker stop ${USER}_$(dkbasename)'
# alias dkrr='docker run --interactive --rm --tty --volume $PWD:$PWD --workdir $PWD'
# alias dkru='docker run --interactive --rm --tty --user $UID:$(id -g) --volume $PWD:$PWD --workdir $PWD'

# alias dkdi='ncdu --exclude-from .dockerignore'
# alias dke='docker exec'
# alias dkri='docker rmi'
# alias dkrm='docker rm'
# alias dkrmf='docker rm --force'
# alias dks='docker stop'
# alias dkvl='docker volume ls'
# alias dkvr='docker volume rm'
# alias dkt='docker tag'
# alias dkp='docker push'
# alias dksd='docker system df'

# alias aws='docker run --interactive --rm --tty -e AWS_ACCESS_KEY_ID -e AWS_DEFAULT_REGION -e AWS_SECRET_ACCESS_KEY amazon/aws-cli'
# alias alpine='docker run --interactive --rm --tty alpine:3.14 '
# alias bfg='docker run --interactive --rm --tty --volume $PWD:/home/nikovirtala nikovirtala/bfg'
# alias devdoc='docker run --interactive --rm --tty devdocs/devdocs'
# alias gcloud='docker run --interactive --tty --name gcloud-config google/cloud-sdk:alpine gcloud'
# alias grip='docker run --interactive --rm --tty --volume $PWD:/data --volume ~/.grip:/.grip mbentley/grip'
# alias gsutil='docker run --interactive --rm --tty --volumes-from gcloud-config google/cloud-sdk:alpine gsutil'
# alias http='docker run --rm alpine/httpie'
# alias mitmdump='docker run --interactive --rm --tty --publish 8080:8080 --publish 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmdump'
# alias mitmdumpv='docker run --interactive --rm --tty --publish 8080:8080 --publish 127.0.0.1:8081:8081 --volume ~/.mitmproxy:/home/mitmproxy/.mitmproxy mitmproxy/mitmproxy mitmdump'
# alias mitmproxy='docker run --interactive --rm --tty --publish 8080:8080 --publish 127.0.0.1:8081:8081 mitmproxy/mitmproxy'
# alias mitmproxyv='docker run --interactive --rm --tty --publish 8080:8080 --publish 127.0.0.1:8081:8081 --volume ~/.mitmproxy:/home/mitmproxy/.mitmproxy mitmproxy/mitmproxy'
# alias mitmweb='docker run --interactive --rm --tty --publish 8080:8080 --publish 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-iface 0.0.0.0'
# alias mitmwebv='docker run --interactive --rm --tty --publish 8080:8080 --publish 127.0.0.1:8081:8081 --volume ~/.mitmproxy:/home/mitmproxy/.mitmproxy mitmproxy/mitmproxy mitmweb --web-iface 0.0.0.0'
# alias mongosh='docker run --interactive --rm --tty --env MONGO_URL --volume /dev/null/:/home/mongodb/.dbshell mongo:5.0 mongosh \$MONGO_URL '
# alias mongodump='docker run --interactive --rm --tty --volume $PWD:$PWD --workdir $PWD mongo:5.0 mongodump'
# alias mongojs='docker run --interactive --rm --tty mongo:5.0 mongo --eval'
# alias mongorestore='docker run --interactive --rm --tty --volume $PWD:$PWD --workdir $PWD mongo:5.0 mongorestore'
# alias node:alpine='docker run --interactive --rm --tty node:16-alpine '
# alias now='docker run --rm --volume "$PWD/root/.now:/root/.now" smutdose/now'
# alias speedtest-cli='docker run --rm moutten/speedtest-cli'
# alias swagger-codegen='docker run --rm --volume ${PWD}:/${PWD} --workdir ${PWD} swaggerapi/swagger-codegen-cli generate'
# alias swagger-codegenes='docker run --rm --volume ${PWD}:/${PWD} --workdir ${PWD} swaggerapi/swagger-codegen-cli generate --lang=javascript --additional-properties=usePromises=true,useES6=true'
# alias swagger-codegenjs='docker run --rm --volume ${PWD}:/${PWD} --workdir ${PWD} swaggerapi/swagger-codegen-cli generate --lang=javascript --additional-properties=usePromises=true'
# alias swagger-editor='docker run --rm --env URL=/app/swagger.yaml --publish 8080:8080 --volume $PWD:/usr/share/nginx/html/app:ro swaggerapi/swagger-editor'
# alias swagger-ui='docker run --rm --env SWAGGER_JSON=/app/swagger.yaml --publish 8080:8080 --volume $PWD:/app:ro swaggerapi/swagger-ui'
# alias toodles='docker run --interactive --rm --tty --publish 9001:9001 --volume $PWD:/repo aviaviavi/toodles'
# alias ubuntu='docker run --interactive --rm --tty ubuntu:20.04 '
# alias variety='docker run --rm objectrocket/variety'
# alias wraith='docker run --rm bbcnews/wraith'
