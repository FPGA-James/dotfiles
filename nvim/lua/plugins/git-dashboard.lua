-- =============================================================================
-- lua/plugins/git-dashboard.lua
-- git-dashboard-nvim — git contribution heatmap on the startup dashboard.
--
-- Install (run once):
--   bash scripts/install.sh
--
-- Integration: registers Snacks.dashboard.sections.git_heatmap so that
-- lua/plugins/snacks/dashboard.lua can reference { section = "git_heatmap" }.
-- This file must be required BEFORE plugins.snacks in init.lua.
-- =============================================================================

vim.cmd.packadd("plenary.nvim")
vim.cmd.packadd("git-dashboard-nvim")

require("git-dashboard-nvim").setup({
  centered                     = true,
  is_horizontal                = true,
  show_contributions_count     = true,
  show_only_weeks_with_commits = false,
  use_current_branch           = true,
  title                        = "repo_name",
  show_current_branch          = true,
  filled_squares               = { "▪", "▪", "▪", "▪", "▪" },
  empty_square                 = "▫",
  gap                          = " ",
})
