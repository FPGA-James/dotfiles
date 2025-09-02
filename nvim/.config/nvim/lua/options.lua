-- lua/options.lua
-- Neovim Options (full set, with defaults and comments)
vim.g.mapleader = " "
-- =====================
-- Basic editing
-- =====================
vim.opt.number = true                 -- Show absolute line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.expandtab = true              -- Use spaces instead of tabs
vim.opt.shiftwidth = 4                -- Number of spaces for each indentation
vim.opt.tabstop = 4                   -- Number of spaces tabs count for
vim.opt.softtabstop = 4               -- Number of spaces a tab feels like while editing
vim.opt.smartindent = true            -- Smart autoindenting
vim.opt.autoindent = true             -- Copy indent from current line when starting a new line
vim.opt.backspace = "indent,eol,start"-- Make backspace behave more naturally
vim.opt.clipboard = "unnamedplus"    -- Use system clipboard

-- =====================
-- Searching
-- =====================
vim.opt.ignorecase = true             -- Case-insensitive search
vim.opt.smartcase = true              -- Case-sensitive if uppercase used
vim.opt.incsearch = true              -- Incremental search
vim.opt.hlsearch = true               -- Highlight search results

-- =====================
-- Appearance
-- =====================
vim.opt.termguicolors = true          -- Enable 24-bit RGB colors
vim.opt.cursorline = true             -- Highlight current line
vim.opt.signcolumn = "yes"            -- Always show sign column
vim.opt.showmode = true               -- Show current mode
vim.opt.showcmd = true                -- Show partial command in bottom right
vim.opt.showmatch = true              -- Briefly jump to matching bracket
vim.opt.wrap = false                  -- Disable line wrap
vim.opt.scrolloff = 8                 -- Keep 8 lines visible when scrolling
vim.opt.sidescrolloff = 8             -- Keep 8 columns visible horizontally

-- =====================
-- Files and backups
-- =====================
vim.opt.swapfile = false              -- Disable swap file
vim.opt.backup = false                -- Disable backup file
vim.opt.undofile = true               -- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath('data') .. "/undo"  -- Directory for undo files

-- =====================
-- Window and buffer behavior
-- =====================
vim.opt.splitright = true             -- Vertical splits go to the right
vim.opt.splitbelow = true             -- Horizontal splits go below
vim.opt.hidden = true                 -- Enable background buffers
vim.opt.equalalways = true            -- Windows are automatically resized when splitting
vim.opt.lazyredraw = true             -- Do not redraw while executing macros

-- =====================
-- Mouse and GUI
-- =====================
vim.opt.mouse = "a"                   -- Enable mouse in all modes
vim.opt.guifont = "Monospace:h12"    -- Default GUI font (if using GUI)

-- =====================
-- Completion and command line
-- =====================
vim.opt.completeopt = { "menuone", "noselect" }  -- Completion options
vim.opt.shortmess:append("c")                     -- Don't show extra messages
vim.opt.cmdheight = 1                              -- Height of command line

-- =====================
-- Folding
-- =====================
vim.opt.foldmethod = "indent"        -- Fold by indent level
vim.opt.foldlevel = 99               -- Open most folds by default
vim.opt.foldenable = true             -- Enable folding

-- =====================
-- Miscellaneous
-- =====================
vim.opt.timeoutlen = 500             -- Time in ms to wait for a mapped sequence
vim.opt.updatetime = 300             -- Time in ms for CursorHold event
vim.opt.signcolumn = "yes"           -- Always show sign column
vim.opt.iskeyword:append("-")        -- Treat dash as part of a word
vim.opt.exrc = true                   -- Allow project-local .nvimrc files
vim.opt.virtualedit = "block"        -- Allow cursor to move anywhere in visual block

-- =====================
-- Default colorscheme
-- =====================
vim.cmd([[colorscheme desert]])      -- Default colorscheme

-- =====================
-- Additional settings
-- =====================
-- You can add more language-specific or plugin-specific defaults here
