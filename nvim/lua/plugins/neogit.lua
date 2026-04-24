-- =============================================================================
-- lua/plugins/neogit.lua
-- neogit.nvim — magit-inspired git status/stage/commit UI
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/NeogitOrg/neogit \
--     ~/.config/nvim/pack/local/opt/neogit.nvim
--
-- Dependencies (already installed): plenary.nvim, nvim-web-devicons
--
-- Complements the other git tooling rather than replacing it:
--   gitsigns.nvim  — hunk stage/reset/blame from the buffer
--   diffview.nvim  — side-by-side diffs and file history
--   lazygit        — full TUI (<leader>gg)
--   Neogit here    — interactive status/stage/commit buffer (<leader>gG)
-- =============================================================================

vim.cmd.packadd("neogit.nvim")

require("neogit").setup({

  -- ── Integrations ──────────────────────────────────────────────────────────
  integrations = {
    -- Reuse the already-installed diffview.nvim for diffs opened from Neogit.
    diffview = true,
  },

  -- ── Behavior ──────────────────────────────────────────────────────────────
  disable_hint          = false,   -- keep the keybind hint line in the status buffer
  disable_commit_confirmation = false,
  disable_insert_on_commit    = "auto",

  -- ── Status buffer ─────────────────────────────────────────────────────────
  status = {
    recent_commit_count = 10,
  },

  -- ── Graph style ───────────────────────────────────────────────────────────
  graph_style = "unicode",

  -- ── Commit editor / popup windows ─────────────────────────────────────────
  kind = "tab",   -- open Neogit in its own tab
})

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>gG", function() require("neogit").open() end,
  { desc = "Neogit status" })
