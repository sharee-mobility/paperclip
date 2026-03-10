#!/bin/sh
set -e
chown -R node:node /paperclip
exec gosu node "$@"
