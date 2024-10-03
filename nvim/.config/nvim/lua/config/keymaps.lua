-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herie

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "bp", "<cmd>: bp<cr>", { desc = "previous buffer" })
keymap("n", "bn", "<cmd>: bn<cr>", { desc = "next buffer" })
keymap('n', "bb", '<cmd> enew <CR>', opts) -- new buffer
keymap('n', 'bx', ':Bdelete!<CR>', opts) -- close buffer

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

-- Window management
vim.keymap.set('n', '<leader>uv', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>uh', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>use', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>uxs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', opts)
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
