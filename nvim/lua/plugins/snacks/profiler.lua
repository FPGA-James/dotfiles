-- =============================================================================
-- lua/plugins/snacks/profiler.lua
-- Neovim Lua profiler — flame graph + scratch buffer for startup analysis.
-- Usage:
--   :lua Snacks.profiler.start()   begin profiling
--   :lua Snacks.profiler.stop()    stop and open results
--   :lua Snacks.profiler.scratch() open results in a scratch buffer
-- =============================================================================

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>ps", function() Snacks.profiler.scratch() end,
  { desc = "Profiler scratch" })

return {
  enabled = true,

  -- Autocmds to profile automatically (useful to measure startup cost).
  -- autocmds = { "BufReadPost", "FileType", "LspAttach" },

  -- Pick which runtime events to trace.
  -- Low-overhead tracing: "require" is the most useful for startup.
  require = true,

  -- Highlight groups used in the output.
  -- Leave empty to use snacks defaults.
  hl = {},
}
