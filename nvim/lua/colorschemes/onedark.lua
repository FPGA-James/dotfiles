-- =============================================================================
-- lua/colorschemes/onedark.lua
-- https://github.com/navarasu/onedark.nvim
-- Styles: dark, darker, cool, deep, warm, warmer, light
-- Install: git clone --depth 1 https://github.com/navarasu/onedark.nvim \
--            ~/.config/nvim/pack/local/opt/onedark.nvim
-- =============================================================================
vim.cmd.packadd("onedark.nvim")

require("onedark").setup({
  style         = "dark",   -- "dark"|"darker"|"cool"|"deep"|"warm"|"warmer"|"light"
  transparent   = false,
  ending_tildes = false,
  cmp_itemkind_reverse = false,
  toggle_style_key  = nil,
  toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" },
  code_style = {
    comments  = "italic",
    keywords  = "none",
    functions = "none",
    strings   = "none",
    variables = "none",
  },
  lualine    = { transparent = false },
  colors     = {},
  highlights = {},
  diagnostics = { darker = true, undercurl = true, background = true },
})
