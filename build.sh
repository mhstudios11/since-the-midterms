#!/bin/sh
# Builds the public GitHub Pages copy (docs/index.html) from index.html.
# index.html is written for claude.ai artifacts, which add the document head
# (charset, viewport, base reset) when publishing. This script adds the same.
set -e
cd "$(dirname "$0")"
mkdir -p docs
{
  cat <<'HEAD'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<style>
:root { color-scheme: light; padding-top: env(safe-area-inset-top, 0px); padding-bottom: env(safe-area-inset-bottom, 0px); }
body { margin: 0; font-family: system-ui, -apple-system, "Segoe UI", sans-serif; font-size: 14px; }
img { max-width: 100%; }
[hidden] { display: none !important; }
</style>
HEAD
  cat index.html
  printf '\n</body>\n</html>\n'
} > docs/index.html
touch docs/.nojekyll
echo "Built docs/index.html"
