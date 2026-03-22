-- =============================================================================
-- init.lua — Neovim >= 0.12 (nightly) entry point
-- =============================================================================
-- Requires Neovim 0.12+ for vim.pack. Current stable is 0.11;
-- grab a nightly build from: https://github.com/neovim/neovim/releases/tag/nightly
--
-- Plugin source strategy
-- ─────────────────────
-- All plugins live LOCALLY under:
--   ~/.config/nvim/pack/local/opt/<plugin-name>/
--
-- vim.pack manages remote Git repos; for local plugins we use plain packadd.
-- Each file under lua/plugins/ is responsible for its own packadd + setup.
-- To add a new plugin:
--   1. Clone / copy it into  pack/local/opt/<name>/
--   2. Create                lua/plugins/<name>.lua  (packadd + setup)
--   3. require() it below
-- =============================================================================

-- ── 1. Core options ───────────────────────────────────────────────────────────
require("options")

-- ── 2. LSP ────────────────────────────────────────────────────────────────────
require("lsp")

-- ── 3. Colorschemes (load before plugins so colors are ready) ─────────────────
require("colorschemes")

-- ── 4. Plugins ────────────────────────────────────────────────────────────────
require("plugins.lualine")
require("plugins.neotest")
require("plugins.gitsigns")
require("plugins.which-key")
require("plugins.git-dashboard")
require("plugins.snacks")
