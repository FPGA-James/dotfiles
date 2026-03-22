-- =============================================================================
-- lua/plugins/lualine.lua
-- lualine.nvim — fast statusline
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/nvim-lualine/lualine.nvim \
--     ~/.config/nvim/pack/local/opt/lualine.nvim
-- =============================================================================

vim.cmd.packadd("lualine.nvim")

require("lualine").setup({
  options = {
    theme                = "auto",
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
    globalstatus         = true,
  },

  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      { "filename", path = 1 },
      {
        function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if #clients == 0 then return "" end
          local names = {}
          for _, c in ipairs(clients) do
            names[#names + 1] = c.name
          end
          return " " .. table.concat(names, ", ")
        end,
      },
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },

  inactive_sections = {
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "location" },
  },
})
