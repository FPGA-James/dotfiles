-- =============================================================================
-- lsp/svlangserver.lua — SystemVerilog (Verilator-backed semantic analysis)
-- Complements Verible: deep elaboration-time diagnostics.
-- Root file: svlangserver.yaml (optional but recommended for multi-file)
--
-- Install:
--   npm install -g @imc-trading/svlangserver
--   brew install verilator   (macOS) / apt install verilator (Ubuntu)
-- =============================================================================
return {
  cmd        = { "svlangserver" },
  filetypes  = { "systemverilog", "verilog" },
  root_markers = { "svlangserver.yaml", ".git", "*.sv", "*.v" },
  settings = {
    systemverilog = {
      launchConfiguration  = "verilator -sv --lint-only -Wall",
      includeIndexing      = { "**/*.{sv,svh,v,vh}" },
      excludeIndexing      = { "test/**" },
      parallelIndexing     = 4,
      formatCommand        = "verible-verilog-format",
    },
  },
}
