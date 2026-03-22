-- =============================================================================
-- lsp/vhdl_ls.lua — VHDL (rust_hdl)
-- Root file: vhdl_ls.toml  ← REQUIRED, must be created at project root.
--
-- Minimal vhdl_ls.toml:
--   [libraries]
--   work.files = ['src/**/*.vhd']
--   tb.files   = ['tb/**/*.vhd']
--
-- Install: cargo install vhdl_ls
--   OR download from https://github.com/VHDL-LS/rust_hdl/releases
-- =============================================================================
return {
  cmd        = { "vhdl_ls" },
  filetypes  = { "vhdl" },
  root_markers = {
    "vhdl_ls.toml",   -- required for meaningful analysis
    ".git",
  },
}
