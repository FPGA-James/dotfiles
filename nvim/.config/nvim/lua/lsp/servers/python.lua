-- Python LSP configuration using pyright
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    -- Example: Python-specific keymap or settings
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].shiftwidth = 4
    vim.bo[bufnr].expandtab = true
  end,
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
      },
    },
  },
})
