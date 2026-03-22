-- =============================================================================
-- lua/options.lua
-- Every option is set explicitly to its Neovim default.
-- Change the value to customise; the comment shows what the default actually is.
-- Requires Neovim 0.12+
-- =============================================================================

local opt = vim.opt

-- -- Leader
vim.g.mapleader = " "

-- ── Appearance ────────────────────────────────────────────────────────────────
opt.number         = false          -- show absolute line numbers
opt.relativenumber = true          -- show relative line numbers
opt.cursorline     = false          -- highlight the line the cursor is on
opt.cursorcolumn   = false          -- highlight the column the cursor is on
opt.colorcolumn    = "120"             -- comm:a-list of columns to highlight
opt.signcolumn     = "auto"         -- "auto"|"yes"|"no"|"number"
opt.ruler          = true           -- show cursor position in statusline
opt.showcmd        = true           -- show partial command in last line
opt.showmode       = true           -- show -- INSERT -- etc. in last line
opt.laststatus     = 2              -- 0=never 1=only if split 2=always 3=global
opt.cmdheight      = 1             
-- number of lines for the command area
opt.pumheight      = 0              -- max items in popup menu (0 = unlimited)
opt.pumblend       = 0              -- popup-menu transparency 0-100
opt.winblend       = 0              -- floating-window transparency 0-100
opt.termguicolors  = true          -- enable 24-bit RGB colour in the TUI
opt.background     = "dark"         -- "dark"|"light" — hint for colorschemes
opt.conceallevel   = 3              -- 0=show text normally 1-3=conceal text
opt.concealcursor  = ""             -- modes where cursor line conceal is on
opt.listchars      = { tab = "> ", trail = "-", nbsp = "+" }
opt.list           = false          -- show listchars

-- ── Editing ───────────────────────────────────────────────────────────────────
opt.expandtab      = false          -- use spaces instead of <Tab>
opt.tabstop        = 4              -- visual width of <Tab> characters
opt.shiftwidth     = 4              -- indentation width for >> << and autoindent
opt.softtabstop    = 0              -- 0 = use tabstop; n = mix of spaces+tabs
opt.shiftround     = false          -- round indent to multiple of shiftwidth
opt.smarttab       = true           -- <Tab> at line start respects shiftwidth
opt.autoindent     = true           -- copy indent from current line to new line
opt.smartindent    = false          -- smart C-like autoindenting
opt.cindent        = false          -- strict C-style indenting
opt.backspace      = { "indent", "eol", "start" }  -- what <BS> can delete
opt.whichwrap      = "b,s"          -- which keys wrap past line boundaries
opt.iskeyword:append("")            -- keep Neovim default; extend here if needed
opt.nrformats      = { "bin", "hex" }  -- bases for CTRL-A / CTRL-X increment

-- ── Search ────────────────────────────────────────────────────────────────────
opt.hlsearch       = true           -- highlight all search matches
opt.incsearch      = true           -- show search matches as you type
opt.ignorecase     = false          -- case-insensitive search
opt.smartcase      = false          -- override ignorecase when pattern has uppercase
opt.wrapscan       = true           -- wrap search around end of file
opt.inccommand     = "nosplit"      -- live preview of :substitute ("nosplit"|"split"|"")

-- ── Wrapping & scrolling ──────────────────────────────────────────────────────
opt.wrap           = true           -- visually wrap long lines
opt.linebreak      = false          -- wrap at breakat chars, not mid-word
opt.breakindent    = false          -- preserve indentation in wrapped lines
opt.scrolloff      = 0              -- lines of context above/below cursor
opt.sidescrolloff  = 0              -- columns of context left/right of cursor
opt.sidescroll     = 1              -- minimal columns to scroll horizontally

-- ── Splits ────────────────────────────────────────────────────────────────────
opt.splitright     = true          -- new vertical split opens to the right
opt.splitbelow     = true          -- new horizontal split opens below
opt.splitkeep      = "cursor"       -- "cursor"|"screen"|"topline"
opt.equalalways    = true           -- resize all windows when splitting/closing

