-- =============================================================================
-- lua/plugins/claude-code.lua
-- claude-code.nvim — Claude Code CLI integration for Neovim
--
-- Uses your existing Claude Code subscription (no API key needed).
-- Spawns the `claude` CLI in a terminal window, auto-reloads files it edits,
-- and sets the working directory to the git project root automatically.
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/greggh/claude-code.nvim \
--     ~/.config/nvim/pack/local/opt/claude-code.nvim
-- =============================================================================

vim.cmd.packadd("claude-code.nvim")

require("claude-code").setup({

  -- ── Terminal window ────────────────────────────────────────────────────────
  window = {
    -- Fraction of the screen width the terminal takes up (vertical split).
    split_ratio = 0.35,

    -- "topleft vsplit" opens a vertical split pinned to the left edge.
    -- Other options: "botright vsplit" (right), "botright" (bottom), "float"
    position = "topleft vsplit",

    -- Jump into insert mode immediately when the window opens.
    enter_insert = true,

    -- Keep the terminal buffer clean — no line numbers or sign column.
    hide_numbers    = true,
    hide_signcolumn = true,
  },

  -- ── File refresh ───────────────────────────────────────────────────────────
  -- When Claude edits a file on disk, automatically reload it in Neovim.
  refresh = {
    enable             = true,
    -- Shorten updatetime while Claude is active so changes are caught quickly.
    updatetime         = 100,
    -- How often (ms) to poll for external file changes.
    timer_interval     = 1000,
    -- Show a notification when a buffer is reloaded.
    show_notifications = true,
  },

  -- ── Git integration ────────────────────────────────────────────────────────
  git = {
    -- Launch Claude with the git project root as the working directory,
    -- so it has full project context regardless of where you opened nvim.
    use_git_root = true,
  },

  -- ── Shell ─────────────────────────────────────────────────────────────────
  shell = {
    separator = "&&",     -- command separator (bash/zsh compatible)
    pushd_cmd = "pushd",  -- directory stack push
    popd_cmd  = "popd",   -- directory stack pop
  },

  -- ── Command ────────────────────────────────────────────────────────────────
  -- The CLI binary to invoke. Must be in $PATH.
  command = "claude",

  -- Variants are alternate launch modes accessible via dedicated keymaps.
  command_variants = {
    -- Resume the most recent Claude conversation.
    continue = "--continue",
    -- Show an interactive picker of past conversations.
    resume   = "--resume",
    -- Enable verbose turn-by-turn output.
    verbose  = "--verbose",
  },

  -- ── Keymaps ────────────────────────────────────────────────────────────────
  keymaps = {
    toggle = {
      -- Main toggle: open/close the Claude Code terminal.
      -- Mapped under <leader>c to match the AI group in which-key.
      normal   = "<leader>cc",
      terminal = "<leader>cc",

      -- Variant keymaps (normal mode only).
      variants = {
        continue = "<leader>cR", -- resume most recent conversation
        verbose  = "<leader>cV", -- launch with verbose output
      },
    },
    -- <C-h/j/k/l> navigation out of the terminal window.
    window_navigation = true,
    -- <C-f/b> page scroll inside the terminal.
    scrolling = true,
  },
})
