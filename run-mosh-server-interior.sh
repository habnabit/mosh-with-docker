#!/bin/sh
exec mosh-server new -v -p "$MOSH_PORT" -- "$@" >/tmp/mosh-key
