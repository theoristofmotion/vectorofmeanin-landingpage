#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST="$ROOT/dist"
SITE_DIR="$ROOT"

rm -rf "$DIST"
mkdir -p "$DIST"

# Copy core files
for f in index.html investors.html style.css; do
  if [ -f "$SITE_DIR/$f" ]; then
    cp -v "$SITE_DIR/$f" "$DIST/"
  fi
done

# Copy assets
mkdir -p "$DIST/assets"
for f in logo.png "Book.Cover.png" "Cover Page.png" "4-Layer Architecture.png" "Development Timeline.png" "Ecosystem Layout.png"; do
  if [ -f "$SITE_DIR/$f" ]; then
    cp -v "$SITE_DIR/$f" "$DIST/assets/"
  fi
done

# Cloudflare meta
for meta in _headers _redirects robots.txt sitemap.xml 404.html; do
  if [ -f "$SITE_DIR/$meta" ]; then
    cp -v "$SITE_DIR/$meta" "$DIST/"
  fi
done

echo "Build complete -> $DIST"
