-- lua/plugins/snacks.lua
-- Snacks.nvim configuration with expanded picker options
---@module 'snacks'
---@type snacks.Config

local ok, snacks = pcall(require, "snacks")
if not ok then
  vim.notify("Snacks.nvim not found in packpath", vim.log.levels.ERROR)
  return
end

snacks.setup({
  features = {
    notifier    = true,
    git         = true,
    picker      = true,  -- enable picker with extended options
    keymaps     = true,
  },

  ui = {
    border = "rounded",
    icons = {
      git = {
        added    = "",
        modified = "",
        removed  = "",
      },
      diagnostics = {
        error = " ",
        warn  = " ",
        hint  = " ",
        info  = " ",
      },
    },
  },


  notifier = {
    timeout = 3000,
    position = "top_right",
  },

--   terminal = {
--     float_opts = {
--       border = "rounded",
--       width  = 0.9,
--       height = 0.9,
--     },
--   },

  -- Expanded picker configuration
  picker = {
    layout = "ivy",     -- 'horizontal', 'vertical', or 'flex'
    layout_config = {
      width = 0.9,
      height = 0.85,
      prompt_position = "top",    -- 'top' or 'bottom'
      preview_width = 0.6,
      mirror = false,
    },
    sorting_strategy = "ascending", -- results appear top-down
    prompt_prefix = "  ",        -- custom icon
    selection_caret = " ",        -- caret next to selected item
    entry_prefix = "   ",
    color_devicons = true,         -- colored icons if nvim-web-devicons is installed
    path_display = { "smart" },    -- shorten paths intelligently
    file_ignore_patterns = {
      "%.git/",
      "node_modules/",
      "dist/",
      "%.lock",
    },
    preview = {
      treesitter = true,           -- use treesitter highlighting in preview
      msg_bg_fillchar = " ",       -- fillchar for preview windows
    },
    mappings = {
      i = { -- insert mode
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-q>"] = "send_to_qflist",
        ["<C-x>"] = "select_horizontal",
        ["<C-v>"] = "select_vertical",
        ["<C-t>"] = "select_tab",
      },
      n = { -- normal mode
        ["j"] = "move_selection_next",
        ["k"] = "move_selection_previous",
        ["q"] = "close",
      },
    },
  },
})

-- Keymaps for picker commands
vim.keymap.set("n", "<leader>sf", function()
  require("snacks").picker.find_files()
end, { desc = "Snacks: Find files", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sg", function()
  require("snacks").picker.live_grep()
end, { desc = "Snacks: Live grep", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sb", function()
  require("snacks").picker.buffers()
end, { desc = "Snacks: Switch buffers", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sr", function()
  require("snacks").picker.oldfiles()
end, { desc = "Snacks: Recent files", noremap = true, silent = true })
