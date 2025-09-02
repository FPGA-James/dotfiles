-- load server configs

local servers = { "lua_ls", "ghdl_ls" }

for _, srv in ipairs(servers) do
  local ok, _ = pcall(require, "lsp.servers." .. srv)
  if not ok then
    vim.notify("LSP config not found: " .. srv, vim.log.levels.WARN)
  end
end
