-- =============================================================================
-- lua/plugins/snacks/input.lua
-- Replaces vim.ui.input() with a styled floating input box.
-- Any plugin that calls vim.ui.input (LSP rename, command palettes, etc.)
-- automatically gets this nicer UI — no extra wiring needed.
-- =============================================================================
return {
  enabled = true,

  -- ── Window style ──────────────────────────────────────────────────────────
  win = {
    -- "cursor"  = appear near the cursor
    -- "center"  = centre of the screen
    relative = "cursor",
    row      = -3,
    col      = 0,
    width    = 40,
    border   = "rounded",
    title_pos = "center",
  },
}
