#!/usr/bin/env bash
# =============================================================================
# update.sh — git pull all plugins in pack/local/opt/
# Run from your ~/.config/nvim directory:
#   bash scripts/update.sh
# =============================================================================

BASE="$(cd "$(dirname "$0")/.." && pwd)/pack/local/opt"

if [[ ! -d "$BASE" ]]; then
  echo "No plugins found at $BASE — run scripts/install.sh first."
  exit 1
fi

echo "Updating plugins in $BASE..."
echo ""

for dir in "$BASE"/*/; do
  name=$(basename "$dir")
  if [[ -d "$dir/.git" ]]; then
    result=$(git -C "$dir" pull --ff-only 2>&1)
    if echo "$result" | grep -q "Already up to date"; then
      echo "  ✓ $name (up to date)"
    else
      echo "  ↑ $name (updated)"
    fi
  else
    echo "  ⚠ $name (not a git repo, skipping)"
  fi
done

echo ""
echo "Done."
