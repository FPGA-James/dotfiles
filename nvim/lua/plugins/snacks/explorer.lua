-- =============================================================================
-- lua/plugins/snacks/explorer.lua
-- File explorer built on top of snacks.picker.
-- Behaves like a sidebar tree; supports create/rename/delete/copy/move.
-- =============================================================================

-- ── Keymap ────────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end,
  { desc = "File explorer" })

return {
  enabled = true,

  -- Replace netrw entirely (open directories with the explorer).
  replace_netrw = true,

  -- ── Window position ────────────────────────────────────────────────────
  -- "left" | "right" | "float"
  position = "left",

  -- Width of the sidebar in columns.
  width = 30,

  -- Automatically close the explorer when it is the last window.
  auto_close = false,

  -- Follow the current buffer: when you open a file, the tree scrolls
  -- to show it.
  follow_file = true,

  -- Icons
  icons = {
    -- Nerd-font icons for tree guides.  Set to false if your font lacks them.
    indent    = { last = "╰╴", edge = "│ ", item = "├╴", blank = "  " },
    -- Folder open/closed icons.
    folder    = { default = "", closed = "", open = "" },
    -- Icons for git status markers on files.
    git       = { enabled = true },
  },

  -- Git status indicators on files (requires git).
  git_status = true,

  -- Automatically refresh when files change on disk.
  watch = true,
}
