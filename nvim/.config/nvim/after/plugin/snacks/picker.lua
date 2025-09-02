--@module 'snacks'
--@type snacks.Config
--

return{
  picker = {

    enabled = true,
    layout = "flex",     -- 'horizontal', 'vertical', or 'flex'
    layout_config = {
      width = 0.9,
      height = 0.85,
      prompt_position = "bottom",    -- 'top' or 'bottom'
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


}

