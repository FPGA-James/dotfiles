# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Setup

This config targets **Neovim 0.12+** (nightly). Copy to `~/.config/nvim/`, then:

```sh
bash scripts/install.sh   # clone plugins + create sigasi-ls launcher
bash scripts/update.sh    # update all plugins later
```

LSP binaries installed separately (printed at end of install.sh):
```sh
npm install -g pyright @imc-trading/svlangserver yaml-language-server
cargo install vhdl_ls taplo-cli --features lsp
# Verible and Sigasi: see README
```

## Architecture

**Entry point:** `init.lua` loads in this order: `options` → `lsp` → `colorschemes` → plugins.

**Plugin management:** No lazy-loading framework. All plugins live under `pack/local/opt/<name>/` as plain git clones. Each plugin file calls `vim.cmd.packadd("<name>")` explicitly, then configures the plugin. To add a plugin: clone it into `pack/local/opt/`, create `lua/plugins/<name>.lua`, and `require()` it in `init.lua`.

**LSP:** Uses Neovim 0.11+'s native `vim.lsp.enable()` + `lsp/<server>.lua` discovery (no nvim-lspconfig). Server configs live in `lsp/`. Global capabilities and on-attach keymaps are in `lua/lsp.lua`. When Sigasi attaches, `vhdl_ls` is stopped on that buffer to avoid duplicate completions.

**Plugins structure:**
- `lua/plugins/snacks.lua` — assembles snacks.nvim config from per-module files in `lua/plugins/snacks/*.lua`, each returning a plain table
- `lua/plugins/which-key.lua` — leader group definitions and UI toggle keymaps

**Colorschemes:** All themes are configured in `lua/colorschemes/init.lua`. Change the active theme by editing the `vim.cmd.colorscheme()` call at the bottom of that file.

**Leader key groups** (defined in which-key): `<leader>b` buffers, `<leader>f` find/files, `<leader>g` git, `<leader>l` LSP, `<leader>t` tabs/terminal, `<leader>u` UI toggles, `<leader>w` windows, `<leader>x` diagnostics.

## Key LSP keymaps

Beyond Neovim 0.11 defaults (`K`, `grn`, `gra`, `grr`, `gri`):
- `gd` / `gD` / `gt` — definition / declaration / type definition
- `<leader>lf` — format buffer/range
- `<leader>lh` — toggle inlay hints
- `[d` / `]d` — prev/next diagnostic; `<leader>ld` — diagnostic float
