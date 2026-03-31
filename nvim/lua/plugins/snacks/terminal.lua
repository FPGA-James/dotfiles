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
    border   = "top",    -- ivy style: only a top border separating from editor
    height   = 0.35,     -- fraction of editor height (ivy-style compact panel)
    position = "bottom", -- full-width bottom panel, like the ivy picker
  },
}
