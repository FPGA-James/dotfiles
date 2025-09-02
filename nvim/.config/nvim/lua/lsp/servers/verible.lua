 -- Verilog/SystemVerilog LSP configuration using verible
local lspconfig = require("lspconfig")

lspconfig.verible.setup({
  on_attach = function(client, bufnr)
    vim.bo[bufnr].tabstop = 2
    vim.bo[bufnr].shiftwidth = 2
    vim.bo[bufnr].expandtab = true
  end,
  settings = {
    verible = {
      lint = { enabled = true },
      format = { enabled = true },
    },
  },
})
