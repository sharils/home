#!/usr/bin/env sh

d() {
  cmd="${1:-i}" && shift
  case $cmd in

  %)
    cmd="${1:-all}"
    shift
    case "$cmd" in
    all)
      for cmd in datetime date time year month week day hour minute second timezone literal extension; do
        d % "$cmd"
      done
      ;;

    date)
      cat <<SH
date:
  %D: %m/%d/%y, $(date +%D)
  %F: %Y-%m-%d, $(date +%F)
  %v: %e-%b-%y, $(date +%v)
  %x: national, $(date +%x)
  %Ex: POSIX, $(date +%Ex)
SH
      ;;

    datetime)
      cat <<SH
datetime:
  %+: national, $(date +%+)
  %c: national, $(date +%c)
  %Ec: POSIX, $(date +%Ec)
SH
      ;;

    day)
      cat <<SH
day:
  %A: national, $(date +%A)
  %a: national, $(date +%a)
  %d: 01-31, $(date +%d)
  %e: 1-31, $(date +%e)
  %j: 001-366, $(date +%j)
  %u: 1-7, Mon-Sun, $(date +%u)
  %w: 0-6, Sun-Sat, $(date +%w)
  %Od: POSIX, $(date +%Od)
  %Oe: POSIX, $(date +%Oe)
  %Ou: POSIX, $(date +%Ou)
  %Ow: POSIX, $(date +%Ow)
SH
      ;;

    extension)
      cat <<SH
extension:
  %-*: GNU, no padding
  %_*: GNU, space padding
  %0*: GNU, zero padding
SH
      ;;

    hour)
      cat <<SH
hour:
  %H: 00-23, $(date +%H)
  %I: 00-12, $(date +%I)
  %k: 0-23, $(date +%k)
  %l: 1-12, $(date +%l)
  %p: national, $(date +%p)
  %OH: POSIX, $(date +%OH)
  %OI: POSIX, $(date +%OI)
SH
      ;;

    literal)
      cat <<SH
literal:
  %%: %
  %n: \n
  %t: \t
SH
      ;;

    minute)
      cat <<SH
minute:
  %M: 00-59, $(date +%M)
  %OM: POSIX, $(date +%OM)
SH
      ;;

    month)
      cat <<SH
month:
  %B: national, $(date +%B)
  %b: national, $(date +%b)
  %h: %b, $(date +%h)
  %m: 01-12, $(date +%m)
  %Om: POSIX, $(date +%Om)
SH
      ;;

    second)
      cat <<SH
second:
  %S: 00-60, $(date +%S)
  %s: 0-67768036191676799, $(date +%s)
  %OS: POSIX, $(date +%OS)
SH
      ;;

    time)
      cat <<SH
time:
  %R: %H:%M, $(date +%R)
  %T: %H:%M:%S, $(date +%T)
  %X: national, $(date +%X)
  %r: %I:%M:%S %p, $(date +%r)
  %EX: POSIX, $(date +%EX)
SH
      ;;

    timezone)
      cat <<SH
timezone:
  %Z: $(date +%Z)
  %z: $(date +%z)
SH
      ;;

    week)
      cat <<SH
week:
  %U: 00-53, $(date +%U), Sun-Sat
  %V: 01-53, $(date +%V), ISO
  %W: 00-53, $(date +%W), Mon-Sun
  %OU: POSIX, $(date +%OU)
  %OV: POSIX, $(date +%OV)
  %OW: POSIX, $(date +%OW)
SH
      ;;

    year)
      cat <<SH
year:
  %C: 19-99, $(date +%C)
  %G: 1900-9999, $(date +%G), ISO
  %Y: 1900-9999, $(date +%Y)
  %g: 00-99, $(date +%g), ISO
  %y: 00-99, $(date +%y)
  %EC: POSIX, $(date +%EC)
  %EY: POSIX, $(date +%EY)
  %Ey: POSIX, $(date +%Ey)
  %Oy: POSIX, $(date +%Oy)
