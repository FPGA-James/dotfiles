-- =============================================================================
-- lua/plugins/snacks/scroll.lua
-- Smooth animated scrolling for <C-d>, <C-u>, gg, G, and jumps.
-- =============================================================================
return {
  enabled = true,
  animate = {
    duration = { step = 15, total = 250 },
    easing   = "linear",
  },
  -- Stop animating when scrolling faster than this many lines per frame.
  spamming = 10,
  filter = function(buf)
    return vim.g.snacks_scroll ~= false
      and vim.b[buf].snacks_scroll ~= false
      and vim.bo[buf].buftype ~= "terminal"
  end,
}
