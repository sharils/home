#!/usr/bin/env sh

mkcert() {
  case "$1" in
  ca)
    [ ! -e ./ca.crt ] && [ ! -e ./ca.key ] &&
      n y mkcert create-ca --organization '# Test CA' --validity 1
    ;;
  cert)
    [ ! -e ./cert.crt ] && [ ! -e ./cert.key ] &&
      n y mkcert create-cert --validity 1 --domains "${N_MKCERT_DOMAINS:-localhost,127.0.0.1}"
    ;;
  clean)
    rm ca.crt ca.key cert.crt cert.key
    ;;
  refresh)
    n mkcert clean
    n mkcert
    ;;
  *)
    n mkcert ca
    n mkcert cert
    ;;
  esac
}

mkcert "$@"
