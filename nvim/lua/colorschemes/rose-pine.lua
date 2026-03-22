-- =============================================================================
-- lua/colorschemes/rose-pine.lua
-- https://github.com/rose-pine/neovim
-- Install: git clone --depth 1 https://github.com/rose-pine/neovim \
--            ~/.config/nvim/pack/local/opt/rose-pine
-- =============================================================================
vim.cmd.packadd("rose-pine")

require("rose-pine").setup({
  variant      = "auto",   -- "auto"|"main"|"moon"|"dawn"
  dark_variant = "main",
  dim_inactive_windows             = false,
  extend_background_behind_borders = true,
  enable = {
    terminal_colors   = true,
    legacy_highlights = true,
    migrations        = true,
  },
  styles = {
    bold         = true,
    italic       = true,
    transparency = false,
  },
  palette          = {},
  highlight_groups = {},
})
