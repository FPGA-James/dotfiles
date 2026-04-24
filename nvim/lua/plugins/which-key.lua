-- =============================================================================
-- lua/plugins/which-key.lua
-- which-key.nvim — keybinding hints popup
--
-- Source location (local):
--   ~/.config/nvim/pack/local/opt/which-key.nvim/
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/folke/which-key.nvim \
--     ~/.config/nvim/pack/local/opt/which-key.nvim
--
-- Because the plugin lives under pack/local/opt/ (not "start"), Neovim will
-- NOT auto-load it.  We use packadd here to load it explicitly at the exact
-- point we want it, then call setup() immediately after.
-- =============================================================================

-- Load the plugin from pack/local/opt/
vim.cmd.packadd("which-key.nvim")

-- ── Setup ─────────────────────────────────────────────────────────────────────
local wk = require("which-key")

wk.setup({
  -- ── Preset ────────────────────────────────────────────────────────────────
  -- Which built-in presets to enable.
  -- "helix" | "classic" | false
  preset = "classic",

  -- ── Delay ─────────────────────────────────────────────────────────────────
  -- Delay (ms) before the popup appears.
  -- Can be a number or a function: function(ctx) return 200 end
  delay = 200,

  -- ── Filter ────────────────────────────────────────────────────────────────
  -- Filter out mappings you never want shown.
  -- Receives the mapping table; return false to hide it.
  filter = function(_mapping)
    return true
  end,

  -- ── Plugins ───────────────────────────────────────────────────────────────
  plugins = {
    marks     = true,   -- show marks on ' and `
    registers = true,   -- show register contents on " and <C-r>
    spelling = {
      enabled     = false,  -- enable spelling suggestions on z=
      suggestions = 20,     -- how many suggestions to show
    },
    -- Presets add descriptions for common built-in Neovim keys.
    presets = {
      operators    = true,  -- descriptions for operators like d, y, c …
      motions      = true,  -- descriptions for motions
      text_objects = true,  -- descriptions for text objects triggered after operator
      windows      = true,  -- descriptions for <C-w>
      nav          = true,  -- descriptions for buffer navigation
      z            = true,  -- descriptions for z prefix
      g            = true,  -- descriptions for g prefix
    },
  },

  -- ── Win (popup window) ────────────────────────────────────────────────────
  win = {
    -- Don't allow the popup to overlap with the cursor.
    no_overlap   = true,
    -- Padding inside the window: { top, right, bottom, left }
    padding      = { 1, 2, 1, 2 },
    title        = true,
    title_pos    = "center",
    zindex       = 1000,
    -- Extra window options passed to nvim_open_win.
    wo = {
      winblend = 0,  -- 0 = fully opaque
    },
  },

  -- ── Layout ────────────────────────────────────────────────────────────────
  layout = {
    width  = { min = 20 },  -- min/max column width of each column
    spacing = 3,             -- spacing between columns
  },

  -- ── Keys ──────────────────────────────────────────────────────────────────
  -- Keys that scroll the popup window when it is focused.
  keys = {
    scroll_down = "<C-d>",
    scroll_up   = "<C-u>",
  },

  -- ── Sort ──────────────────────────────────────────────────────────────────
  -- How to sort the keys in the popup.
  -- "local" | "order" | "group" | "alphanum" | "mod" | "lower" | "icase" | "desc" | "manual"
  sort = { "local", "order", "group", "alphanum", "mod" },

  -- ── Expand ────────────────────────────────────────────────────────────────
  -- How many items to show before expanding groups.
  expand = 1,

  -- ── Icons ─────────────────────────────────────────────────────────────────
  icons = {
    breadcrumb = "»",    -- separator in the top-right command path
    separator  = "➜",   -- separator between key and description
    group      = "+",    -- prefix for group entries
    ellipsis   = "…",
    -- Set to false to disable all icon rendering (no nerd font required).
    mappings   = true,
    -- Rules to assign icons to individual keys / groups.
    -- See :h which-key.nvim-icons for format.
    rules      = {},
    -- Use the mini.icons or nvim-web-devicons plugin if available.
    colors     = true,
    keys = {
      -- Override key-icon display here, e.g.: Up = " "
    },
  },

  -- ── Show ──────────────────────────────────────────────────────────────────
  show_help    = true,   -- show a message at the bottom about which-key
  show_keys    = true,   -- show the current key combo in the header

  -- ── Disable ───────────────────────────────────────────────────────────────
  -- Filetypes / buffer types where which-key is disabled.
  disable = {
    ft = {},
    bt = {},
  },

  -- ── Debug ─────────────────────────────────────────────────────────────────
  debug = false,
})

