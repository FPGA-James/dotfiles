-- =============================================================================
-- lua/plugins/gitsigns.lua
-- gitsigns.nvim — inline git diff signs, blame, hunk navigation & staging
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/lewis6991/gitsigns.nvim \
--     ~/.config/nvim/pack/local/opt/gitsigns.nvim
-- =============================================================================

vim.cmd.packadd("gitsigns.nvim")

require("gitsigns").setup({

  -- ── Sign column symbols ───────────────────────────────────────────────────
  -- Text shown in the sign column for each type of change.
  signs = {
    add          = { text = "┃" },
    change       = { text = "┃" },
    delete       = { text = "▁" },
    topdelete    = { text = "▔" },
    changedelete = { text = "~" },
    untracked    = { text = "┆" },
  },

  -- Signs for hunks that have been staged (git add).
  signs_staged = {
    add          = { text = "┃" },
    change       = { text = "┃" },
    delete       = { text = "▁" },
    topdelete    = { text = "▔" },
    changedelete = { text = "~" },
  },

  -- Show signs for staged hunks in the sign column.
  signs_staged_enable = true,

  -- ── Sign column / line highlights ─────────────────────────────────────────
  -- Show signs in the sign column (uses GitSignsAdd / GitSignsChange / etc).
  signcolumn = true,

  -- Highlight the line number for changed lines (GitSignsAddNr etc).
  numhl = false,

  -- Highlight the entire line for changed lines (GitSignsAddLn etc).
  linehl = false,

  -- Highlight sign column when cursor is on the same line (GitSignsAddCul etc).
  culhl = false,

  -- ── Intra-line word diff ───────────────────────────────────────────────────
  -- Highlight individual changed words inside a line.
  -- Requires diff_opts.internal = true.
  word_diff = false,

  -- ── Diff options ──────────────────────────────────────────────────────────
  -- Derived from 'diffopt' by default; override individual fields here.
  diff_opts = {
    -- Diff algorithm: "myers" | "minimal" | "patience" | "histogram"
    algorithm        = "histogram",
    -- Use Neovim's built-in xdiff library (required for word_diff / linematch).
    internal         = true,
    -- Use indent heuristic to produce more readable diffs.
    indent_heuristic = true,
    -- Second-stage diff to align lines within a hunk (requires internal=true).
    linematch        = 60,
    -- Ignore blank-line-only changes.
    ignore_blank_lines            = false,
    ignore_whitespace             = false,
    ignore_whitespace_change      = false,
    ignore_whitespace_change_at_eol = false,
  },

  -- ── Watch .git directory ──────────────────────────────────────────────────
  watch_gitdir = {
    -- Place a libuv watcher on .git to trigger sign updates on external changes.
    enable       = true,
    -- Follow files renamed with `git mv` and update the buffer path.
    follow_files = true,
  },

  -- ── Attach behaviour ──────────────────────────────────────────────────────
  -- Automatically attach gitsigns to every buffer in a git repo.
  auto_attach = true,

  -- Also attach to new, untracked files.
  attach_to_untracked = false,

  -- Base revision to diff against. Default is the index (staged snapshot).
  -- Examples: "HEAD", "HEAD~1", "main"
  -- base = nil,  -- nil means index

  -- ── Performance ───────────────────────────────────────────────────────────
  -- Debounce time (ms) before recomputing signs after a buffer change.
  update_debounce = 100,

  -- Skip attaching to files longer than this many lines.
  max_file_length = 40000,

  -- Sign priority (higher = drawn on top of other signs).
  sign_priority = 6,

  -- ── Current-line blame ────────────────────────────────────────────────────
  -- Show git blame as virtual text at the end of the current line.
  current_line_blame = true,

  current_line_blame_opts = {
    -- Show virtual text blame annotation.
    virt_text          = true,
    -- Position: "eol" | "overlay" | "right_align"
    virt_text_pos      = "eol",
    -- Delay (ms) before the annotation appears.
    delay              = 1000,
    -- Ignore whitespace-only changes in blame.
    ignore_whitespace  = false,
    -- Virtual text render priority.
    virt_text_priority = 100,
    -- Only show when the buffer is focused.
    use_focus          = true,
  },

  -- Format string for the blame annotation on committed lines.
  -- Tokens: <author> <author_time:%R> <summary> <abbrev_sha> etc.
  current_line_blame_formatter = " <author>, <author_time:%R> · <summary>",

  -- Format for lines not yet committed (e.g. new/unsaved lines).
  current_line_blame_formatter_nc = " <author>",

  -- ── Hunk preview window ───────────────────────────────────────────────────
  -- Options passed to nvim_open_win for the preview float.
  preview_config = {
    style    = "minimal",
    relative = "cursor",
    row      = 0,
    col      = 1,
  },

  -- ── Detached worktrees ────────────────────────────────────────────────────
  -- List of { gitdir, toplevel } tables for detached worktree setups.
  worktrees = {},

  -- ── GitHub integration ────────────────────────────────────────────────────
  -- Enrich blame_line output with PR numbers (requires `gh` CLI).
  gh = false,

  -- ── Keymaps (set per-buffer via on_attach) ────────────────────────────────
  on_attach = function(bufnr)
    local gs = require("gitsigns")
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- Hunk navigation
    map("n", "]h", function()
      if vim.wo.diff then vim.cmd.normal({ "]c", bang = true })
      else gs.nav_hunk("next") end
    end, "Next hunk")
    map("n", "[h", function()
      if vim.wo.diff then vim.cmd.normal({ "[c", bang = true })
      else gs.nav_hunk("prev") end
    end, "Prev hunk")
    map("n", "]H", function() gs.nav_hunk("last") end,  "Last hunk")
    map("n", "[H", function() gs.nav_hunk("first") end, "First hunk")

    -- Staging
    map({ "n", "v" }, "<leader>gs", gs.stage_hunk,        "Stage hunk")
    map({ "n", "v" }, "<leader>gr", gs.reset_hunk,        "Reset hunk")
    map("n",          "<leader>gS", gs.stage_buffer,      "Stage buffer")
    map("n",          "<leader>gR", gs.reset_buffer,      "Reset buffer")
    map("n",          "<leader>gu", gs.undo_stage_hunk,   "Undo stage hunk")

    -- Preview / diff
    map("n", "<leader>gp", gs.preview_hunk,               "Preview hunk")
    map("n", "<leader>gP", gs.preview_hunk_inline,        "Preview hunk inline")
    map("n", "<leader>gd", function() gs.diffthis() end,  "Diff this (index)")
    map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff this (~HEAD)")

    -- Blame
    map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
    map("n", "<leader>gB", gs.blame,                      "Blame buffer")

    -- Toggles
    map("n", "<leader>ub", gs.toggle_current_line_blame,  "Toggle line blame")
    map("n", "<leader>uD", gs.toggle_deleted,             "Toggle deleted lines")
    map("n", "<leader>uW", gs.toggle_word_diff,           "Toggle word diff")
    map("n", "<leader>uG", gs.toggle_signs,               "Toggle git signs")

    -- Text object: select hunk with ih / ah
    map({ "o", "x" }, "ih", ":<C-u>Gitsigns select_hunk<CR>", "Select hunk")
    map({ "o", "x" }, "ah", ":<C-u>Gitsigns select_hunk<CR>", "Select hunk")
  end,
})
