-- =============================================================================
-- lua/plugins/snacks/dim.lua
-- Dims all code outside the current scope, keeping focus on the active block.
-- Works with Treesitter for semantic scopes (falls back to indent).
-- Toggle with Snacks.dim() or wire to a keymap.
-- =============================================================================
return {
  enabled = true,

  -- Scope detection settings (shared with snacks.scope).
  scope = {
    -- Minimum lines a scope must span to trigger dimming.
    min_size = 5,

    -- Maximum lines above the cursor to search for a scope start.
    max_size = nil,

    -- Include sibling lines at the same indent level.
    siblings = false,
  },

  -- Highlight group used for dimmed text.
  -- Overriding this lets you set a custom dim colour or transparency.
  -- Default is linked to the built-in "Comment" group (usually grey).
  -- Example custom override (put in your colorscheme setup, not here):
  --   vim.api.nvim_set_hl(0, "SnacksDimmed", { fg = "#555555", bg = "NONE" })
  animate = {
    enabled = vim.fn.has("nvim-0.9") == 1,  -- smooth dim transition
    easing  = "outQuad",
    duration = { step = 20, total = 300 },
  },

  -- Filetypes where dim is never activated.
  filter = function(buf)
    return vim.g.snacks_dim ~= false
      and vim.b[buf].snacks_dim ~= false
      and vim.bo[buf].buftype == ""
  end,
}
