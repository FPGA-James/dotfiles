-- =============================================================================
-- lua/colorschemes/init.lua
-- Loads and configures all colorschemes. Change `vim.cmd.colorscheme()`
-- at the bottom to switch the active theme.
--
-- Available names:
--   catppuccin-latte  catppuccin-frappe  catppuccin-macchiato  catppuccin-mocha
--   tokyonight  tokyonight-night  tokyonight-storm  tokyonight-day  tokyonight-moon
--   rose-pine  rose-pine-moon  rose-pine-dawn
--   kanagawa  kanagawa-wave  kanagawa-dragon  kanagawa-lotus
--   nightfox  duskfox  nordfox  terafox  carbonfox  dayfox
--   gruvbox
--   onedark
--   everforest
--   dracula
--   oxocarbon
-- =============================================================================

require("colorschemes.catppuccin")
require("colorschemes.tokyonight")
require("colorschemes.rose-pine")
require("colorschemes.kanagawa")
require("colorschemes.nightfox")
require("colorschemes.gruvbox")
require("colorschemes.onedark")
require("colorschemes.everforest")
require("colorschemes.dracula")
require("colorschemes.oxocarbon")

-- ── Active colorscheme ────────────────────────────────────────────────────────
vim.cmd.colorscheme("catppuccin-mocha")
