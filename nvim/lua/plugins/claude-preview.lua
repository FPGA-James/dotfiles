-- =============================================================================
-- lua/plugins/claude-preview.lua
-- claude-preview.nvim — diff preview for Claude Code AI edits
--
-- Intercepts Claude Code file edits before they're applied and opens a
-- side-by-side diff so you can review changes before accepting/rejecting.
--
-- Source location (local):
--   ~/.config/nvim/pack/local/opt/claude-preview.nvim/
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/Cannon07/claude-preview.nvim \
--     ~/.config/nvim/pack/local/opt/claude-preview.nvim
--
-- Requires: jq  (brew install jq)
--
-- After install, run :ClaudePreviewInstallHooks once per project to inject
-- the Claude Code hooks into .claude/settings.local.json, then restart claude.
-- =============================================================================

vim.cmd.packadd("claude-preview.nvim")

require("claude-preview").setup({

  -- ── Diff window ─────────────────────────────────────────────────────────
  diff = {
    -- How to display the diff.
    -- "tab"    — new tab with side-by-side split (cleanest, no layout disruption)
    -- "vsplit" — split inside the current tab
    -- "inline" — unified diff with character-level highlighting
    layout     = "tab",

    -- Labels shown in the diff header.
    labels     = { current = "CURRENT", proposed = "PROPOSED" },

    -- Automatically close the diff when the change is accepted in the terminal.
    auto_close = true,

    -- Equalise the two split widths.
    equalize   = true,

    -- Show the entire file rather than just changed hunks.
    full_file  = true,
  },

  -- ── Highlights — Catppuccin Mocha palette ───────────────────────────────
  -- base: #1e1e2e  surface0: #313244  red: #f38ba8  green: #a6e3a1
  highlights = {
    -- Left pane: what the file looks like NOW (current state).
    current = {
      DiffAdd    = { bg = "#3d2535" },
      DiffDelete = { bg = "#3d2535" },
      DiffChange = { bg = "#3d2f2e" },
      DiffText   = { bg = "#5c3040" },
    },
    -- Right pane: what Claude is PROPOSING.
    proposed = {
      DiffAdd    = { bg = "#253d30" },
      DiffDelete = { bg = "#3d2535" },
      DiffChange = { bg = "#253040" },
      DiffText   = { bg = "#3a5c40" },
    },
    -- Inline mode (layout = "inline") — unified diff with character diffs.
    inline = {
      added        = { bg = "#253d30" },
      removed      = { bg = "#3d2535" },
      added_text   = { bg = "#3a6e45" },
      removed_text = { bg = "#6e3a45" },
    },
  },

  -- ── Neo-tree integration ─────────────────────────────────────────────────
  -- Disabled: this config uses snacks.nvim explorer, not neo-tree.
  neo_tree = {
    enabled = false,
  },
})
