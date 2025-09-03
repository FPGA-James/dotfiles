-- lspconfig = require('lspconfig')
-- lspconfig['vhdl_ls'].setup({
--   on_attach = on_attach,
--   capabilities = capabilities
-- })


---@type vim.lsp.Config
return {
  cmd = { 'vhdl_ls' },
  filetypes = { 'vhd', 'vhdl' },
  root_markers = {
    'vhdl_ls.toml',
    '.vhdl_ls.toml',
  },
}
