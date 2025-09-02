-- TypeScript/JavaScript LSP using tsserver
local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    vim.bo[bufnr].tabstop = 2
    vim.bo[bufnr].shiftwidth = 2
    vim.bo[bufnr].expandtab = true
  end,
  settings = {
    completions = { completeFunctionCalls = true }
  }
})
