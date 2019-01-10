#!/usr/bin/env bash

alias nip=$'node -e \'console.log(require("os").networkInterfaces().en0.filter(i => i.family === "IPv4").map(i => i.address)[0])\''
