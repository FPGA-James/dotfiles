-- =============================================================================
-- lua/colorschemes/catppuccin.lua — DEFAULT (mocha)
-- https://github.com/catppuccin/nvim
-- Install: git clone --depth 1 https://github.com/catppuccin/nvim \
--            ~/.config/nvim/pack/local/opt/catppuccin
-- =============================================================================
vim.cmd.packadd("catppuccin")

require("catppuccin").setup({
  flavour    = "mocha",              -- "latte"|"frappe"|"macchiato"|"mocha"
  background = { light = "latte", dark = "mocha" },
  term_colors = true,
  dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
  no_italic    = false,
  no_bold      = false,
  no_underline = false,
  styles = {
    comments     = { "italic" },
    conditionals = { "italic" },
    loops        = {},
    functions    = {},
    keywords     = {},
    strings      = {},
    variables    = {},
    numbers      = {},
    booleans     = {},
    properties   = {},
    types        = {},
    operators    = {},
    miscs        = {},
  },
  custom_highlights = {},
  integrations = {
    cmp            = true,
    gitsigns       = true,
    nvimtree       = false,
    treesitter     = true,
    notify         = true,
    telescope      = false,
    which_key      = true,
    lsp_trouble    = false,
    mason          = false,
    indent_blankline = { enabled = false },
    native_lsp = {
      enabled      = true,
      virtual_text = {
        errors      = { "italic" },
        hints       = { "italic" },
        warnings    = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors      = { "underline" },
        hints       = { "underline" },
        warnings    = { "underline" },
        information = { "underline" },
      },
      inlay_hints = { background = true },
    },
  },
})
