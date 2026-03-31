-- =============================================================================
-- lua/plugins/treesitter.lua
-- nvim-treesitter v1.0+ — parser installation and management only
--
-- API break from legacy: v1 removed the configs module entirely.
-- Highlighting and indentation are now Neovim 0.10+ builtins (vim.treesitter).
-- This plugin only handles parser downloads and :TSInstall / :TSUpdate.
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/nvim-treesitter/nvim-treesitter \
--     ~/.config/nvim/pack/local/opt/nvim-treesitter
--
-- Install parsers (run inside Neovim after first launch):
--   :TSInstall markdown markdown_inline lua python bash toml yaml json
--   :TSUpdate          (to update all installed parsers later)
-- =============================================================================

vim.cmd.packadd("nvim-treesitter")

-- setup() in v1 only accepts { install_dir = "..." }.
-- Parsers are stored in stdpath('data')/site by default.
require("nvim-treesitter").setup()

-- ── Highlighting ───────────────────────────────────────────────────────────────
-- Neovim's built-in vim.treesitter.start() activates highlighting for any
-- buffer whose filetype has an installed parser. pcall silently skips others.
vim.api.nvim_create_autocmd("FileType", {
  group    = vim.api.nvim_create_augroup("UserTreesitterHL", { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
