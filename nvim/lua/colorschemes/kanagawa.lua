-- =============================================================================
-- lua/colorschemes/kanagawa.lua
-- https://github.com/rebelot/kanagawa.nvim
-- Install: git clone --depth 1 https://github.com/rebelot/kanagawa.nvim \
--            ~/.config/nvim/pack/local/opt/kanagawa.nvim
-- =============================================================================
vim.cmd.packadd("kanagawa.nvim")

require("kanagawa").setup({
  compile        = false,
  undercurl      = true,
  commentStyle   = { italic = true },
  functionStyle  = {},
  keywordStyle   = { italic = true },
  statementStyle = { bold = true },
  typeStyle      = {},
  transparent    = false,
  dimInactive    = false,
  terminalColors = true,
  colors         = { palette = {}, theme = { wave = {}, lotus = {}, dragon = {}, all = {} } },
  overrides      = function(_) return {} end,
  theme          = "wave",          -- "wave"|"dragon"|"lotus"
  background     = { dark = "wave", light = "lotus" },
})
