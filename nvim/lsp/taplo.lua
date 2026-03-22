-- =============================================================================
-- lsp/taplo.lua — TOML
-- Schema-aware validation, completion, hover, and formatting.
-- Root file: any .toml file or .git. For bare projects: touch pyproject.toml
--
-- Install: cargo install taplo-cli --features lsp
--   OR: brew install taplo
-- =============================================================================
return {
  cmd        = { "taplo", "lsp", "stdio" },
  filetypes  = { "toml" },
  root_markers = {
    "*.toml",
    ".git",
    "pyproject.toml",
    "Cargo.toml",
  },
  settings = {
    taplo = {
      schema = {
        enabled = true,
        cache = {
          memoryExpiration = 60,
          diskExpiration   = 600,
        },
      },
      formatter = {
        alignEntries        = false,
        alignComments       = true,
        arrayTrailingComma  = true,
        arrayAutoExpand     = true,
        arrayAutoCollapse   = true,
        compactArrays       = false,
        compactInlineTables = false,
        columnWidth         = 80,
        indentTables        = false,
        indentEntries       = false,
        inlineTableExpand   = true,
        trailingNewline     = true,
        reorderKeys         = false,
      },
    },
  },
}
