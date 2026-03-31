-- =============================================================================
-- lua/plugins/conform.lua
-- conform.nvim — external formatter management
--
-- Overrides <leader>lf to use conform first, falling back to LSP formatting.
-- Useful for running standalone formatter binaries (Verible, black, stylua)
-- independently of the LSP.
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/stevearc/conform.nvim \
--     ~/.config/nvim/pack/local/opt/conform.nvim
--
-- Formatter binaries (install separately):
--   pip install black                         # Python
--   brew install stylua                       # Lua  (or: cargo install stylua)
--   # verible-verilog-format ships with Verible — see README
--   npm install -g prettier                  # YAML / JSON / Markdown
-- =============================================================================

vim.cmd.packadd("conform.nvim")

require("conform").setup({

  -- ── Formatters per filetype ───────────────────────────────────────────────
  -- List multiple formatters to run them in sequence.
  -- Use { lsp_format = "fallback" } to prefer conform, fall back to LSP.
  formatters_by_ft = {
    python            = { "black" },
    lua               = { "stylua" },
    systemverilog     = { "verible_verilog_format" },
    verilog           = { "verible_verilog_format" },
    yaml              = { "prettier" },
    json              = { "prettier" },
    markdown          = { "prettier" },
    -- VHDL: no well-established standalone formatter; LSP handles it.
    -- toml: taplo LSP handles formatting natively.
  },

  -- ── Format on save ────────────────────────────────────────────────────────
  -- Driven by vim.g.conform_format_on_save (set false at startup).
  -- Toggle at runtime with <leader>uf.
  format_on_save = function()
    if not vim.g.conform_format_on_save then return nil end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,

  -- ── Formatter overrides ───────────────────────────────────────────────────
  -- Override or extend individual formatter configs here.
  formatters = {
    verible_verilog_format = {
      -- Flags passed to verible-verilog-format.
      -- Adjust column limit to match your project style.
      prepend_args = { "--column_limit=100" },
    },
    black = {
      prepend_args = { "--line-length", "100" },
    },
  },

  -- ── Notifications ─────────────────────────────────────────────────────────
  -- Show a notification when no formatter is available for the filetype.
  notify_no_formatters = true,
})

-- ── Keymaps ───────────────────────────────────────────────────────────────────
-- Overrides the LSP <leader>lf mapping set in lua/lsp.lua.
-- conform runs first; if no formatter is configured for the filetype it falls
-- back to vim.lsp.buf.format().
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  require("conform").format({
    async       = true,
    lsp_format  = "fallback",  -- use LSP if no conform formatter configured
  })
end, { desc = "Format buffer / range" })
