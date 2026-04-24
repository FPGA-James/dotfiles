-- =============================================================================
-- lua/plugins/snacks/lazygit.lua
-- Opens lazygit in a floating terminal with colorscheme sync and Neovim
-- integration (jump to file/line from lazygit back into Neovim).
--
-- Requires: lazygit on $PATH
--   macOS:  brew install lazygit
--   Ubuntu: https://github.com/jesseduffield/lazygit#installation
-- =============================================================================

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end,
  { desc = "Lazygit (repo root)" })
vim.keymap.set("n", "<leader>gF", function() Snacks.lazygit.log_file() end,
  { desc = "Lazygit log (current file)" })
vim.keymap.set("n", "<leader>gl", function() Snacks.lazygit.log() end,
  { desc = "Lazygit log (cwd)" })

return {
  enabled = true,

  -- Pass extra config keys to lazygit via environment variable.
  -- Snacks auto-sets the colorscheme based on your Neovim theme.
  configure = true,

  -- Theme tokens mapped to highlight groups.
  -- Snacks builds a lazygit theme from your current colorscheme.
  -- Override individual colours here if you need to.
  theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/snacks/lazygit-theme.yml"),

  -- Extra config written to the lazygit config file on each open.
  -- Keys mirror lazygit's config.yml format.
  config = {
    os = {
      -- Tells lazygit how to open files in Neovim.
      editPreset = "nvim-remote",
    },
    git = {
      -- Pull before pushing.
      autoFetch = true,
    },
  },

  -- ── Floating window ────────────────────────────────────────────────────
  win = {
    style  = "lazygit",   -- use the built-in lazygit window style
    width  = 0,           -- 0 = full width
    height = 0,           -- 0 = full height
    border = "none",
  },
}
