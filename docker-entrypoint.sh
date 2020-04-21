#!/bin/sh
set -e

puid=${PUID:-$(id -g root)}

conf=${CONF_FILE:-"/config.json"}
host=${HOST:-"0.0.0.0"}
port=${PORT:-5000}


exec su-exec $puid "$@" -c $conf --host $host --port $port
