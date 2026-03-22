#!/usr/bin/env bash
# =============================================================================
# install.sh — clone all local plugins into pack/local/opt/
# Run from your ~/.config/nvim directory:
#   bash scripts/install.sh
# =============================================================================

set -e
BASE="$(cd "$(dirname "$0")/.." && pwd)/pack/local/opt"
mkdir -p "$BASE"

clone() {
  local name="$1" url="$2"
  if [[ -d "$BASE/$name" ]]; then
    echo "  ✓ $name already exists, skipping"
  else
    echo "  → cloning $name..."
    git clone --depth 1 "$url" "$BASE/$name"
  fi
}

echo "── Plugins ──────────────────────────────────────────────────────────────"
clone "which-key.nvim"      "https://github.com/folke/which-key.nvim"
clone "snacks.nvim"         "https://github.com/folke/snacks.nvim"
clone "nvim-web-devicons"   "https://github.com/nvim-tree/nvim-web-devicons"
clone "plenary.nvim"        "https://github.com/nvim-lua/plenary.nvim"
clone "git-dashboard-nvim"  "https://github.com/juansalvatore/git-dashboard-nvim"

echo ""
echo "── Colorschemes ─────────────────────────────────────────────────────────"
clone "catppuccin"         "https://github.com/catppuccin/nvim"
clone "tokyonight.nvim"    "https://github.com/folke/tokyonight.nvim"
clone "rose-pine"          "https://github.com/rose-pine/neovim"
clone "kanagawa.nvim"      "https://github.com/rebelot/kanagawa.nvim"
clone "nightfox.nvim"      "https://github.com/EdenEast/nightfox.nvim"
clone "gruvbox.nvim"       "https://github.com/ellisonleao/gruvbox.nvim"
clone "onedark.nvim"       "https://github.com/navarasu/onedark.nvim"
clone "everforest"         "https://github.com/sainnhe/everforest"
clone "dracula.nvim"       "https://github.com/Mofiqul/dracula.nvim"
clone "oxocarbon.nvim"     "https://github.com/nyoom-engineering/oxocarbon.nvim"

echo ""
echo "── Sigasi launcher script ───────────────────────────────────────────────"
LAUNCHER="$HOME/.local/bin/sigasi-ls"
mkdir -p "$HOME/.local/bin"
if [[ -f "$LAUNCHER" ]]; then
  echo "  ✓ $LAUNCHER already exists, skipping"
else
  cat > "$LAUNCHER" << 'SCRIPT'
#!/usr/bin/env bash
# Sigasi language server launcher — edit paths below to match your setup.

SIGASI_EXT="$HOME/.local/share/sigasi-ls/extension"
export SIGASI_LM_LICENSE_FILE="$HOME/.config/sigasi/sigasi.lic"
# export LM_LICENSE_FILE="27000@your-license-server"
JAVA_BIN="java"

LS_JAR=$(find "$SIGASI_EXT" -name "*.jar" 2>/dev/null | head -1)
if [[ -z "$LS_JAR" ]]; then
  # Fallback: check VS Code extensions directory
  LS_JAR=$(find "$HOME/.vscode/extensions/sigasi.sigasi-visual-hdl-"* -name "*.jar" 2>/dev/null | head -1)
fi
if [[ -z "$LS_JAR" ]]; then
  echo "sigasi-ls: ERROR — JAR not found. See README for setup instructions." >&2
  exit 1
fi
exec "$JAVA_BIN" -Xmx4g -Xms512m -XX:+UseG1GC -jar "$LS_JAR" --stdio "$@"
SCRIPT
  chmod +x "$LAUNCHER"
  echo "  ✓ created $LAUNCHER"
fi

echo ""
echo "── LSP server binaries (install separately) ─────────────────────────────"
echo "  npm install -g pyright"
echo "  npm install -g @imc-trading/svlangserver"
echo "  npm install -g yaml-language-server"
echo "  cargo install vhdl_ls"
echo "  cargo install taplo-cli --features lsp"
echo "  # Verible: https://github.com/chipsalliance/verible/releases"
echo "  # Sigasi:  https://www.sigasi.com/manual/getting-started/installation/"
echo ""
echo "Done! Open Neovim and run :checkhealth to verify."
