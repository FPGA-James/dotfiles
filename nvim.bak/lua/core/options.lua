local opt = vim.opt
local global =vim.g

local ft = require('Comment.ft')
ft.set('systemverilog', {'//%s', '/*%s*/'})
--opt.path +=**
opt.path:append("**")

opt.relativenumber = true
opt.number = true
opt.laststatus = 3
opt.splitkeep = "screen"

-- autocomplete
opt.wildmenu = true  -- tab complete on command line
-- tabs
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth =2
opt.expandtab = true
opt.autoindent = true
opt.colorcolumn = "120,180"
-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
opt.cursorline = true

-- appearence
opt.termguicolors = true
opt.background = "dark"
--opt.signcolumn = "yes"

-- backspace
opt.backspace ="indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitright = true
opt.signcolumn = "yes:3"

opt.iskeyword:append("-")

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- GLobal options
global.vimwiki_global_ext = 0
global.vimwiki_list = {{syntax = 'markdown', ext= '.md'}}
global.vimwiki_markdown_link_ext = 0

-- vunit settings
vim.cmd [[let g:VunitInvocationCmd = 'python3']]
vim.cmd [[let g:VunitRunpyScriptName = 'run.py']]
vim.cmd [[let g:VunitPreCmd = '']]
vim.cmd [[let g:VunitGuiPreCmd = '' ]]
vim.cmd [[let g:VunitGuiPreCmd = 'export $(tmux show-env | grep DISP);' ]]
vim.cmd [[let g:VunitAdditionalOptions = '' ]]
vim.cmd [[let g:VunitAdditionalOptions = '' ]]

-- systemverilog tagbar
vim.cmd [[ let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
     \ 'kinds'       : [
        \ 'b:blocks:1:1',
        \ 'i:instance:0:1',
        \ 'c:constants:1:0',
        \ 'e:events:1:0',
        \ 'f:functions:1:1',
        \ 'm:modules:0:1',
        \ 'n:nets:1:0',
        \ 'p:ports:1:0',
        \ 'r:registers:1:0',
        \ 't:tasks:1:1',
        \ 'A:assertions:1:1',
        \ 'C:classes:0:1',
        \ 'V:covergroups:0:1',
        \ 'I:interfaces:0:1',
        \ 'M:modport:0:1',
        \ 'K:packages:0:1',
        \ 'P:programs:0:1',
        \ 'R:properties:0:1',
        \ 'T:typedefs:0:1'
     \ ],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
        \ 'i' : 'instance',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
        \ 'instance'  : 'i',
     \ },
     \}]]
