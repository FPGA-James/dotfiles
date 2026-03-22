-- =============================================================================
-- lua/colorschemes/tokyonight.lua
-- https://github.com/folke/tokyonight.nvim
-- Install: git clone --depth 1 https://github.com/folke/tokyonight.nvim \
--            ~/.config/nvim/pack/local/opt/tokyonight.nvim
-- =============================================================================
vim.cmd.packadd("tokyonight.nvim")

require("tokyonight").setup({
  style       = "moon",       -- "night"|"storm"|"day"|"moon"
  light_style = "day",
  transparent = false,
  styles = {
    comments  = { italic = true },
    keywords  = { italic = true },
    functions = {},
    variables = {},
    sidebars  = "dark",
    floats    = "dark",
  },
  sidebars        = { "qf", "help", "terminal" },
  day_brightness  = 0.3,
  dim_inactive    = false,
  terminal_colors = true,
  on_colors       = function(_) end,
  on_highlights   = function(_, _) end,
})
