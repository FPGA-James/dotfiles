-- =============================================================================
-- lua/colorschemes/everforest.lua
-- https://github.com/sainnhe/everforest
-- Install: git clone --depth 1 https://github.com/sainnhe/everforest \
--            ~/.config/nvim/pack/local/opt/everforest
-- NOTE: Vimscript plugin — configured via globals before colorscheme loads.
-- =============================================================================
vim.cmd.packadd("everforest")

vim.g.everforest_background             = "medium"  -- "hard"|"medium"|"soft"
vim.g.everforest_enable_italic          = 1
vim.g.everforest_disable_italic_comment = 0
vim.g.everforest_transparent_background = 0
vim.g.everforest_dim_inactive_windows   = 0
vim.g.everforest_sign_column_background = "none"
vim.g.everforest_better_performance     = 1
vim.g.everforest_show_eob               = 1
