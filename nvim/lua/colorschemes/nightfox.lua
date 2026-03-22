-- =============================================================================
-- lua/colorschemes/nightfox.lua
-- https://github.com/EdenEast/nightfox.nvim
-- Schemes: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
-- Install: git clone --depth 1 https://github.com/EdenEast/nightfox.nvim \
--            ~/.config/nvim/pack/local/opt/nightfox.nvim
-- =============================================================================
vim.cmd.packadd("nightfox.nvim")

require("nightfox").setup({
  options = {
    compile_path        = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent         = false,
    terminal_colors     = true,
    dim_inactive        = false,
    module_default      = true,
    styles = {
      comments    = "italic",
      conditionals = "NONE",
      constants   = "NONE",
      functions   = "NONE",
      keywords    = "NONE",
      numbers     = "NONE",
      operators   = "NONE",
      strings     = "NONE",
      types       = "NONE",
      variables   = "NONE",
    },
    inverse = { match_paren = false, visual = false, search = false },
  },
  palettes  = {},
  specs     = {},
  groups    = {},
})
