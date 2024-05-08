#!/usr/bin/env sh

[ -n "$SET_X" ] && set -x

swagger_codegen() {
  case "$1" in
  dart | aspnetcore | csharp | csharp-dotnet2 | go | go-server | dynamic-html | html | html2 | java | jaxrs-cxf-client | jaxrs-cxf | inflector | jaxrs-cxf-cdi | jaxrs-spec | jaxrs-jersey | jaxrs-di | jaxrs-resteasy-eap | jaxrs-resteasy | micronaut | spring | nodejs-server | openapi | openapi-yaml | kotlin-client | kotlin-server | php | python | python-flask | r | ruby | scala | scala-akka-http-server | swift3 | swift4 | swift5 | typescript-angular | typescript-axios | typescript-fetch | javascript)
    set -- generate --lang "$1" --output "/local/$1" --input-spec "${@:-https://petstore.swagger.io/v2/swagger.json}"
    ;;
  esac
  docker run --rm --volume "${PWD}:/local" parsertongue/swagger-codegen-cli "${@:-langs}"
}

swagger_codegen "$@"
