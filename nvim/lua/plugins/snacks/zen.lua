-- =============================================================================
-- lua/plugins/snacks/zen.lua
-- Distraction-free writing mode. Hides UI chrome and centers the buffer.
-- zen  = full focus mode with backdrop + dim
-- zoom = fill screen without dim (useful for presentations)
-- =============================================================================

vim.keymap.set("n", "<leader>uz", function() Snacks.zen() end,      { desc = "Zen mode" })
vim.keymap.set("n", "<leader>uZ", function() Snacks.zen.zoom() end, { desc = "Zoom window" })

return {
  enabled = true,
  toggles = {
    dim             = true,
    git_signs       = false,
    mini_diff_signs = false,
    diagnostics     = false,
    inlay_hints     = true,
  },
  show = {
    statusline = false,
    tabline    = false,
  },
  win = {
    backdrop = { transparent = true, blend = 40 },
    width    = 120,
    height   = 0,       -- 0 = full height
    zoom     = false,
    enter    = true,
    wo = {
      signcolumn     = "no",
      statuscolumn   = "",
      number         = false,
      relativenumber = false,
      foldcolumn     = "0",
    },
  },
  zoom = {
    toggles = {},
    show    = { statusline = true, tabline = true },
    win     = { backdrop = false, width = 0 },
  },
}
