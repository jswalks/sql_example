#!/usr/bin/env bash
# ============================================================================
# build.sh
#
# (Re)builds the Pokemon database from scratch: schema first, then every
# seed file in order. Safe to run again at any time -- it deletes the old
# database file and starts fresh, so you always end up in a known state.
#
# Usage (from anywhere in the repo):
#   ./db/build.sh
# ============================================================================
set -euo pipefail

# Move to the repo root regardless of where this script is called from.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$REPO_ROOT"

if ! command -v duckdb >/dev/null 2>&1; then
    echo "error: the 'duckdb' command was not found on your PATH." >&2
    echo "       Install it first -- see the 'Install DuckDB' section of README.md." >&2
    exit 1
fi

DB_PATH="data/pokemon.duckdb"

mkdir -p data
rm -f "$DB_PATH"

echo "Creating tables..."
duckdb "$DB_PATH" < db/schema.sql

for seed_file in db/seed/*.sql; do
    echo "Loading $seed_file..."
    duckdb "$DB_PATH" < "$seed_file"
done

echo ""
echo "Done. $DB_PATH now contains:"
duckdb "$DB_PATH" -c "
    SELECT 'types'         AS table_name, COUNT(*) AS rows FROM types
    UNION ALL SELECT 'trainers',      COUNT(*) FROM trainers
    UNION ALL SELECT 'species',       COUNT(*) FROM species
    UNION ALL SELECT 'pokemon',       COUNT(*) FROM pokemon
    UNION ALL SELECT 'moves',         COUNT(*) FROM moves
    UNION ALL SELECT 'pokemon_moves', COUNT(*) FROM pokemon_moves
    UNION ALL SELECT 'gyms',          COUNT(*) FROM gyms
    UNION ALL SELECT 'gym_badges',    COUNT(*) FROM gym_badges
    UNION ALL SELECT 'battles',       COUNT(*) FROM battles
    ORDER BY table_name;
"
