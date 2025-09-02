require('options')
require('plugins')
require('keymaps')
require('lsp')
-- require('snacks')

 vim.cmd([[colorscheme gruvbox]])

-- List of color schemes
local themes = {
    "gruvbox", "onedark", "catppuccin", "tokyonight",
    "material", "everforest", "kanagawa"
}

-- Index to track current theme
local theme_index = 0

-- Function to cycle themes
local function cycle_theme()
    theme_index = theme_index + 1
    if theme_index > #themes then theme_index = 1 end
    local theme = themes[theme_index]

    -- Apply the colorscheme
    vim.cmd("colorscheme " .. theme)
    print("Theme switched to: " .. theme)
end

-- Map <leader>t to cycle theme
vim.keymap.set('n', '<leader>t', cycle_theme, { noremap = true, silent = true })
