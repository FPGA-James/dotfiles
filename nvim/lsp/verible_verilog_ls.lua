-- =============================================================================
-- lsp/verible_verilog_ls.lua — SystemVerilog / Verilog (Verible)
-- Provides: formatting, linting, navigation, document symbols.
-- No root file required — attaches per-file, roots on .git as fallback.
--
-- Install: download binary from https://github.com/chipsalliance/verible/releases
-- Place verible-verilog-ls on your $PATH.
-- =============================================================================
return {
  cmd        = { "verible-verilog-ls" },
  filetypes  = { "systemverilog", "verilog" },
  root_markers = { ".git" },
  -- Optional: pass flags directly
  -- cmd = {
  --   "verible-verilog-ls",
  --   "--rules_config", vim.fn.expand("~/.config/verible/rules.config"),
  -- },
}
