-- =============================================================================
-- lua/plugins/diffview.lua
-- diffview.nvim — side-by-side git diff and file history viewer
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/sindrets/diffview.nvim \
--     ~/.config/nvim/pack/local/opt/diffview.nvim
--
-- Dependencies (already installed): plenary.nvim, nvim-web-devicons
--
-- Commands:
--   :DiffviewOpen [git-rev]    — diff working tree (or a specific rev/range)
--   :DiffviewOpen HEAD~3..HEAD — diff a commit range
--   :DiffviewFileHistory %     — git log for current file, each entry diffable
--   :DiffviewFileHistory       — git log for the whole repo
--   :DiffviewClose             — close the current diffview tab
-- =============================================================================

vim.cmd.packadd("diffview.nvim")

local actions = require("diffview.actions")

require("diffview").setup({

  -- ── Diff options ──────────────────────────────────────────────────────────
  diff_binaries = false,   -- show diffs for binary files (hexdump)
  enhanced_diff_hl = true, -- per-word diff highlights within changed lines

  -- Git executable (must be on $PATH).
  git_cmd = { "git" },

  -- Hg executable — not used (no Mercurial).
  hg_cmd = {},

  -- Watch the index and HEAD and automatically refresh the diff when they
  -- change (e.g. after a stage/unstage from gitsigns).
  watch_index = true,

  -- ── Icons ─────────────────────────────────────────────────────────────────
  icons = {
    folder_closed = "",
    folder_open   = "",
  },

  signs = {
    fold_closed = "",
    fold_open   = "",
    done        = "✓",
  },

  -- ── View options ──────────────────────────────────────────────────────────
  view = {
    -- ── Default (working-tree) diff layout ──────────────────────────────
    default = {
      -- "diff2_horizontal" | "diff2_vertical"
      layout = "diff2_horizontal",
      winbar_info = false,
    },
    -- ── Merge tool layout ───────────────────────────────────────────────
    merge_tool = {
      -- "diff3_horizontal" | "diff3_vertical" | "diff3_mixed" | "diff4_mixed"
      layout          = "diff3_horizontal",
      -- Disable syntax highlighting in the merge tool (can be slow on large files).
      disable_diagnostics = true,
      winbar_info     = true,
    },
    -- ── File history layout ─────────────────────────────────────────────
    file_history = {
      layout = "diff2_horizontal",
      winbar_info = false,
    },
  },

  -- ── File panel (left sidebar) ─────────────────────────────────────────────
  file_panel = {
    listing_style = "tree",   -- "list" | "tree"
    tree_options = {
      flatten_dirs      = true,   -- collapse single-child dirs
      folder_statuses   = "only_folded",  -- "never" | "only_folded" | "always"
    },
    win_config = {
      position = "left",
      width    = 35,
    },
  },

  -- ── File history panel ────────────────────────────────────────────────────
  file_history_panel = {
    log_options = {
      git = {
        single_file = {
          diff_merges = "combined",
        },
        multi_file = {
          diff_merges = "first-parent",
        },
      },
    },
    win_config = {
      position = "bottom",
      height   = 16,
    },
  },

  -- ── Commit log panel ──────────────────────────────────────────────────────
  commit_log_panel = {
    win_config = {},
  },

  -- ── Default args passed to :DiffviewOpen ─────────────────────────────────
  default_args = {
    DiffviewOpen        = {},
    DiffviewFileHistory = {},
  },

  -- ── Hooks ─────────────────────────────────────────────────────────────────
  hooks = {},

  -- ── Keymaps ───────────────────────────────────────────────────────────────
  keymaps = {
    disable_defaults = false,  -- keep all default diffview keymaps

    -- Override or extend individual keymaps here.
    -- Format: { mode, lhs, action, opts }
    view = {
      { "n", "<leader>b", actions.toggle_files, { desc = "Toggle file panel" } },
    },
    file_panel = {
      { "n", "q", actions.close, { desc = "Close diffview" } },
    },
    file_history_panel = {
      { "n", "q", actions.close, { desc = "Close diffview" } },
    },
  },
})

-- ── Global keymaps ────────────────────────────────────────────────────────────
local map = vim.keymap.set

-- Open diff against the index (staged vs working tree).
map("n", "<leader>gv", "<cmd>DiffviewOpen<CR>",
  { desc = "Diffview open" })

-- Diff a specific range — prompt for a git ref.
map("n", "<leader>gV", function()
  local ref = vim.fn.input("Diff ref/range: ", "HEAD~1")
  if ref ~= "" then vim.cmd("DiffviewOpen " .. ref) end
end, { desc = "Diffview open ref…" })

-- File history for the current file.
map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>",
  { desc = "File history (current file)" })

-- File history for the whole repo.
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>",
  { desc = "File history (repo)" })

-- Close diffview from any buffer.
map("n", "<leader>gq", "<cmd>DiffviewClose<CR>",
  { desc = "Diffview close" })
