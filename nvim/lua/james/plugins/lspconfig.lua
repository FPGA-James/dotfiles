--require'lspconfig'.verible.setup {
--    on_attach = on_attach,
--    flags = lsp_flags,
--    root_dir = function() return vim.loop.cwd() end
--}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end 

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()

  --lspconfig.util.default_config,
  --{
  --  autostart = false, -- origonal
  --  autostart = ture,
  --  handlers = {
  --    ["window/logMessage"] = function(err, method, params, client_id)
  --        if params and params.type <= vim.lsp.protocol.MessageType.Log then
  --          vim.lsp.handlers["window/logMessage"](err, method, params, client_id)
  --        end
  --      end,
  --    ["window/showMessage"] = function(err, method, params, client_id)
  --        if params and params.type <= vim.lsp.protocol.MessageType.Warning.Error then
  --          vim.lsp.handlers["window/showMessage"](err, method, params, client_id)
  --        end
  --      end,
  --  }
  --}
)

lspconfig.verible.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = function() return vim.loop.cwd() end
}
