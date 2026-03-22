-- =============================================================================
-- lua/plugins/snacks/bufdelete.lua
-- Deletes buffers without closing or reshuffling your window layout.
-- Replaces :bdelete with a smarter version that picks a sensible fallback buf.
-- =============================================================================
return {
  enabled = true,
}

-- ── Usage ─────────────────────────────────────────────────────────────────────
-- Call from keymaps in which-key or anywhere:
--
--   Snacks.bufdelete()           -- delete current buffer
--   Snacks.bufdelete.all()       -- delete all buffers
--   Snacks.bufdelete.other()     -- delete all buffers except current
--
-- Example keymaps (add to lua/plugins/which-key.lua wk.add() block):
--   { "<leader>bd", function() Snacks.bufdelete() end,       desc = "Delete buffer" },
--   { "<leader>bD", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },
