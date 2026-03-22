-- =============================================================================
-- lua/plugins/snacks/toggle.lua
-- Creates toggle objects for options, LSP features, inlay hints, etc.
-- Integrates with which-key for icons and colour feedback.
-- =============================================================================
return {
  enabled   = true,
  icon      = { enabled = " ", disabled = " " },
  color     = { enabled = "green", disabled = "yellow" },
  map       = vim.keymap.set,
  which_key = true,   -- auto-register toggles with which-key
  notify    = true,   -- show notification on toggle
}

-- ── Recommended toggles — uncomment and add to lua/plugins/which-key.lua ─────
-- or call from anywhere after Snacks is loaded:
--
--   Snacks.toggle.option("wrap"):map("<leader>uw")
--   Snacks.toggle.option("spell"):map("<leader>us")
--   Snacks.toggle.option("number"):map("<leader>un")
--   Snacks.toggle.option("relativenumber"):map("<leader>ur")
--   Snacks.toggle.option("conceallevel",{off=0,on=2}):map("<leader>uc")
--   Snacks.toggle.inlay_hints():map("<leader>lh")
--   Snacks.toggle.diagnostics():map("<leader>xd")
--   Snacks.toggle.line_number():map("<leader>ul")
--   Snacks.toggle.treesitter():map("<leader>ut")
--   Snacks.toggle.dim():map("<leader>uD")
--   Snacks.toggle.zen():map("<leader>uz")
