-- =============================================================================
-- lsp/pyright.lua — Python
-- Install: npm install -g pyright
-- Root file: pyrightconfig.json (or pyproject.toml / setup.py / .git)
-- For bare projects with none of those, create an empty pyrightconfig.json: {}
-- =============================================================================
return {
  cmd        = { "pyright-langserver", "--stdio" },
  filetypes  = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode       = "basic",      -- "off" | "basic" | "strict"
        autoSearchPaths        = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions  = true,
        diagnosticMode         = "workspace",  -- "openFilesOnly" | "workspace"
        reportMissingImports   = true,
        reportMissingTypeStubs = false,
      },
    },
  },
}
