-- =============================================================================
-- lua/plugins/mini-ai.lua
-- mini.ai — extended and improved text objects
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/echasnovski/mini.nvim \
--     ~/.config/nvim/pack/local/opt/mini.nvim
--
-- Built-in text objects (extend default a/i behaviour):
--   ()  []  {}  <>         — bracket pairs, with and without whitespace
--   "   '   `              — quotes, works across lines
--   b                      — any bracket pair
--   q                      — any quote
--   f                      — function call (e.g. `foo(...)`)
--   t                      — HTML/XML tag
--   ?                      — interactive: prompted for open/close pair
--
-- Treesitter-powered (require parsers installed via :TSInstall):
--   F   — function definition
--   C   — class / module definition
--   A   — function argument (alias for the argument spec)
-- =============================================================================

vim.cmd.packadd("mini.nvim")

local ai = require("mini.ai")

ai.setup({

  -- ── Search range ──────────────────────────────────────────────────────────
  -- How many lines to look for a matching textobject surrounding the cursor.
  n_lines = 500,

  -- ── Custom textobjects ────────────────────────────────────────────────────
  custom_textobjects = {

    -- Function argument (enhanced — works in more contexts than the default).
    -- `via` = select argument, `cia` = change argument.
    a = ai.gen_spec.argument({ brackets = { "%b()" }, separator = "," }),

    -- Function call including the name: `vif` = inside args, `vaf` = whole call.
    f = ai.gen_spec.function_call(),

    -- Whole function call object including name
    F = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),

    -- ── Treesitter-powered ────────────────────────────────────────────────
    -- These require the relevant treesitter parser to be installed.
    -- Falls back gracefully if no parser is available for the current ft.

    -- Function definition: `viF` inside, `vaF` around (with keyword).
    -- ["F"] already used above; map treesitter function to <leader>-free keys.

    -- Class / struct / module body.
    -- `vic` = inside class body, `vac` = whole class.
    c = ai.gen_spec.treesitter({
      a = "@class.outer",
      i = "@class.inner",
    }),

    -- Block (if/for/while/etc.) — useful for HDL generate/process blocks.
    -- `vib` = inside block, `vab` = whole block including keyword.
    B = ai.gen_spec.treesitter({
      a = "@block.outer",
      i = "@block.inner",
    }),

    -- Conditional (if/case/when).
    -- `viC` = inside branch, `vaC` = whole conditional.
    C = ai.gen_spec.treesitter({
      a = "@conditional.outer",
      i = "@conditional.inner",
    }),

    -- Loop body.
    -- `viL` = inside loop, `vaL` = whole loop.
    L = ai.gen_spec.treesitter({
      a = "@loop.outer",
      i = "@loop.inner",
    }),
  },

  -- ── Mappings ──────────────────────────────────────────────────────────────
  -- All default mappings use `a`/`i` as operators.
  -- `va)` = select around ), `ci"` = change inside ", etc.
  mappings = {
    -- Object scope — these are the standard text object keys.
    around            = "a",
    inside            = "i",
    -- Next/prev match for an object (skip to the nearest one in search dir).
    around_next       = "an",
    inside_next       = "in",
    around_last       = "al",
    inside_last       = "il",
    -- Go-to start/end of an object (in normal mode, for navigation).
    goto_left         = "g[",
    goto_right        = "g]",
  },

  -- ── Search method ─────────────────────────────────────────────────────────
  -- "cover"         — object must cover the cursor
  -- "cover_or_next" — use object that covers cursor or the next one
  -- "cover_or_prev" — use object that covers cursor or the previous one
  -- "cover_or_nearest" — whichever is closer
  -- "next"          — always use the next object
  -- "previous"      — always use the previous object
  -- "nearest"       — always use nearest (next or prev)
  search_method = "cover_or_next",

  -- ── Silent mode ───────────────────────────────────────────────────────────
  -- Don't show "mini.ai: no textobject found" when nothing matches.
  silent = false,
})
