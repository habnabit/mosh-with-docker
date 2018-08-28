#!/bin/zsh
set -e
port="$[RANDOM%1000+60000]"
container=$(docker run -d -p "$port:$port/udp" -e "MOSH_PORT=$port" "$@")
while true; do
    key=$(docker exec "$container" cat /tmp/mosh-key)
    if [[ -n $key ]]; then
	echo "$key"
	exit 0
    fi
done
