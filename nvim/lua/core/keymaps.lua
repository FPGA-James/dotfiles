-- local keymaps for plug ins
--

------------------------------------------------------------------------------
-- CTRL + Key mappiing index
------------------------------------------------------------------------------
-- a <RESERVED FOR TMUX           -- n
-- b                              -- o
-- c                              -- p
-- d half page down jumop         -- q
-- e                              -- r
-- f ':NvimTreeToggle <CR> '      -- s
-- g                              -- t tagbar
-- h                              -- u half page up jump
-- i                              -- v
-- j quick fix navigation         -- w
-- k quick fix navigation         -- x
-- l                              -- y
-- m                              -- z
--
-- <SPACE> cmp.mapping.complete()
--
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- nvim Complete
--vim.keymap.set('n','<C-Space>',':NvimTreeToggle <CR> ')

--------------------------------------------------------------------------------
--nvim-tree
vim.keymap.set('n', '<C-f>', ':NvimTreeToggle <CR> ')

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- half page down jump with cursor in the middle
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- half page up jump with cursor in the middle
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") --
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") --
--vim.keymap.set("n", "<C-t>", ":TagbarToggle <CR>")
--------------------------------------------------------------------------------

------------------------------------------------------------------------------
--  Genral key maps
------------------------------------------------------------------------------
-- a                                  -- n search in the middle
-- b buffer control                   -- o
-- c                                  -- p
-- d                                  -- q
-- e                                  -- r
-- f                                  -- s
-- g                                  -- t
-- h                                  -- u
-- i                                  -- v
-- j                                  -- w
-- k                                  -- x
-- l                                  -- y
-- m                                  -- z
-----------------------------------------------------------------------------
-- A                                  -- N search in the middle
-- B                                  -- O
-- C                                  -- P
-- D                                  -- Q  VOID
-- E                                  -- R
-- F                                  -- S
-- G                                  -- T
-- H                                  -- U
-- I                                  -- V
-- J next line to end of current line -- W
-- K                                  -- X
-- L                                  -- Y
-- M                                  -- Z
--
-- <SPACE> cmp.mapping.complete()
--
--------------------------------------------------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted text downwhen in Visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move highligted text up when in Visual mode
vim.keymap.set("n", "J", "mzJ`z") -- moves next line to end of current line and keeps the cursor at the start
vim.keymap.set("n", "n", "nzzzv") -- keeps search in the middle
vim.keymap.set("n", "N", "Nzzzv") -- keeps search in the middle
vim.keymap.set("n", "Q", "<nop>") -- does nothing
vim.keymap.set("n", "bn", "<cmd> BufferLineCycleNext<cr>")
vim.keymap.set("n", "bp", "<cmd> BufferLineCyclePrev<cr>")

------------------------------------------------------------------------------
-- LEADER + Key mappiing index
------------------------------------------------------------------------------
-- a                              -- n
-- b buffer control               -- o
-- c                              -- p
-- d                              -- q
-- e                              -- r
-- f Telescope                    -- s Sessions-lens
-- g                              -- t TODO
-- h                              -- u undo tree
-- i                              -- v
-- j quick fix navigation         -- w VimWiki
-- k quick fix navigation         -- x Trouble
-- l LSP server                   -- y yank to void register
-- m                              -- z
------------------------------------------------------------------------------

