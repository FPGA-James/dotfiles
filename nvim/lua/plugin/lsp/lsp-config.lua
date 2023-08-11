local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.verible.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "--rules_config_search"   },
    root_dir = function() return vim.loop.cwd() end
}
