-- =============================================================================
-- lsp/yamlls.lua — YAML
-- SchemaStore-backed validation, completion, hover, formatting.
-- Root file: .git or .yamllint. For non-git projects: touch .yamllint
--
-- Install: npm install -g yaml-language-server
-- =============================================================================
return {
  cmd        = { "yaml-language-server", "--stdio" },
  filetypes  = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git", ".yamllint", ".yamllint.yml", ".yamllint.yaml" },
  settings = {
    yaml = {
      schemaStore = {
        enable = true,
        url    = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = {
          "/*.k8s.yaml", "/k8s/**/*.yaml", "/kubernetes/**/*.yaml",
        },
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.{yml,yaml}",
        ["https://json.schemastore.org/github-action.json"]   = "/.github/actions/**/*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
          "docker-compose.{yml,yaml}", "docker-compose.*.{yml,yaml}",
        },
      },
      validate   = true,
      completion = true,
      hover      = true,
      format = {
        enable         = true,
        singleQuote    = false,
        bracketSpacing = true,
        proseWrap      = "preserve",
        printWidth     = 80,
      },
    },
  },
}
