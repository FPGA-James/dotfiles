-- Assuming snacks.nvim is cloned under: ~/.config/nvim/pack/plugins/start/snacks.nvim
---@module 'snacks'
---@type snacks.Config
return{
  terminal = {
    enabled = true,
    -- Example options:
    float = {
      -- Floating window settings
      border = "rounded",
      width = 0.9,
      height = 0.4,
      winblend = 20,
      -- The default shell for the terminal (optional)
      shell = vim.o.shell,
    },
    split = {
      -- Bottom split settings
      height = 15,
      direction = "horizontal",
    },
    -- Behavior when terminal buffer closes
    on_exit = "close", -- could also be "hide" or "keep"
    -- Toggle key mapping (to be set later)
  },
}
