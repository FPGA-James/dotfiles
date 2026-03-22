-- =============================================================================
-- lua/colorschemes/gruvbox.lua
-- https://github.com/ellisonleao/gruvbox.nvim
-- Install: git clone --depth 1 https://github.com/ellisonleao/gruvbox.nvim \
--            ~/.config/nvim/pack/local/opt/gruvbox.nvim
-- =============================================================================
vim.cmd.packadd("gruvbox.nvim")

require("gruvbox").setup({
  terminal_colors  = true,
  undercurl        = true,
  underline        = true,
  bold             = true,
  italic = {
    strings   = true,
    emphasis  = true,
    comments  = true,
    operators = false,
    folds     = true,
  },
  strikethrough    = true,
  invert_selection = false,
  invert_signs     = false,
  invert_tabline   = false,
  invert_intend_guides = false,
  contrast         = "medium",   -- "hard"|"medium"|"soft"
  dim_inactive     = false,
  transparent_mode = false,
  palette_overrides = {},
  overrides         = {},
})
