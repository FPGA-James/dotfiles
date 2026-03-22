-- =============================================================================
-- lua/colorschemes/dracula.lua
-- https://github.com/Mofiqul/dracula.nvim
-- Install: git clone --depth 1 https://github.com/Mofiqul/dracula.nvim \
--            ~/.config/nvim/pack/local/opt/dracula.nvim
-- =============================================================================
vim.cmd.packadd("dracula.nvim")

require("dracula").setup({
  transparent_bg          = false,
  show_end_of_buffer      = false,
  use_terminal_background = false,
  colors                  = {},
  overrides               = {},
  italic_comment          = true,
})
