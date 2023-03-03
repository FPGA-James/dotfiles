-------------------------------------------------------------------------------
-- pull in color scheme configs this is optional for many themes
--
--require("core.themes.cappuchin")
--require("core.themes.tokyonight-night")
--require("core.themes.tokyonight")
-- add list of plugins to install

--------------------------------------------------------------------------------
-- SET COLOR THEME HERE
vim.cmd[[colorscheme gruvbox]]


-- import packer safely
--local status, packer = pcall(require, "packer")
--if not status then
--  return
--end

--return packer.startup(function(use)
--    use {"catppuccin/nvim"}
--    use {"folke/tokyonight.nvim"}
--    use {"bluz71/vim-nightfly-guicolors"}
--    use {'jacoborus/tender.vim'}
--    use {'rktjmp/lush.nvim'}
--    use { "ellisonleao/gruvbox.nvim" }
--    use {'folke/lsp-colors.nvim'}
--    use {"savq/melange-nvim"}
--    use {
--    "mcchrish/zenbones.nvim",
--        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
--        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
--        -- In Vim, compat mode is turned on as Lush only works in Neovim.
--        requires = "rktjmp/lush.nvim"
--    }
--    use{'luisiacc/gruvbox-baby'}
--    use{'AlexvZyl/nordic.nvim'}
--end
--)