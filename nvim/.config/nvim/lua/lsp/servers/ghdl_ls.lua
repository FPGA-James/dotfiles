-- VHDL LSP configuration using ghdl-ls
-- local lspconfig = require("lspconfig")
--
-- lspconfig.ghdl_ls.setup({
--   on_attach = function(client, bufnr)
--     vim.bo[bufnr].tabstop = 2
--     vim.bo[bufnr].shiftwidth = 2
--     vim.bo[bufnr].expandtab = true
--   end,
--   settings = {
--     ghdl = {
--       launchConfiguration = "ghdl",
--     },
--   },

---@type vim.lsp.Config
return {
  cmd = { 'ghdl-ls' },
  filetypes = { 'vhdl' },
  root_markers = { 'hdl-prj.json', '.git' },
}


-- })
