-- =============================================================================
-- lua/plugins/todo-comments.lua
-- todo-comments.nvim — highlight and search TODO/FIXME/NOTE/HACK comments
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/folke/todo-comments.nvim \
--     ~/.config/nvim/pack/local/opt/todo-comments.nvim
--
-- Dependencies (already installed): plenary.nvim
-- =============================================================================

vim.cmd.packadd("todo-comments.nvim")

require("todo-comments").setup({

  -- ── Keywords ──────────────────────────────────────────────────────────────
  -- Each keyword gets a highlight group and an icon.
  -- Add your own or change colours here.
  keywords = {
    FIX  = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning", alt = { "XXX" } },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "CAUTION" } },
    PERF = { icon = " ", color = "default", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint",    alt = { "INFO" } },
    TEST = { icon = "⏲ ", color = "test",   alt = { "TESTING", "PASSED", "FAILED" } },
  },

  -- ── Highlight ─────────────────────────────────────────────────────────────
  highlight = {
    -- Match the keyword even without a trailing colon (e.g. "TODO something").
    before    = "",           -- "fg" | "bg" | "" — highlight before the keyword
    keyword   = "wide",       -- "fg" | "bg" | "wide" | "wide_bg" | "wide_fg"
    after     = "fg",         -- "fg" | "bg" | "" — highlight after the keyword
    pattern   = [[.*<(KEYWORDS)\s*:]],  -- pattern for the keyword (vim regex)
    comments_only = true,     -- only highlight inside comments
    max_line_len  = 400,
    exclude       = {},
  },

  -- ── Search ────────────────────────────────────────────────────────────────
  search = {
    -- ripgrep is used for :TodoQuickFix / :TodoLocList.
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- Pattern used for searching.
    pattern = [[\b(KEYWORDS):]],
  },
})

-- ── Keymaps ───────────────────────────────────────────────────────────────────
local map = vim.keymap.set

-- Jump between todo comments in the buffer.
-- Note: ]t / [t are used by neotest — using ]T / [T for todos.
map("n", "]T", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
map("n", "[T", function() require("todo-comments").jump_prev() end, { desc = "Prev todo comment" })

-- Search todos via snacks picker (through quickfix).
map("n", "<leader>xt", "<cmd>TodoQuickFix<CR>",  { desc = "Todo (quickfix)" })
map("n", "<leader>xT", "<cmd>TodoLocList<CR>",   { desc = "Todo (loclist, current file)" })
