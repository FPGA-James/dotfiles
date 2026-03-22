# nvim — Neovim 0.12+ configuration

Modular Neovim config using native `vim.pack` / `lsp/` APIs.
All plugins are stored locally under `pack/local/opt/` — nothing is fetched at startup.

## Requirements

- **Neovim 0.12+** (nightly until 0.12 releases)
- **Java 17+** — required for the Sigasi LSP server
- **Node.js** — for pyright, svlangserver, yaml-language-server
- **Rust / cargo** — for vhdl_ls, taplo
- **gh CLI** — for dashboard GitHub panels (`brew install gh`, then `gh auth login`)
- **Nerd Font** — for lualine separators and gitsigns symbols

## Quick start

```sh
cp -r nvim ~/.config/nvim
cd ~/.config/nvim
bash scripts/install.sh
nvim
```

## Architecture

**Entry point:** `init.lua` loads in order: `options` → `lsp` → `colorschemes` → plugins.

**Plugin management:** No lazy-loading framework. All plugins live under `pack/local/opt/<name>/` as plain git clones. Each `lua/plugins/<name>.lua` calls `vim.cmd.packadd("<name>")` then configures the plugin. To add a plugin: clone it into `pack/local/opt/`, create `lua/plugins/<name>.lua`, and `require()` it in `init.lua`.

**LSP:** Uses Neovim 0.11+'s native `vim.lsp.enable()` + `lsp/<server>.lua` discovery. Server configs live in `lsp/`. Global capabilities and on-attach keymaps are in `lua/lsp.lua`.

## Plugins

| Plugin | Purpose |
|---|---|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard, picker, terminal, notifier, git browse, and more |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints popup |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline with LSP server name |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Inline git diff signs, hunk staging, blame |
| [neotest](https://github.com/nvim-neotest/neotest) + [neotest-python](https://github.com/nvim-neotest/neotest-python) | Test runner with pytest adapter |
| [git-dashboard-nvim](https://github.com/juansalvatore/git-dashboard-nvim) | Git contribution heatmap |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (dependency) |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO library (neotest dependency) |

## Colorschemes

All themes are configured in `lua/colorschemes/init.lua`. Change the active theme by editing the `vim.cmd.colorscheme()` call at the bottom of that file.

Available: catppuccin, tokyonight, rose-pine, kanagawa, nightfox, gruvbox, onedark, everforest, dracula, oxocarbon.

## Key bindings

Leader key: `\`

### Find / Files (`<leader>f`)

| Key | Action |
|---|---|
| `<leader><leader>` | Find files |
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fc` | Find config file |
| `<leader>fg` | Grep (live) |
| `<leader>fw` | Grep word under cursor |
| `<leader>fb` | Buffer lines |
| `<leader>fh` | Help pages |
| `<leader>fk` | Keymaps |

### Git (`<leader>g`)

| Key | Action |
|---|---|
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer |
| `<leader>gR` | Reset buffer |
| `<leader>gu` | Undo stage hunk |
| `<leader>gp` | Preview hunk (float) |
| `<leader>gP` | Preview hunk inline |
| `<leader>gd` | Diff vs index |
| `<leader>gD` | Diff vs HEAD |
| `<leader>gb` | Blame line |
| `<leader>gB` | Blame buffer |
| `<leader>gc` | Git log (picker) |
| `<leader>gL` | Git log line (picker) |
| `]h` / `[h` | Next / prev hunk |
| `]H` / `[H` | Last / first hunk |

### LSP (`<leader>l`)

| Key | Action |
|---|---|
| `gd` / `gD` / `gt` | Definition / declaration / type definition |
| `gr` | References |
| `K` | Hover |
| `<leader>lf` | Format buffer |
| `<leader>lh` | Toggle inlay hints |
| `<leader>ld` | Diagnostics (picker) |
| `<leader>ls` | LSP symbols (buffer) |
| `<leader>lS` | LSP symbols (workspace) |
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

| Key | Action |
|---|---|
| `<leader>tt` | Terminal (split) |
| `<leader>tf` | Terminal (float) |
| `<C-/>` | Toggle terminal |

### UI Toggles (`<leader>u`)

| Key | Action |
|---|---|
| `<leader>ub` | Toggle line blame |
| `<leader>uD` | Toggle deleted lines |
| `<leader>uW` | Toggle word diff |
| `<leader>uG` | Toggle git signs |
| `<leader>uN` | Toggle line numbers |
| `<leader>ur` | Toggle relative numbers |
| `<leader>uw` | Toggle line wrap |
| `<leader>us` | Toggle spell check |

## Sigasi setup

1. Extract server JAR from the VS Code VSIX (see `lsp/sigasi.lua` for full instructions)
2. Edit `~/.local/bin/sigasi-ls` (created by `install.sh`) with your license path
3. Run `bash scripts/scaffold_project.sh` from your HDL project root

## Scripts

| Script | Purpose |
|---|---|
| `scripts/install.sh` | Clone all plugins + create sigasi-ls launcher |
| `scripts/update.sh` | `git pull` all plugins |
| `scripts/scaffold_project.sh` | Create LSP root files for a new project |
