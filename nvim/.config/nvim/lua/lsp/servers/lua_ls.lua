-- Lua LSP configuration using lua-language-server (lua_ls)
local lspconfig = require("lspconfig")
---@module 'snacks'

---@type snacks.Config
lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    -- Lua files often use 2 spaces
    vim.bo[bufnr].tabstop = 2
    vim.bo[bufnr].shiftwidth = 2
    vim.bo[bufnr].expandtab = true
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the server which version of Lua you're using (LuaJIT for Neovim)
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Recognize the `vim` global to avoid "undefined global" warnings
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- avoids prompt asking about third-party libraries
      },
      telemetry = {
        enable = false, -- don't send telemetry data
      },
    },
  },
})
