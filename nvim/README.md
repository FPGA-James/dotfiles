# nvim — Neovim 0.12+ configuration

Modular Neovim config for FPGA/HDL development. No lazy-loading framework —
all plugins are plain git clones under `pack/local/opt/`, loaded explicitly
with `vim.cmd.packadd()`. LSP uses Neovim 0.11+'s native `vim.lsp.enable()`.

---

## Requirements

| Dependency | Purpose |
|---|---|
| **Neovim 0.12+** (nightly) | Required for `vim.pack` and `vim.lsp.enable()` |
| **Node.js** | pyright, svlangserver, yaml-language-server |
| **Rust / cargo** | vhdl_ls, taplo (optional: blink.cmp binary) |
| **Java 17+** | Sigasi language server |
| **gh CLI** | Dashboard GitHub panels (`brew install gh && gh auth login`) |
| **lazygit** | Git TUI (`brew install lazygit`) |
| **Nerd Font** | Icons in lualine, explorer, picker, gitsigns |
| **marksman** | Markdown LSP (`brew install marksman`) |

---

## Quick start

```sh
# Clone or symlink this directory to ~/.config/nvim, then:
bash scripts/install.sh     # clone all plugins + create sigasi-ls launcher
nvim                         # on first launch: treesitter parsers auto-download
                             # blink.cmp fetches its Rust binary automatically
```

Then inside Neovim:

```
:TSInstall markdown markdown_inline lua python bash toml yaml json
:checkhealth
```

### LSP server binaries

```sh
npm install -g pyright @imc-trading/svlangserver yaml-language-server
cargo install vhdl_ls taplo-cli --features lsp
brew install marksman
# Verible:  https://github.com/chipsalliance/verible/releases
# Sigasi:   https://www.sigasi.com/manual/getting-started/installation/
```

---

## Architecture

**Entry point** — `init.lua` loads in order:

```
options → lsp → colorschemes → plugins
```

**Plugin management** — No lazy.nvim or similar. Each `lua/plugins/<name>.lua` calls
`vim.cmd.packadd("<name>")` then does its own `setup()`. To add a plugin:

1. Clone into `pack/local/opt/<name>/`
2. Create `lua/plugins/<name>.lua` (packadd + setup)
3. `require("plugins.<name>")` in `init.lua`

**LSP** — `vim.lsp.enable()` in `lua/lsp.lua` discovers configs from `lsp/<server>.lua`
automatically. No nvim-lspconfig. Completion is handled by blink.cmp (native
`vim.lsp.completion` is disabled). When Sigasi attaches, `vhdl_ls` is stopped
on that buffer to prevent duplicate completions.

**Snacks** — `lua/plugins/snacks.lua` assembles config from per-module files in
`lua/plugins/snacks/*.lua`, each returning a plain table. This keeps each
module self-contained with its own keymaps.

---

## Plugins

### Core

| Plugin | Purpose |
|---|---|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, fuzzy picker, terminal, notifier, lazygit, file explorer, git browse, image rendering, indent guides, scroll animation, zen mode, scratch buffers, and more |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints popup (leader group labels) |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Async completion engine with Rust fuzzy-matcher (replaces native vim.lsp.completion) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Parser management for syntax highlighting (v1 — only installs parsers; highlighting via built-in vim.treesitter) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |

### Git

