local default_conf = {
    priority = 15,
    style = {
        { fg = "#806d9c" },
        { fg = "#c21f30" },
    },
    use_treesitter = true,
    chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "╭",
        left_bottom = "╰",
        right_arrow = "─",
    },
    textobject = "",
    max_file_size = 1024 * 1024,
    error_sign = true,
    -- animation related
    duration = 200,
    delay = 0,
}
return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },

  
    config = function()
      require("hlchunk").setup({
        chunk = {
            enable = true,
            chars = {
                horizontal_line = "─",
                vertical_line = "│",
                left_top = "╭",
                left_bottom = "╰",
                right_arrow = "─",
            },
            style = "#806d9c",
            -- ...
        },
        indent = {
            enable = false
            -- ...
        },
        line_num = {
            style = "#806d9c",
        },

      })
    end
  }
