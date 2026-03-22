-- =============================================================================
-- lua/colorschemes/oxocarbon.lua
-- https://github.com/nyoom-engineering/oxocarbon.nvim
-- IBM Carbon design inspired — deep blacks, cyan accents.
-- Install: git clone --depth 1 https://github.com/nyoom-engineering/oxocarbon.nvim \
--            ~/.config/nvim/pack/local/opt/oxocarbon.nvim
-- NOTE: No setup() call — configure via highlight overrides after load.
-- =============================================================================
vim.cmd.packadd("oxocarbon.nvim")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern  = "oxocarbon",
  group    = vim.api.nvim_create_augroup("OxocarbonOverrides", { clear = true }),
  callback = function()
    -- Add highlight overrides here, e.g.:
    -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#525252" })
  end,
})
