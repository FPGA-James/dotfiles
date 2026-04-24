-- =============================================================================
-- lua/plugins/md-agenda.lua
-- md-agenda.nvim — Markdown time/task management, org-agenda-inspired
--
-- Source location (local):
--   ~/.config/nvim/pack/local/opt/md-agenda.nvim/
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/zenarvus/md-agenda.nvim \
--     ~/.config/nvim/pack/local/opt/md-agenda.nvim
--
-- Requires ripgrep (`rg`) on $PATH.
--
-- CheckTask/CancelTask are buffer-local commands the plugin only creates
-- inside filetype=markdown buffers — the keymaps below are global, matching
-- the plugin's own README example, but only resolve in a markdown buffer.
-- =============================================================================

vim.cmd.packadd("md-agenda.nvim")

require("md-agenda").setup({
  agendaFiles = {
    "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ai_vault",
  },
  logbookFolding = true,
})
vim.o.foldmethod = "marker"

local map = vim.keymap.set
map("n", "<leader>av", "<cmd>AgendaView<CR>",      { desc = "Agenda view" })
map("n", "<leader>ad", "<cmd>AgendaDashboard<CR>", { desc = "Agenda dashboard" })
map("n", "<leader>ah", "<cmd>HabitView<CR>",       { desc = "Habit view" })
map("n", "<leader>ac", "<cmd>CheckTask<CR>",       { desc = "Check task" })
map("n", "<leader>ax", "<cmd>CancelTask<CR>",      { desc = "Cancel task" })
map("n", "<leader>as", "<cmd>TaskScheduled<CR>",   { desc = "Schedule task" })
map("n", "<leader>au", "<cmd>TaskDeadline<CR>",    { desc = "Set task deadline" })
