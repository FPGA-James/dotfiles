vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp",
        --diagnostics_indicator = function(count,level),
        --diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --    if context.buffer:current() then
        --        return ''
        --    end
        --    return ''
        --end,
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,

        diagnostics_update_in_insert = true,
        hover = {
            enabled = true,
            reveal = {'close'},
            delay = 200,
        },
 
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        }
    }
}
