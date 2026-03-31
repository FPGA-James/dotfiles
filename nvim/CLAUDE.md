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

After setup, open Neovim and run `:checkhealth` to verify.

## Architecture

**Entry point:** `init.lua` loads in this order: `options` → `lsp` → `colorschemes` → plugins.

**Plugin management:** No lazy-loading framework. All plugins live under `pack/local/opt/<name>/` as plain git clones. Each plugin file calls `vim.cmd.packadd("<name>")` explicitly, then configures the plugin. To add a plugin: clone it into `pack/local/opt/`, create `lua/plugins/<name>.lua`, and `require()` it in `init.lua`.

**LSP:** Uses Neovim 0.11+'s native `vim.lsp.enable()` + `lsp/<server>.lua` discovery (no nvim-lspconfig). Server configs live in `lsp/`. Global capabilities and on-attach keymaps are in `lua/lsp.lua`. When Sigasi attaches, `vhdl_ls` is stopped on that buffer to avoid duplicate completions.

**Plugins structure:**
- `lua/plugins/snacks.lua` — assembles snacks.nvim config from per-module files in `lua/plugins/snacks/*.lua`, each returning a plain table
- `lua/plugins/snacks/picker.lua` — fuzzy picker (Telescope replacement); overrides `gd`/`gD`/`gr`/`gt` to use picker UI; `<leader>f*` find keymaps, `<leader>g*` git log/diff keymaps
- `lua/plugins/snacks/explorer.lua` — sidebar file tree (`<leader>e`), replaces netrw
- `lua/plugins/blink-cmp.lua` — async completion engine (replaces native LSP completion); sources: LSP, path, snippets, buffer; in markdown also obsidian wikilinks/tags
- `lua/plugins/conform.lua` — external formatters (black, stylua, verible, prettier); overrides `<leader>lf` to run conform first, LSP as fallback; format-on-save toggled via `<leader>uf`
- `lua/plugins/flash.lua` — 2-3 keystroke jump anywhere (`s`/`S`/`r`/`R`)
- `lua/plugins/obsidian.lua` — Obsidian vault integration (`<leader>o*` keymaps); vault at `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ai_vault`
- `lua/plugins/render-markdown.lua` — in-editor markdown rendering (obsidian.nvim UI disabled to avoid conflicts)
- `lua/plugins/which-key.lua` — leader group definitions and UI toggle keymaps
- `lua/plugins/neotest.lua` — pytest test runner (`<leader>T` keymaps, `]t`/`[t` jump)
- `lua/plugins/claude-code.lua` — Claude Code CLI integration (`<leader>a` keymaps)
- `lua/plugins/diffview.lua` — git diff/merge tool
- `lua/plugins/treesitter.lua` — syntax highlighting + text objects
- `lua/plugins/mini-ai.lua` — extended text objects (`a`/`i` motions)
- `lua/plugins/nvim-surround.lua` — surround operations (`ys`/`cs`/`ds`; visual `S`)

**Colorschemes:** All themes are configured in `lua/colorschemes/init.lua`. Change the active theme by editing the `vim.cmd.colorscheme()` call at the bottom of that file.

**Leader key groups** (defined in which-key): `<leader>a` AI/claude, `<leader>b` buffers, `<leader>e` explorer, `<leader>f` find/files, `<leader>g` git, `<leader>l` LSP, `<leader>lw` LSP workspace, `<leader>n` notifications, `<leader>o` Obsidian, `<leader>p` profiler, `<leader>t` terminal, `<leader>T` test, `<leader>u` UI toggles, `<leader>w` windows, `<leader>x` diagnostics/quickfix.

## Key keymaps

**Navigation (snacks picker-backed):**
- `gd` / `gD` / `gt` — definition / declaration / type definition (opens picker)
- `gr` — references (picker); `gI` — implementations (picker)
- `<leader>ff` / `<leader><leader>` — find files; `<leader>fg` — live grep; `<leader>fw` — grep word under cursor
- `<leader>fr` — recent files; `<leader>fb` — buffer lines; `<leader>fB` — grep open buffers
- `<leader>fh` — help pages; `<leader>fk` — keymaps; `<leader>fu` — undo history
- `<leader>,` / `<leader><space>` — buffers; `<leader>:` — command history

**Git (snacks picker-backed):**
- `<leader>gc` — git log; `<leader>gf` — git status (files); `<leader>gd` — git diff hunks
- `<leader>gZ` — git stash; `<leader>gL` — git log (current line)

**Flash jump:**
- `s` (n/x/o) — flash jump; `S` (n/o) — treesitter node select
- `r` (o) — remote flash (apply operator at jump target); `R` (o/x) — treesitter remote
- `<C-s>` (c) — toggle flash during `/` search

**LSP (on-attach, from `lua/lsp.lua`):**
- `<leader>lf` — format buffer/range (conform first, LSP fallback); `<leader>lh` — toggle inlay hints
- `<leader>ls` / `<leader>lS` — LSP symbols (buffer / workspace)
- `<leader>ld` — diagnostics picker; `<leader>lq` — diagnostics to loclist
- `[d` / `]d` — prev/next diagnostic (with float)
- `<leader>lwa` / `<leader>lwr` / `<leader>lwl` — add/remove/list workspace folders
- Neovim 0.11 defaults: `K` hover, `grn` rename, `gra` code action, `gri` implementation, `gO` document symbols

**Completion (blink-cmp):**
- `<C-n>` / `<C-p>` — navigate; `<C-y>` — accept; `<C-e>` — cancel

**Obsidian (`<leader>o*`):**
- `<leader>of` — quick switch (find note); `<leader>og` — grep vault; `<leader>on` — new note
- `<leader>od` / `<leader>oD` — today/yesterday daily note; `<leader>ob` — backlinks
- `<leader>ot` — tags; `<leader>ol` — links in buffer; `<leader>oo` — open in Obsidian app
- In Obsidian buffers: `<CR>` — follow/create link; `<leader>oc` — toggle checkbox

**Test (neotest):**
- `<leader>Tr` — run nearest test; `<leader>Tf` — run file; `<leader>Tl` — re-run last
- `<leader>Ts` — summary panel; `<leader>To` — output panel; `<leader>TS` — stop
- `]t` / `[t` — next/prev failed test

**Claude Code:**
- `<leader>ac` — toggle Claude Code terminal (normal + terminal mode)
- `<leader>aR` — resume last conversation; `<leader>aV` — launch verbose
