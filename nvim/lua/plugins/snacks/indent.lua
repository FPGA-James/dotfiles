-- =============================================================================
-- lua/plugins/snacks/indent.lua
-- Animated indent guides with scope highlighting.
-- Replaces indent-blankline.nvim.
-- =============================================================================
return {
  enabled = true,

  -- ── Indent guides (the vertical lines) ───────────────────────────────────
  indent = {
    -- Render indent guides.
    enabled   = true,

    -- Character used for the indent guide line.
    -- "│" (solid), "┊" (dotted), "╎" (double-dotted), " " (invisible)
    char      = "│",

    -- Only show guides on lines that have content (skip blank lines).
    only_scope    = false,
    only_current  = false,

    -- Highlight group for the guide lines.
    -- Default: "SnacksIndent"
    -- Tip: link to a dim colour so guides don't fight your code.
    hl = "SnacksIndent",
  },

  -- ── Scope highlight (the current block's guide is a different colour) ─────
  scope = {
    enabled   = true,

    -- Character for the scope guide (can differ from indent.char).
    char      = "│",

    -- Show an underline at the top of the scope.
    underline = false,

    -- Only show scope when inside a block of at least this many lines.
    only_current = false,

    -- Highlight group for the scope guide.
    -- Default: "SnacksIndentScope"
    hl = "SnacksIndentScope",
  },

  -- ── Chunk animation ───────────────────────────────────────────────────────
  chunk = {
    -- Animate drawing the scope box (top + bottom corners).
    enabled   = false,

    -- Characters for the box corners and edges.
    -- Requires a Nerd Font or a font with box-drawing characters.
    char = {
      corner_top    = "╭",
      corner_bottom = "╰",
      horizontal    = "─",
      vertical      = "│",
      arrow         = "›",
    },
    hl = "SnacksIndentChunk",
  },

  -- ── Blanks ────────────────────────────────────────────────────────────────
  blank = {
    -- Render a special character on blank (empty) lines.
    enabled = false,
    char    = " ",
    hl      = "SnacksIndentBlank",
  },

  -- ── Animation ─────────────────────────────────────────────────────────────
  animate = {
    enabled  = vim.fn.has("nvim-0.9") == 1,
    style    = "out",       -- "up" | "down" | "out"
    easing   = "linear",
    duration = { step = 20, total = 500 },
  },

  -- ── Scope detection ───────────────────────────────────────────────────────
  scope = {
    -- Use Treesitter for scope detection when available.
    treesitter = {
      enabled = true,
      -- Node types that define a scope boundary.
      -- Add HDL-specific types for your SystemVerilog/VHDL work.
      blocks = {
        enabled = false,
        -- "function_declaration","class_declaration", etc.
        -- See Treesitter node types with :InspectTree
      },
    },
  },

  -- Filetypes where indent guides are disabled.
  filter = function(buf)
    return vim.g.snacks_indent ~= false
      and vim.b[buf].snacks_indent ~= false
      and vim.bo[buf].buftype == ""
  end,

  -- Priority of the extmarks. Higher = drawn on top.
  priority = 1,
}
