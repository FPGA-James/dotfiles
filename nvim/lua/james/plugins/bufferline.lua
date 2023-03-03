vim.opt.termguicolors = true
local bufferline = require("bufferline")

local lazy = require("bufferline.lazy")
--- @module "bufferline.groups"
local groups = lazy.require("bufferline.groups")
--- @module "bufferline.utils"
local utils = lazy.require("bufferline.utils")
--- @module "bufferline.highlights"
local highlights = lazy.require("bufferline.highlights")
--- @module "bufferline.colors"
local colors = lazy.require("bufferline.colors")
--- @module "bufferline.colors"
local constants = lazy.require("bufferline.constants")
bufferline.setup{
    options = {
        mode = "buffers",
        themable = true, -- whether or not bufferline highlights can be overridden externally
        numbers = "none",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        close_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        right_mouse_command = "bdelete! %d",
        middle_mouse_command = nil,
        -- U+2590 ▐ Right half block, this character is right aligned so the
        -- background highlight doesn't appear in the middle
        -- alternatives:  right aligned => ▕ ▐ ,  left aligned => ▍
        indicator = {
            icon = constants.indicator,
            style = "icon",
        },
        left_trunc_marker = "",
        right_trunc_marker = "",
        separator_style = "thin",
        name_formatter = nil,
        truncate_names = true,
        tab_size = 18,
        max_name_length = 18,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_buffer_default_icon = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        persist_buffer_sort = true,
        max_prefix_length = 15,
        sort_by = "id",
        diagnostics = "nvim-lsp",
        --diagnostics_indicator = nil,
        diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or ""
                return " " .. icon .. count
            end,
        diagnostics_update_in_insert = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        },
        groups = {
            items = {},
            options = {
                toggle_hidden_on_enter = true,
            },
        },
        hover = {
            enabled = true,
            reveal = {},
            delay = 200,
        },
        debug = {
            logging = false,
        },
    }
}
