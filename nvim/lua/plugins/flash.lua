-- =============================================================================
-- lua/plugins/flash.lua
-- flash.nvim — jump anywhere on screen in 2-3 keystrokes
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/folke/flash.nvim \
--     ~/.config/nvim/pack/local/opt/flash.nvim
--
-- Keymap summary:
--   s             (n/x/o)  Flash jump        — type chars, pick label, teleport
--   S             (n/o)    Treesitter select  — pick a syntax node by label
--                          NOTE: visual S is intentionally left for nvim-surround
--   r             (o)      Remote flash       — apply operator at jump target
--   R             (o/x)    Treesitter remote
--   <C-s>         (c)      Toggle flash during / search
-- =============================================================================

vim.cmd.packadd("flash.nvim")

require("flash").setup({

  -- ── Label characters ──────────────────────────────────────────────────────
  -- The set of characters used as jump labels, in priority order.
  -- Home-row first for fastest reach.
  labels = "asdfghjklqwertyuiopzxcvbnm",

  -- ── Search ────────────────────────────────────────────────────────────────
  search = {
    -- Search across all visible windows, not just the current one.
    multi_window = true,

    -- "exact"  — literal match (default, fastest)
    -- "search" — Vim regex
    -- "fuzzy"  — fuzzy match
    mode = "exact",

    -- Wrap search around end of file.
    wrap = true,

    -- Filetypes / windows to exclude flash from.
    exclude = {
      "notify",
      "cmp_menu",
      "noice",
      "flash_prompt",
      -- Exclude non-focusable floating windows (e.g. documentation popups).
      function(win)
        return not vim.api.nvim_win_get_config(win).focusable
      end,
    },
  },

  -- ── Jump behaviour ────────────────────────────────────────────────────────
  jump = {
    -- Save position in the jumplist so <C-o> / <C-i> navigate back.
    jumplist  = true,

    -- Land at start of the match ("start" | "end" | "range").
    pos       = "start",

    -- Auto-jump when there is only one match (no label needed).
    autojump  = false,

    -- Clear search highlight after jumping.
    nohlsearch = true,
  },

  -- ── Labels ────────────────────────────────────────────────────────────────
  label = {
    -- Allow uppercase labels (doubles the available label pool).
    uppercase = true,

    -- Show the label overlaid on the match character (fastest to read).
    style     = "overlay",  -- "eol" | "overlay" | "right_align" | "inline"

    -- Show label after the match character (true) or before (false).
    after     = true,
    before    = false,

    -- Prioritise labels closer to the cursor.
    distance  = true,

    -- Re-use label characters as you type more (lowercase only by default).
    reuse     = "lowercase",

    -- Optional: rainbow colours make labels easier to distinguish at a glance.
    rainbow   = { enabled = false, shade = 5 },
  },

  -- ── Visual highlight ──────────────────────────────────────────────────────
  highlight = {
    -- Dim everything that is NOT a match (FlashBackdrop highlight group).
    backdrop = true,
    -- Highlight all matches, not just the ones with labels.
    matches  = true,
    priority = 5000,
  },

  -- ── Mode overrides ────────────────────────────────────────────────────────
  modes = {
    -- ── / search integration ────────────────────────────────────────────────
    -- When enabled, flash labels appear on all matches during / search.
    -- Toggle on-the-fly with <C-s> in command mode even when disabled here.
    search = {
      enabled   = false,   -- set true to always activate on /; or use <C-s>
      highlight = { backdrop = false },
      jump      = { history = true, register = true, nohlsearch = true },
    },

    -- ── f / F / t / T enhancement ───────────────────────────────────────────
    -- Shows labels on multi-line f/F/t/T targets.
    char = {
      enabled     = true,
      -- Show labels only in operator-pending mode (keeps normal mode clean).
      jump_labels = false,
      multi_line  = true,
      autohide    = false,
      -- Exclude label chars that would shadow common post-motion keys.
      label       = { exclude = "hjkliardc" },
      keys        = { "f", "F", "t", "T", ";", "," },
    },

    -- ── Treesitter node select ───────────────────────────────────────────────
    -- Labels every visible treesitter node; press label to jump+select the range.
    treesitter = {
      labels    = "abcdefghijklmnopqrstuvwxyz",
      jump      = { pos = "range", autojump = true },
      search    = { incremental = false },
      label     = { before = true, after = true, style = "inline" },
      highlight = { backdrop = false, matches = false },
    },

    -- ── Remote (operate at jump target without moving cursor) ─────────────
    remote = {
      remote_op = { restore = true, motion = true },
    },
  },

  -- ── Prompt window ─────────────────────────────────────────────────────────
  prompt = {
    enabled = true,
    prefix  = { { "⚡", "FlashPromptIcon" } },
    win_config = {
      relative = "editor",
      border   = "none",
      width    = 1,    -- fraction of editor width
      height   = 1,
      row      = -1,   -- offset from bottom
      col      = 0,
      zindex   = 1000,
    },
  },

  -- ── Remote operator settings ──────────────────────────────────────────────
  remote_op = {
    -- Restore cursor and window view after a remote operation.
    restore = false,
    motion  = false,
  },
})

-- ── Keymaps ───────────────────────────────────────────────────────────────────
-- Note: visual mode S is intentionally omitted — nvim-surround owns it.
-- Use S in normal/op-pending for treesitter node selection instead.

local map = vim.keymap.set

-- Core jump — works in normal, visual (x), and operator-pending (o).
map({ "n", "x", "o" }, "s", function() require("flash").jump() end,
  { desc = "Flash jump" })

-- Treesitter node selection — normal + op-pending only (not visual, nvim-surround owns S there).
map({ "n", "o" }, "S", function() require("flash").treesitter() end,
  { desc = "Flash treesitter" })

-- Remote: apply operator at the jumped-to location, cursor stays put.
map("o", "r", function() require("flash").remote() end,
  { desc = "Flash remote" })

-- Treesitter remote — works in op-pending and visual.
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end,
  { desc = "Flash treesitter remote" })

-- Toggle flash labels during an active / search.
map("c", "<C-s>", function() require("flash").toggle() end,
  { desc = "Toggle flash search" })
