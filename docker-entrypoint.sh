#!/bin/sh
set -e

echo "[entrypoint] Fixing /paperclip ownership..."
chown -R node:node /paperclip

# Clean up incomplete embedded postgres init.
# initdb fails if the data dir exists but has no PG_VERSION (partial/failed init).
DB_DIR="/paperclip/instances/default/db"
if [ -d "$DB_DIR" ] && [ ! -f "$DB_DIR/PG_VERSION" ]; then
    echo "Removing incomplete embedded PostgreSQL data directory: $DB_DIR"
    rm -rf "$DB_DIR"
fi

exec gosu node "$@"
