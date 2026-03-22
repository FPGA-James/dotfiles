-- =============================================================================
-- lua/plugins/snacks/terminal.lua
-- Floating / split terminal manager with named, persistent instances.
-- =============================================================================

vim.keymap.set({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Toggle terminal" })
vim.keymap.set({ "n", "t" }, "<C-_>", function() Snacks.terminal() end, { desc = "Toggle terminal" })

return {
  enabled = true,

  -- Shell command to run. nil = use $SHELL.
  shell = nil,

  win = {
    style    = "terminal",
    border   = "rounded",
    width    = 0.8,      -- fraction of editor width
    height   = 0.8,      -- fraction of editor height
    relative = "editor",
    position = "float",  -- "float"|"bottom"|"top"|"left"|"right"
  },
}