| Plugin | Purpose |
|---|---|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Inline diff signs, hunk staging/reset, blame, word diff |
| [git-dashboard-nvim](https://github.com/juansalvatore/git-dashboard-nvim) | Git contribution heatmap on the dashboard |

### Markdown / Notes

| Plugin | Purpose |
|---|---|
| [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) | Obsidian vault integration — wikilinks, daily notes, backlinks, tags, templates |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | In-editor markdown rendering — headings, code blocks, checkboxes, tables, bullets |

### Testing

| Plugin | Purpose |
|---|---|
| [neotest](https://github.com/nvim-neotest/neotest) | Test runner framework |
| [neotest-python](https://github.com/nvim-neotest/neotest-python) | pytest adapter |

### AI

| Plugin | Purpose |
|---|---|
| [claude-code.nvim](https://github.com/greggh/claude-code.nvim) | Claude Code CLI in a floating terminal; auto-reloads files Claude edits |

### Dependencies

| Plugin | Purpose |
|---|---|
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO library (neotest) |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |

---

## LSP servers

| Server | Language | Install |
|---|---|---|
| `pyright` | Python | `npm i -g pyright` |
| `verible_verilog_ls` | SystemVerilog (lint, format, nav) | [verible releases](https://github.com/chipsalliance/verible/releases) |
| `svlangserver` | SystemVerilog (Verilator-backed lint) | `npm i -g @imc-trading/svlangserver` |
| `vhdl_ls` | VHDL | `cargo install vhdl_ls` |
| `taplo` | TOML | `cargo install taplo-cli --features lsp` |
| `yamlls` | YAML | `npm i -g yaml-language-server` |
| `marksman` | Markdown (wikilink go-to-def) | `brew install marksman` |
| `sigasi` | VHDL / SV (commercial, needs license) | [sigasi docs](https://www.sigasi.com/manual/getting-started/installation/) |

On VHDL buffers, if Sigasi attaches it automatically stops `vhdl_ls` to avoid duplicate hover/completion (Verible stays active for formatting).

---

## Colorschemes

All themes are pre-configured in `lua/colorschemes/`. Change the active theme
by editing the `vim.cmd.colorscheme()` call at the bottom of `lua/colorschemes/init.lua`.

Available: `catppuccin` · `tokyonight` · `rose-pine` · `kanagawa` · `nightfox` · `gruvbox` · `onedark` · `everforest` · `dracula` · `oxocarbon`

---

## Key bindings

**Leader:** `<Space>`

### Quick access

| Key | Action |
|---|---|
| `<leader><leader>` | Find files |
| `<leader><space>` or `<leader>,` | Switch buffers |
| `<leader>:` | Command history |
| `<leader>e` | File explorer (sidebar) |
| `<leader>.` | Scratch buffer |

### Find / Files (`<leader>f`)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fc` | Find file in config dir |
| `<leader>fg` | Live grep |
| `<leader>fw` | Grep word under cursor |
| `<leader>fs` | Grep selection |
| `<leader>fb` | Lines in current buffer |
| `<leader>fB` | Grep open buffers |
| `<leader>fh` | Help pages |
| `<leader>fH` | Highlights |
| `<leader>fk` | Keymaps |
| `<leader>fK` | Commands |
| `<leader>fm` | Marks |
| `<leader>fR` | Registers |
| `<leader>fj` | Jump list |
| `<leader>fq` | Quickfix list |
| `<leader>fl` | Location list |
| `<leader>fu` | Undo history |

### Git (`<leader>g`)

Gitsigns keymaps are **buffer-local** (active in git-tracked files); snacks picker / lazygit keymaps are global.

| Key | Action | Source |
|---|---|---|
| `<leader>gg` | Lazygit (repo root) | lazygit |
| `<leader>gf` | Lazygit log (current file) | lazygit |
| `<leader>gl` | Lazygit log (cwd) | lazygit |
| `<leader>gb` | Open file/selection in browser | gitbrowse |
| `<leader>gc` | Git log picker | picker |
| `<leader>gd` | Git diff hunks picker | picker |
| `<leader>gL` | Git log line picker | picker |
| `<leader>gA` | GitHub Actions runs | gh |
| `<leader>gs` | Stage hunk | gitsigns |
| `<leader>gr` | Reset hunk | gitsigns |
| `<leader>gS` | Stage buffer | gitsigns |
| `<leader>gR` | Reset buffer | gitsigns |
| `<leader>gu` | Undo stage hunk | gitsigns |
| `<leader>gp` | Preview hunk (float) | gitsigns |
| `<leader>gP` | Preview hunk inline | gitsigns |
| `<leader>gD` | Diff vs HEAD~ | gitsigns |
| `<leader>gB` | Blame buffer | gitsigns |
| `]h` / `[h` | Next / prev hunk | gitsigns |
| `]H` / `[H` | Last / first hunk | gitsigns |
| `ih` / `ah` | Hunk text object (op/visual) | gitsigns |

### LSP (`<leader>l`)

Navigation keys (`gd` etc.) open the snacks picker for multi-result sources.

| Key | Action |
|---|---|
| `gd` | Go to definition (picker) |
| `gD` | Go to declaration (picker) |
| `gt` | Go to type definition (picker) |
| `gr` | References (picker) |
| `gI` | Implementations (picker) |
| `K` | Hover |
| `grn` | Rename |
| `gra` | Code action |
| `gO` | Document symbols |
| `<leader>lf` | Format buffer / range |
| `<leader>lh` | Toggle inlay hints |
| `<leader>ls` | LSP symbols (buffer) |
| `<leader>lS` | LSP symbols (workspace) |
| `<leader>ld` | Diagnostics picker |
| `<leader>lq` | Diagnostics → loclist |
| `<leader>lwa` | Add workspace folder |
| `<leader>lwr` | Remove workspace folder |
| `<leader>lwl` | List workspace folders |
| `[d` / `]d` | Prev / next diagnostic |

### Test (`<leader>T`)

| Key | Action |
|---|---|
| `<leader>Tr` | Run nearest test |
| `<leader>Tf` | Run test file |
| `<leader>Tl` | Re-run last test |
| `<leader>Ts` | Toggle summary panel |
| `<leader>To` | Toggle output panel |
| `<leader>TS` | Stop test |
| `]t` / `[t` | Next / prev failed test |

### Terminal (`<leader>t`)

Terminals open as a full-width ivy-style bottom panel.

| Key | Action |
|---|---|
| `<C-/>` | Toggle terminal |
| `<leader>tt` | Terminal (bottom split) |
| `<leader>tf` | Terminal (floating) |

### Obsidian (`<leader>o`)

All keymaps work from any buffer. `<CR>`, `<leader>oc`, and `<leader>oa` are buffer-local (markdown only).

| Key | Action |
|---|---|
| `<leader>on` | New note |
| `<leader>of` | Find note |
| `<leader>og` | Grep vault |
| `<leader>od` | Daily note (today) |
| `<leader>oD` | Daily note (yesterday) |
| `<leader>ob` | Backlinks |
| `<leader>ot` | Tags picker |
| `<leader>ol` | Links in buffer |
| `<leader>oL` | Link selection to new note |
| `<leader>op` | Paste image |
| `<leader>or` | Rename note |
| `<leader>oo` | Open in Obsidian app |
| `<leader>oT` | Insert template |
| `<leader>ow` | Switch workspace |
| `<leader>oc` | Toggle checkbox |
| `<leader>oa` | Smart action (follow / create link) |
| `<CR>` | Follow / create link under cursor |

### AI / Claude Code (`<leader>a`)

| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude Code terminal |
| `<leader>aR` | Resume last conversation |
| `<leader>aV` | Launch with verbose output |

### Buffers (`<leader>b`)

| Key | Action |
|---|---|
| `<leader>bd` | Delete buffer |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Prev buffer |
| `<leader>ba` | Open all buffers |

### Windows (`<leader>w`)

| Key | Action |
|---|---|
| `<leader>wh/j/k/l` | Navigate to window |
| `<leader>ws` | Horizontal split |
| `<leader>wv` | Vertical split |
| `<leader>wq` | Close window |

### Diagnostics / Quickfix (`<leader>x`)

| Key | Action |
|---|---|
| `<leader>xx` | Diagnostics (buffer) |
| `<leader>xX` | Diagnostics (workspace) |
| `<leader>xq` | Quickfix list |
| `<leader>xl` | Location list |
| `<leader>xn` / `<leader>xp` | Next / prev diagnostic |

### UI Toggles (`<leader>u`)

| Key | Action |
|---|---|
| `<leader>uz` | Zen mode |
| `<leader>uZ` | Zoom window |
| `<leader>ub` | Toggle line blame |
| `<leader>uD` | Toggle deleted lines |
| `<leader>uW` | Toggle word diff |
| `<leader>uG` | Toggle git signs |
| `<leader>uN` | Toggle line numbers |
| `<leader>ur` | Toggle relative numbers |
| `<leader>uw` | Toggle line wrap |
| `<leader>us` | Toggle spell check |
| `<leader>uh` | Clear search highlights |
| `<leader>ul` | Toggle list chars |
| `<leader>un` | Dismiss all notifications |

### Completion (blink.cmp)

| Key | Action |
|---|---|
| `<C-n>` / `<C-p>` | Navigate items |
| `<C-y>` | Accept item |
| `<C-e>` | Cancel |

---

## Sigasi setup

Sigasi is a commercial VHDL/SystemVerilog language server requiring a license.

1. Install the Sigasi VS Code extension (`.vsix`) and extract the JAR, **or** let the VS Code extension install it to `~/.vscode/extensions/sigasi.sigasi-visual-hdl-*/`
2. The launcher script `~/.local/bin/sigasi-ls` is created by `install.sh` — edit it to set your license path:
   ```sh
   export SIGASI_LM_LICENSE_FILE="$HOME/.config/sigasi/sigasi.lic"
   # or floating: export LM_LICENSE_FILE="27000@your-license-server"
   ```
3. From your HDL project root, run `bash scripts/scaffold_project.sh` to create the LSP root markers

---

## Scripts

| Script | Purpose |
|---|---|
| `scripts/install.sh` | Clone all plugins + create `~/.local/bin/sigasi-ls` launcher |
| `scripts/update.sh` | `git pull` in every plugin directory |
| `scripts/scaffold_project.sh` | Create LSP root files for a new HDL project |
