#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DB_PATH="${ROOT_DIR}/data/peak-week.db"

rm -f "${DB_PATH}"
sqlite3 "${DB_PATH}" < "${ROOT_DIR}/data/schema.sql"
sqlite3 "${DB_PATH}" < "${ROOT_DIR}/data/seed.sql"

echo "Database created at ${DB_PATH}"
