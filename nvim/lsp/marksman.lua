-- =============================================================================
-- lsp/marksman.lua — Markdown
-- Provides go-to-definition and completions for wiki-style links.
--
-- Install: brew install marksman          (macOS)
--          cargo install marksman         (cross-platform)
--          # or download binary from: https://github.com/artempyanykh/marksman/releases
-- Root file: .marksman.toml or .git
-- =============================================================================
return {
  cmd          = { "marksman", "server" },
  filetypes    = { "markdown", "markdown.mdx" },
  root_markers = { ".marksman.toml", ".git" },
}
