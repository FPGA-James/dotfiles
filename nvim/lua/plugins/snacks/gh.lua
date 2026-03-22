-- =============================================================================
-- lua/plugins/snacks/gh.lua
-- GitHub CLI integration — view PRs, review comments, Actions runs.
-- Requires:  gh  CLI on your $PATH and authenticated (`gh auth login`).
-- Install gh: https://cli.github.com
-- =============================================================================

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>gp",  function() Snacks.picker.git_log_line() end, { desc = "GitHub: log line" })
vim.keymap.set("n", "<leader>gP",  function() Snacks.gh.prs() end,              { desc = "GitHub: pull requests" })
vim.keymap.set("n", "<leader>gA",  function() Snacks.gh.actions() end,          { desc = "GitHub: Actions runs" })

return {
  enabled = true,
}
