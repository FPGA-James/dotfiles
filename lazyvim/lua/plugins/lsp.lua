return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      verible = {
        -- on_attach = on_attach,
        -- flags = lsp_flags,
        root_dir = function()
          return vim.loop.cwd()
        end,
        cmd = { "verible-verilog-ls", "--rules_config_search" },
      },
      onmisharp = { cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" } }, -- TODO: Stuart <- Update this.....
      tsserver = {},
      sqlls = {},
      rust_analyzer = {},
    },
    setup = {},
  },
}