-- ── Files & buffers ───────────────────────────────────────────────────────────
opt.hidden         = true           -- allow switching from unsaved buffers (Nvim default)
opt.autoread       = true           -- reload file changed outside of Nvim (Nvim default)
opt.confirm        = false          -- ask to save when abandoning a buffer
opt.backup         = false          -- keep backup file after overwriting
opt.writebackup    = true           -- write backup before overwriting (deleted on success)
opt.swapfile       = true           -- use swap files
opt.undofile       = false          -- persist undo history to disk
opt.updatetime     = 4000           -- ms of inactivity before writing swap & CursorHold
opt.updatecount    = 200            -- nr of chars before writing swap (0 = disable swap)
opt.fsync          = false          -- call fsync() after writing (Nvim default: false)
opt.encoding       = "utf-8"        -- string encoding used internally (always utf-8 in Nvim)
opt.fileencoding   = "utf-8"        -- encoding for the current file

-- ── Completion ────────────────────────────────────────────────────────────────
opt.completeopt    = { "menu", "preview" }  -- insert-mode completion behaviour
opt.wildmenu       = true           -- enhanced command-line completion
opt.wildoptions    = { "pum", "tagfile" }   -- how wildmenu is displayed
opt.wildignorecase = false          -- ignore case in file/dir name completion

-- ── Folding ───────────────────────────────────────────────────────────────────
opt.foldenable     = true           -- enable folding
opt.foldmethod     = "manual"       -- "manual"|"indent"|"expr"|"syntax"|"marker"|"diff"
opt.foldlevel      = 0              -- folds with level > this are closed by default
opt.foldlevelstart = -1             -- starting foldlevel when editing a new buffer (-1=use foldlevel)
opt.foldcolumn     = "0"            -- columns for fold indicators ("0"=disabled)

-- ── Mouse ─────────────────────────────────────────────────────────────────────
opt.mouse          = "nvi"          -- ""|"a" or mode chars; Nvim default is "nvi"
opt.mousescroll    = { "ver:3", "hor:6" }  -- scroll amount per mouse wheel step

-- ── Timing ────────────────────────────────────────────────────────────────────
opt.timeout        = true           -- time out on mappings
opt.timeoutlen     = 1000           -- ms to wait for a mapped sequence to complete
opt.ttimeout       = true           -- time out on key codes
opt.ttimeoutlen    = 50             -- ms to wait for a key code sequence to complete

-- ── Clipboard ────────────────────────────────────────────────────────────────
opt.clipboard      = ""             -- "" = don't sync; "unnamedplus" = use system clipboard

-- ── Spell ─────────────────────────────────────────────────────────────────────
opt.spell          = false          -- spell checking
opt.spelllang      = { "en" }       -- spell-check languages

-- ── Formatting ────────────────────────────────────────────────────────────────
opt.formatoptions  = "tcqj"         -- Nvim default; controls auto-formatting (see :h fo-table)
opt.textwidth      = 0              -- max line length for auto-wrapping (0 = disabled)
opt.joinspaces     = false          -- don't insert two spaces after punctuation on join

-- ── Display ───────────────────────────────────────────────────────────────────
opt.display        = { "lastline", "uhex" }  -- Nvim default
opt.shortmess      = "ltToOCF"      -- Nvim default set of flags (see :h 'shortmess')
opt.fillchars      = {}             -- chars for UI elements (uses Unicode defaults)
opt.showbreak      = ""             -- string to show before wrapped line

-- ── Gutter & line info ────────────────────────────────────────────────────────
opt.numberwidth    = 4              -- min width of number column
opt.statuscolumn   = ""             -- custom statuscolumn expression ("" = default behaviour)

-- ── History & session ────────────────────────────────────────────────────────
opt.history        = 10000          -- command-line history size (Nvim default)
opt.sessionoptions = {              -- what :mksession saves
  "blank", "buffers", "curdir", "folds",
  "help", "tabpages", "terminal", "unix",
  "winsize",
}

-- ── Diff ──────────────────────────────────────────────────────────────────────
opt.diffopt        = { "internal", "filler", "closeoff" }  -- diff options

-- ── Misc ──────────────────────────────────────────────────────────────────────
opt.lazyredraw     = false          -- don't redraw screen during macros
opt.tgc            = false          -- alias; prefer opt.termguicolors above
opt.startofline    = false          -- move cursor to first non-blank on jump (Nvim default: false)
opt.virtualedit    = ""             -- ""|"block"|"insert"|"all"|"onemore"
opt.belloff        = "all"          -- events that should NOT trigger a bell (Nvim default)
opt.errorbells     = false          -- ring bell on error messages
opt.visualbell     = false          -- use visual bell instead of beeping