local bufopts = { noremap = true, silent = true, buffer = bufnr }
local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------------
-- general
vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', bufopts)
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--vim.keymap.set("n",)
--------------------------------------------------------------------------------
-- undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
--------------------------------------------------------------------------------
-- trouble:
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", bufopts)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", bufopts)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", bufopts)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", bufopts)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", bufopts)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", bufopts)
--------------------------------------------------------------------------------
-- Telescope
local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', "<cmd> Telescope fd path_display={'smart'} <cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd> Telescope live_grep  path_display={'smart'} <cr>", {})
vim.keymap.set('n', '<leader>fb', "<cmd> Telescope buffers    path_display={'smart'} <cr>", {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.tags, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>fk', "<cmd> Telescope keymaps <cr>", bufopts)
vim.keymap.set('n', '<leader>fe', "<cmd> Telescope file_browser <cr>", bufopts)
-- SESSIONS
vim.keymap.set('n', '<leader>s', "<cmd> SearchSession <cr>")
--picker
-- TagbarToggle
vim.keymap.set("n", "<leader>tb", "<cmd> TagbarToggle <CR>")
vim.keymap.set("n", "<leader>env", "<cmd> Telescope env <CR>")
vim.keymap.set("n", "<leader>lsp", "<cmd> ToggleLSP <CR>")
--------------------------------------------------------------------------------
-- TODO
vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", bufopts)
vim.keymap.set("n", "<leader>tl", "<cmd>TodoLocationList<cr>", bufopts) -- requires ripgrep
vim.keymap.set("n", "<leader>tq", "<cmd>TodoQuickfixList<cr>", bufopts) -- requires ripgrep

--------------------------------------------------------------------------------
-- LSP TODO update key map  TODO FIX
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, bufopts) -- Show diagnostics in a floating window
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts) -- not availible for verible
--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)               -- not availible for verible
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) -- implement fix
--vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
vim.keymap.set('n', '<A-]>', '<cmd> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>', bufopts)
vim.keymap.set('n', '<C-/>', '<cmd> :tab <CR>:exec("tag ".expand("<cword>"))<CR>', bufopts)
--------------------------------------------------------------------------------
-- VIM WIKI
-- vim.keymap.set('n', '<Leader>wv', "<cmd> : vsplit | :VimwikiIndex <cr>", bufopts) -- Open default wiki index file.
-- vim.keymap.set('n', '<Leader>wwd', "<cmd> : vsplit | :VimwikiDiaryIndex <cr>", bufopts) -- Open default wiki index file.
--vim.keymap.set('n', '<Leader>wt'', ,bufopts)         -- Open default wiki index file in a new tab.
--vim.keymap.set('n', '<Leader>ws'', ,bufopts)         -- Select and open wiki index file.
--vim.keymap.set('n', '<Leader>wd'', ,bufopts)         -- Delete wiki file you are in.
--vim.keymap.set('n', '<Leader>wr'', ,bufopts)         -- Rename wiki file you are in.
--vim.keymap.set('n', '<Enter>            -- Follow/Create wiki link.
--vim.keymap.set('n', '<Shift-Enter>      -- Split and follow/create wiki link.
--vim.keymap.set('n', '<Ctrl-Enter>       -- Vertical split and follow/create wiki link.
--vim.keymap.set('n', '<Backspace>        -- Go back to parent(previous) wiki link.
--vim.keymap.set('n', '<Tab>              -- Find next wiki link.
--vim.keymap.set('n', '<Shift-Tab>        -- Find previous wiki link.

-------------------------------------------------------------------------------
-- Org-mode & Telekasten (org-roam)
vim.keymap.set("n", "<leader>os", '<cmd>lua require("telekasten").search_notes() <CR>', bufots)
vim.keymap.set("n", "<leader>nsc", '<cmd>lua require("telekasten").show_calendar() <CR>', bufots)
vim.keymap.set("n", "<leader>op", '<cmd>lua require("telekasten").panel() <CR>', bufots)

--vim.keymap.set("n", "<leader>br", '<cmd>lua require("telekasten").search_notes() <CR>', bufots)
--vim.keymap.set("n", "<leader>br", '<cmd>lua require("telekasten").search_notes() <CR>', bufots)
--vim.keymap.set("n", "<leader>br", '<cmd>lua require("telekasten").search_notes() <CR>', bufots)
--vim.keymap.set("n", "<leader>br", '<cmd>lua require("telekasten").search_notes() <CR>', bufots)

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>bb", '<cmd>lua require("edgy").toggle() <CR>', bufots)


vim.keymap.set("n", "<leader>bl", '<cmd>lua require("edgy").toggle("left") <CR>', bufots)

vim.keymap.set("n", "<leader>br", '<cmd>lua require("edgy").toggle("right") <CR>', bufots)
