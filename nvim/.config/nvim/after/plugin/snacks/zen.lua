-- Assuming snacks.nvim is cloned under: ~/.config/nvim/pack/plugins/start/snacks.nvim

return {
  zen = {
    enabled = true,
    -- Example options:
    backdrop = {
      -- Shade surrounding areas; value between 0 and 1
      darkness = 0.5,
    },
    -- Window options e.g., padding or width
    width = 80,
    height = 0.9,
    -- Exclude certain elements on activation
    toggle_ui = {
      statusline = true,
      cmdline = true,
      tabline = true,
      winbar = true,
    },
  },
}
