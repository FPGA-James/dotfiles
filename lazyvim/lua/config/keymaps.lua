-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps herie

local keymap = vim.keymap.set
local opts = { silent = true }

keymap("n", "bp", "<cmd>: bp<cr>", { desc = "previous buffer" })
keymap("n", "bn", "<cmd>: bn<cr>", { desc = "next buffer" })
