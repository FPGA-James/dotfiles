local opt = vim.opt

--opt.path +=**
opt.path:append("**")

opt.relativenumber = true
opt.number = true

-- autocomplete
opt.wildmenu = true  -- tab complete on command line
-- tabs
opt.tabstop = 4
opt.shiftwidth =4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = falser

-- search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
opt.cursorline = true

-- appearence
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace ="indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--split windows
opt.splitright = true
opt.splitright = true

opt.iskeyword:append("-")

vim.g.mapleader=" "
-- sv ctag support
vim.cmd [[set tags=./tags; ]]


--vim.g.tagbar_type_verilog_systemverilog = {'ctagstype' : 'verilog_systemverilog','kinds' : ['i:interfaces','e:typedefs','c:classes','t:tasks','f:functions','m:modules','p:programs','d:defines']}

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