-- =============================================================================
-- Keymap registrations
-- Use wk.add() to attach descriptions to any mapping.
-- Groups:  { "<prefix>", group = "name" }
-- Mapping: { "<keys>", "<rhs>", desc = "description" }
-- =============================================================================

-- Returns a which-key icon table reflecting the current toggle state.
-- \xef\x88\x85 = U+F205 nf-fa-toggle_on  (green when enabled)
-- \xef\x88\x84 = U+F204 nf-fa-toggle_off (yellow when disabled)
local function tog(state)
  if state then
    return { icon = "\xef\x88\x85 ", color = "green" }
  else
    return { icon = "\xef\x88\x84 ", color = "yellow" }
  end
end

wk.add({
  -- ── Top-level shortcuts ───────────────────────────────────────────────────
  { "<leader><leader>", function() Snacks.picker.files() end, desc = "Find files" },

  -- ── Groups ────────────────────────────────────────────────────────────────
  { "<leader>a",  group = "ai / claude" },
  { "<leader>d",  group = "diff preview" },
  { "<leader>o",  group = "obsidian" },
  { "<leader>b",  group = "buffers" },
  { "<leader>f",  group = "find / files" },
  { "<leader>g",  group = "git" },
  { "<leader>l",  group = "lsp" },
  { "<leader>lw", group = "workspace" },
  { "<leader>n",  group = "notifications" },
  { "<leader>p",  group = "profiler" },
  { "<leader>t",  group = "terminal" },
  { "<leader>T",  group = "test" },
  { "<leader>u",  group = "ui toggles" },
  { "<leader>w",  group = "windows" },
  { "<leader>x",  group = "diagnostics / quickfix" },

  -- ── UI toggles ────────────────────────────────────────────────────────────
  -- Note: <leader>un / <leader>nh are wired in plugins/snacks.lua (notifications)
  --       <leader>uz / <leader>uZ are wired in plugins/snacks/zen.lua
  -- icon is a function so which-key re-evaluates state each time the popup opens.
  { "<leader>uh", "<cmd>nohlsearch<CR>", desc = "Clear search highlights" },
  { "<leader>uN", function() vim.opt.number        = not vim.o.number        end, icon = function() return tog(vim.o.number)                   end, desc = "Line Numbers"     },
  { "<leader>ur", function() vim.opt.relativenumber = not vim.o.relativenumber end, icon = function() return tog(vim.o.relativenumber)          end, desc = "Relative Numbers" },
  { "<leader>uw", function() vim.opt.wrap           = not vim.o.wrap           end, icon = function() return tog(vim.o.wrap)                    end, desc = "Word Wrap"        },
  { "<leader>us", function() vim.opt.spell          = not vim.o.spell          end, icon = function() return tog(vim.o.spell)                   end, desc = "Spell Check"      },
  { "<leader>ul", function() vim.opt.list           = not vim.o.list           end, icon = function() return tog(vim.o.list)                    end, desc = "List Chars"       },
  { "<leader>uL", function() vim.opt.cursorline     = not vim.o.cursorline     end, icon = function() return tog(vim.o.cursorline)              end, desc = "Cursor Line"      },
  { "<leader>uc", function() vim.opt.conceallevel   = vim.o.conceallevel == 0 and 2 or 0 end, icon = function() return tog(vim.o.conceallevel > 0) end, desc = "Conceal (0↔2)" },
  { "<leader>ud", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,      icon = function() return tog(vim.diagnostic.is_enabled()) end, desc = "Diagnostics"  },
  { "<leader>uC", function() vim.opt.colorcolumn    = vim.o.colorcolumn == "" and "80,100" or "" end, icon = function() return tog(vim.o.colorcolumn ~= "") end, desc = "Color Column" },
  {
    "<leader>ui",
    function()
      if vim.g.snacks_indent == false then
        vim.g.snacks_indent = true
        Snacks.indent.enable()
      else
        vim.g.snacks_indent = false
        Snacks.indent.disable()
      end
    end,
    icon = function() return tog(vim.g.snacks_indent ~= false) end,
    desc = "Indent Guides",
  },
  { "<leader>uf", function() vim.g.conform_format_on_save = not vim.g.conform_format_on_save end, icon = function() return tog(vim.g.conform_format_on_save) end, desc = "Format on Save"  },
  { "<leader>uB", function() vim.o.background = vim.o.background == "dark" and "light" or "dark" end, icon = function() return tog(vim.o.background == "dark") end, desc = "Dark Background" },

  -- ── Claude Preview ────────────────────────────────────────────────────────
  -- <leader>dq is also set by the plugin itself; registering here adds the
  -- which-key description without conflicting.
  { "<leader>dq", desc = "Close diff" },
  { "<leader>di", "<cmd>ClaudePreviewInstallHooks<CR>",   desc = "Install hooks" },
  { "<leader>du", "<cmd>ClaudePreviewUninstallHooks<CR>", desc = "Uninstall hooks" },
  { "<leader>ds", "<cmd>ClaudePreviewStatus<CR>",         desc = "Status" },

  -- ── Window shortcuts (Snacks.toggle keymaps are registered below) ─────────
  { "<leader>wh", "<C-w>h",          desc = "Go to left window" },
  { "<leader>wj", "<C-w>j",          desc = "Go to lower window" },
  { "<leader>wk", "<C-w>k",          desc = "Go to upper window" },
  { "<leader>wl", "<C-w>l",          desc = "Go to right window" },
  { "<leader>ws", "<cmd>split<CR>",  desc = "Horizontal split" },
  { "<leader>wv", "<cmd>vsplit<CR>", desc = "Vertical split" },
  { "<leader>wq", "<cmd>close<CR>",  desc = "Close window" },

  -- ── Buffer shortcuts ──────────────────────────────────────────────────────
  { "<leader>bc", function() Snacks.bufdelete() end,               desc = "Close buffer" },
  { "<leader>bC", function() Snacks.bufdelete({ force = true }) end, desc = "Force close buffer" },
  { "<leader>bo", function() Snacks.bufdelete.other() end,         desc = "Close other buffers" },
  { "<leader>bO", function() Snacks.bufdelete.all() end,           desc = "Close all buffers" },
  { "<leader>bl", function() Snacks.picker.buffers() end,          desc = "List buffers" },
  { "<leader>bn", "<cmd>bnext<CR>",                                desc = "Next buffer" },
  { "<leader>bp", "<cmd>bprevious<CR>",                            desc = "Prev buffer" },

  -- ── Terminal ──────────────────────────────────────────────────────────────
  -- Primary toggle is <C-/> (wired in plugins/snacks/terminal.lua).
  -- <leader>t opens a named terminal per tab.
  {
    "<leader>tt",
    function() Snacks.terminal(nil, { win = { position = "bottom" } }) end,
    desc = "Terminal (split)",
  },
  {
    "<leader>tf",
    function() Snacks.terminal() end,
    desc = "Terminal (float)",
  },

  -- ── Diagnostics / quickfix ────────────────────────────────────────────────
  -- LSP navigation ([d / ]d / <leader>ld / <leader>lq) is in lua/lsp.lua.
  -- These are project-wide or quickfix-oriented shortcuts.
  {
    "<leader>xx",
    function() Snacks.picker.diagnostics_buffer() end,
    desc = "Diagnostics (buffer)",
  },
  {
    "<leader>xX",
    function() Snacks.picker.diagnostics() end,
    desc = "Diagnostics (workspace)",
  },
  {
    "<leader>xq",
    function() Snacks.picker.qflist() end,
    desc = "Quickfix list",
  },
  {
    "<leader>xl",
    function() Snacks.picker.loclist() end,
    desc = "Location list",
  },
  {
    "<leader>xn",
    function() vim.diagnostic.jump({ count = 1,  float = true }) end,
    desc = "Next diagnostic",
  },
  {
    "<leader>xp",
    function() vim.diagnostic.jump({ count = -1, float = true }) end,
    desc = "Prev diagnostic",
  },

  -- ── Minuet AI ─────────────────────────────────────────────────────────────
  {
    "<leader>am",
    function() require("minuet.virtualtext").action.toggle_auto_trigger() end,
    desc = "Minuet: toggle auto-suggest",
  },
  {
    "<leader>aM",
    function() require("minuet.duet").action.predict() end,
    desc = "Minuet: complete (manual)",
  },
})

