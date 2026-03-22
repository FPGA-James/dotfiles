-- =============================================================================
-- lua/plugins/snacks/scope.lua
-- Scope detection used by dim, indent, and jump motions.
-- Works with Treesitter (semantic) or indent (fallback).
-- =============================================================================
return {
  enabled    = true,
  treesitter = {
    enabled = true,
    blocks  = { enabled = false },
  },
  min_size   = 2,      -- minimum lines a scope must span
  max_size   = nil,    -- nil = no upper limit
  cursor     = true,   -- use cursor position for detection
  edge       = true,   -- include first/last line of the scope
  siblings   = false,
  filter = function(buf)
    return vim.bo[buf].buftype == ""
  end,
}
