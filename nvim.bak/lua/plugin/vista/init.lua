--require("Vista").setup {
--    options = {
--        vista_sidebar_position = "vertical topleft",
--        vista_sidebar_width = "40",
--        vista_fold_icons = {"╰─▸ ", "├─▸ "},
----        vista_default_executive = "ctags",
--        vista#renderer#enable_icon = "1",
--        vista#renderer#icons = { {"function": "\uf794"},{"variable": "\uf71b"}},
--        vista#renderer#enable_icon = "1",
--    }
--}

local opt = vim.opt
local global =vim.g

vim.cmd [[let g:vista_sidebar_position =  "vertical topleft" ]]
vim.cmd [[let g:vista_sidebar_width =  "40" ]]
--" How each level is indented and what to prepend.
--" This could make the display more compact or more spacious.
--" e.g., more compact: ["▸ ", ""]
--" Note: this option only works for the kind renderer, not the tree renderer.
vim.cmd [[let g:vista_icon_indent = ["╰─▸ ", "├─▸ "] ]]

vim.cmd [[let g:vista_default_executive = 'ctags']]

vim.cmd [[let g:vista#renderer#enable_icon = '1']]

--" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
--vim.cmd [[let g:vista#renderer#icons = {
--    \   "function": "\uf794",
--    \   "variable": "\uf71b",
--    \   "port": "\uf71b",
--    \   "instance": "\uf71b",
--    \   "register": "\uf71b",
--    \  }]]