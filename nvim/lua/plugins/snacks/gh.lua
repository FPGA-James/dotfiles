-- =============================================================================
-- lua/plugins/snacks/gh.lua
-- GitHub CLI integration — view PRs, review comments, Actions runs.
-- Requires:  gh  CLI on your $PATH and authenticated (`gh auth login`).
-- Install gh: https://cli.github.com
-- =============================================================================

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>gp",  function() Snacks.picker.git_log_line() end, { desc = "GitHub: log line" })
vim.keymap.set("n", "<leader>gP",  function() Snacks.gh.pr() end,               { desc = "GitHub: pull requests" })

return {
  enabled = true,
}
