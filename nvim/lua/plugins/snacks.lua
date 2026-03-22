-- =============================================================================
-- lua/plugins/snacks.lua
-- snacks.nvim — collection of QoL plugins by folke
--
-- Install (run once in your shell):
--   git clone --depth 1 https://github.com/folke/snacks.nvim \
--     ~/.config/nvim/pack/local/opt/snacks.nvim
--
-- Dependencies:
--   git clone --depth 1 https://github.com/nvim-tree/nvim-web-devicons \
--     ~/.config/nvim/pack/local/opt/nvim-web-devicons
--
-- Structure:
--   This file loads dependencies, then requires each module's config from
--   lua/plugins/snacks/<module>.lua — each returns a plain table.
--   All tables are assembled here and passed to Snacks.setup() once.
--
-- To disable a module:   set its table value to { enabled = false }
-- To enable a module:    uncomment its require() and ensure the table
--                        has enabled = true (or omit — default is true)
-- =============================================================================

-- ── Dependencies ──────────────────────────────────────────────────────────────
-- nvim-web-devicons provides file icons throughout snacks (picker, explorer,
-- dashboard). Optional but strongly recommended.
vim.cmd.packadd("nvim-web-devicons")

-- ── Load snacks itself ────────────────────────────────────────────────────────
vim.cmd.packadd("snacks.nvim")

-- ── Assemble config from per-module files ─────────────────────────────────────
-- Each require() returns a config table for that snacks module.
-- Comment out any line to completely skip that module.
Snacks.setup({
  animate      = require("plugins.snacks.animate"),
  bigfile      = require("plugins.snacks.bigfile"),
  bufdelete    = require("plugins.snacks.bufdelete"),
  dashboard    = require("plugins.snacks.dashboard"),
  dim          = require("plugins.snacks.dim"),
  explorer     = require("plugins.snacks.explorer"),
  gh           = require("plugins.snacks.gh"),
  gitbrowse    = require("plugins.snacks.gitbrowse"),
  image        = require("plugins.snacks.image"),
  indent       = require("plugins.snacks.indent"),
  input        = require("plugins.snacks.input"),
  lazygit      = require("plugins.snacks.lazygit"),
  notifier     = require("plugins.snacks.notifier"),
  picker       = require("plugins.snacks.picker"),
  profiler     = require("plugins.snacks.profiler"),
  quickfile    = require("plugins.snacks.quickfile"),
  scope        = require("plugins.snacks.scope"),
  scratch      = require("plugins.snacks.scratch"),
  scroll       = require("plugins.snacks.scroll"),
  statuscolumn = require("plugins.snacks.statuscolumn"),
  terminal     = require("plugins.snacks.terminal"),
  toggle       = require("plugins.snacks.toggle"),
  words        = require("plugins.snacks.words"),
  zen          = require("plugins.snacks.zen"),
})

-- ── Custom dashboard sections ─────────────────────────────────────────────────
-- Registered after Snacks.setup() so the Snacks global exists.
Snacks.dashboard.sections.git_heatmap = function()
  local ok, gd = pcall(require, "git-dashboard-nvim")
  if not ok then return {} end

  local lines = gd.heatmap()
  if not lines or #lines == 0 then return {} end

  local texts = {}
  for _, line in ipairs(lines) do
    table.insert(texts, { line .. "\n", hl = "SnacksDashboardDesc" })
  end

  return { { text = texts, align = "center", padding = 1 } }
end

-- ── Global keymaps ────────────────────────────────────────────────────────────
-- Module-specific keys (picker sources, terminal, etc.) are wired inside each
-- module file for locality.  Cross-cutting keys live here.

local map = vim.keymap.set

-- Notifications
map("n", "<leader>un", Snacks.notifier.hide,                        { desc = "Dismiss all notifications" })
map("n", "<leader>nh", function() Snacks.picker.notifications() end, { desc = "Notification history" })

-- Scratch
map("n", "<leader>.",  function() Snacks.scratch() end,             { desc = "Toggle scratch buffer" })
map("n", "<leader>S",  function() Snacks.scratch.select() end,      { desc = "Select scratch buffer" })

-- Profiler
map("n", "<leader>pp", function() Snacks.profiler.scratch() end,    { desc = "Profiler scratch buffer" })
