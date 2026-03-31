-- =============================================================================
-- lua/plugins/nvim-surround.lua
-- nvim-surround — add / change / delete surrounding characters
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/kylechui/nvim-surround \
--     ~/.config/nvim/pack/local/opt/nvim-surround
--
-- Default keymaps (normal mode):
--   ys{motion}{char}  — add surround   e.g. ysiw"  wraps word in "..."
--   cs{old}{new}      — change surround e.g. cs'"  changes '...' → "..."
--   ds{char}          — delete surround e.g. ds(   removes surrounding ()
-- Visual mode:
--   S{char}           — surround selection
-- Insert mode:
--   <C-g>s{char}      — add surround
-- =============================================================================

vim.cmd.packadd("nvim-surround")

require("nvim-surround").setup({
  -- All options below are the defaults — uncomment to override.

  -- ── Keymaps ───────────────────────────────────────────────────────────────
  keymaps = {
    insert          = "<C-g>s",
    insert_line     = "<C-g>S",
    normal          = "ys",
    normal_cur      = "yss",   -- surround current line
    normal_line     = "yS",
    normal_cur_line = "ySS",
    visual          = "S",
    visual_line     = "gS",
    delete          = "ds",
    change          = "cs",
    change_line     = "cS",
  },

  -- ── Aliases ───────────────────────────────────────────────────────────────
  -- Map a character to a pair. e.g. "q" → `...` for quick backtick wrapping.
  aliases = {
    ["a"] = ">",
    ["b"] = ")",
    ["B"] = "}",
    ["r"] = "]",
    ["q"] = { '"', "'", "`" },  -- q cycles through quote types
    ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
  },

  -- ── Highlight ─────────────────────────────────────────────────────────────
  -- Briefly highlight the surrounding pair after an operation.
  highlight = { duration = 0 },

  -- ── Move cursor ───────────────────────────────────────────────────────────
  -- Where to place the cursor after `ys` / `cs`.
  move_cursor = "begin",
})
