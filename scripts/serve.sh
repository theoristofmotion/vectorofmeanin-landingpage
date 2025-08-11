#!/usr/bin/env bash
set -euo pipefail
PORT="${PORT:-8000}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/dist"
[ -d "$DIR" ] || { echo "dist not found. Run scripts/build.sh first."; exit 1; }
cd "$DIR"
python3 -m http.server "$PORT"
