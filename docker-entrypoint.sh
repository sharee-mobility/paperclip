#!/bin/sh
set -e

mkdir -p \
    "/paperclip/instances/default/logs" \
    "/paperclip/instances/default/data/run-logs" \
    "/paperclip/instances/default/data/storage" \
    "/paperclip/instances/default/data/backups" \
    "/paperclip/instances/default/secrets" \
    "/paperclip/instances/default/workspaces"

chown -R node:node /paperclip

exec gosu node "$@"
