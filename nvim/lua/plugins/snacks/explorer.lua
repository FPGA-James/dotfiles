-- =============================================================================
-- lua/plugins/snacks/explorer.lua
-- File explorer built on top of snacks.picker.
-- Behaves like a sidebar tree; supports create/rename/delete/copy/move.
-- =============================================================================

-- ── Keymap ────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end,
  { desc = "File explorer" })

return {
  enabled = true,

  -- Replace netrw entirely (open directories with the explorer).
  replace_netrw = true,

  -- Replace netrw entirely (open directories with the explorer).
  -- Position, width, icons, follow_file etc. are picker source options —
  -- configure them under picker.sources.explorer in picker.lua.
}