SH
      ;;

    esac
    ;;

  -1) (set -x && date -ujf%s -v-1S 0 "${@:-+%+%t%G-W%V}") ;;
  -v)
    v="$1" && shift
    cmd="$1" && shift
    date -jf"${*:-%F}" -v"$v" "${cmd:-$(date +"${*:-%F}")}" +"${*:-%F}"
    ;;
  0) date -ujf%s 0 "${@:-+%FT%T}" ;;
  F) date +%F ;;
  I) date -Iseconds "$@" | sed 's/:00$//;s/+00$/Z/' | tr -d '[:space:]' ;;
  a) direnv allow ;;

  b)
    base="$(basename "$PWD" | x hostnameise)"
    name="${base}_$USER"
    tag="$base/$USER"
    case "$1" in
    r) shift && d run --interactive --rm --tty --name "$name" "$tag" "$@" ;;
    rmi) shift && d rmi "$tag" "$@" ;;
    s) d stop "$name" ;;
    t)
      shift
      target="$1" && shift
      d b --target "$target" "${@:-.}"
      ;;
    *)
      cat <<EOF >&2
# DOCKER_DEFAULT_PLATFORM=linux/amd64 docker build --tag "$tag" "${@:-.}" # prefix for AWS
EOF
      d build --tag "$tag" "${@:-.}"
      ;;
    esac
    ;;

  c)
    case "$1" in
    b) shift && d c build "$@" ;;
    d) shift && d c down "$@" ;;
    e) shift && $EDITOR "${@:-docker-compose.yml}" ;;
    l) shift && d c logs "${@:---follow}" ;;
    p) shift && d c --profile "$@" ;;
    r) shift && d c run "$@" ;;
    rs) shift && d c restart "$@" ;;
    s) shift && d c start "$@" ;;
    u)
      shift
      case "$1" in
      b) shift && set -- --build "$@" ;;
      esac
      d c up "$@"
      ;;
    x) shift && d c exec "$@" ;;
    *) docker compose "$@" ;;
    esac
    ;;

  copies)
    z t_init
    (
      g cl t --quiet "$PWD"
      find -- * -type d -depth 0 -exec echo COPY {} /workdir/{} \;
      echo "COPY $(find -- * ! -name CHANGELOG.md ! -name Dockerfile ! -name README.md ! -name LICENSE ! -name docker-compose.yml -type f -depth 0 -exec echo {} \+) /workdir"
    )
    ;;

  default.template)
    mkdir -p ./etc/nginx/templates
    docker run --interactive --rm --tty nginx:1.23-alpine cat /etc/nginx/conf.d/default.conf >./etc/nginx/templates/default.template
    ;;

  e) direnv edit . && chmod 600 .envrc ;;

  i)
    cmd="${1:-ls}" && shift
    case "$cmd" in
    p) d image prune "$@" ;;
    s)
      for image in "$@"; do :; done
      image="$(echo "$image" | x hostnameise).tar.gz"
      d image save "$@" | gzip >"$image"
      echo "docker load < $image # to load image" >&2
      ;;
    *) d image "$cmd" "$@" ;;
    esac
    ;;

  j)
    case "$1" in
    sp)
      shift
      cmd="${1:-"$(basename "$PWD" | sed 's/[^[:alnum:]]\{1,\}/_/g')"}" && shift
      d j startproject --verbosity 2 "$cmd" "${@:-.}"
      ;;
    *) p r p -mdjango "$@" ;;
    esac
    ;;

  l) d logs "$@" ;;
  o) open -b com.docker.docker ;;
  r)
    cmd="${1:-alpine:3.17}" && shift
    docker run --interactive --rm --tty \
      --user "$(id -u):$(id -g)" \
      --volume "$PWD:$PWD" \
      --workdir "$PWD" \
      "$cmd" "${@:-env}"
    ;;
  q) osascript -e 'quit app "Docker"' ;;
  s)
    case "$1" in
    p) shift && set -- prune "$@" ;;
    esac
    d system "$@"
    ;;
  v) d volume "$@" ;;
  x) d exec "$@" ;;
  *) docker "$cmd" "$@" ;;

  esac
}
