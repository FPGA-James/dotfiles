-- =============================================================================
-- lua/plugins/render-markdown.lua
-- render-markdown.nvim — in-editor markdown rendering with virtual text
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/MeanderingProgrammer/render-markdown.nvim \
--     ~/.config/nvim/pack/local/opt/render-markdown.nvim
--
-- Dependencies:
--   nvim-treesitter with markdown + markdown_inline parsers (see plugins/treesitter.lua)
--   nvim-web-devicons (optional, already installed)
--
-- Note: obsidian.nvim UI is disabled in plugins/obsidian.lua to avoid conflicts.
-- =============================================================================

vim.cmd.packadd("render-markdown.nvim")

require("render-markdown").setup({

  -- Filetypes to render. Extend if using Avante or other markdown-backed tools.
  file_types = { "markdown" },

  -- ── Headings ──────────────────────────────────────────────────────────────
  heading = {
    enabled = true,
    -- Sign column indicator (only visible if signcolumn is "yes").
    sign    = false,
    -- Icons per heading level H1–H6.
    icons   = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
  },

  -- ── Code blocks ───────────────────────────────────────────────────────────
  code = {
    enabled  = true,
    -- "full" renders language label + background; "normal" = background only
    style    = "full",
    position = "left",   -- language label: "left" | "right"
    border   = "thin",
  },

  -- ── Bullet points ─────────────────────────────────────────────────────────
  bullet = {
    enabled = true,
    -- One icon per nesting level; cycles if deeper.
    icons   = { "●", "○", "◆", "◇" },
  },

  -- ── Checkboxes ────────────────────────────────────────────────────────────
  checkbox = {
    enabled   = true,
    unchecked = { icon = "☐", highlight = "RenderMarkdownUnchecked" },
    checked   = { icon = "✔", highlight = "RenderMarkdownChecked" },
    custom    = {
      todo = { raw = "[-]", rendered = "◐", highlight = "RenderMarkdownTodo" },
    },
  },

  -- ── Tables ────────────────────────────────────────────────────────────────
  pipe_table = {
    enabled = true,
    style   = "full",   -- "full" draws box-drawing borders; "normal" = minimal
    cell    = "padded",
  },

  -- ── Horizontal rule ───────────────────────────────────────────────────────
  dash = {
    enabled = true,
    icon    = "─",
  },

  -- ── Block quotes ──────────────────────────────────────────────────────────
  quote = {
    enabled = true,
    icon    = "▋",
  },

  -- ── Links ─────────────────────────────────────────────────────────────────
  link = {
    enabled   = true,
    image     = "󰥶 ",
    email     = "󰀓 ",
    hyperlink = "󰌹 ",
  },

  -- ── LaTeX ─────────────────────────────────────────────────────────────────
  -- Requires the `latex` TS parser + pylatexenc (pip install pylatexenc).
  latex = { enabled = false },
})
