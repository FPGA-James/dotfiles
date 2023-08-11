-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed
;                                        -- TODO: test
-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    return
end

-- add list of plugins to install
return packer.startup(function(use)
    -- packer can manage itself
    use("wbthomason/packer.nvim")
    use('dhruvasagar/vim-open-url')
    use("nvim-lua/plenary.nvim")                                                 -- lua functions that many plugins use
    use("christoomey/vim-tmux-navigator")                                        -- tmux & split window navigation
    use("szw/vim-maximizer")                                                     -- maximizes and restores current window
    --use("tpope/vim-surround")                                                       -- add, delete, change surroundings (it's awesome)
    use("inkarkat/vim-ReplaceWithRegister")                                      -- replace with register contents using motion (gr + motion)
    use("numToStr/Comment.nvim")                                                 -- commenting with gc
    use("nvim-tree/nvim-tree.lua")                                               -- file explorer
    use("majutsushi/tagbar")                                                     --
    use("vimwiki/vimwiki")                                                       -- vimwiki
    use("nvim-tree/nvim-web-devicons")                                           -- vs-code like icons
    use{"nvim-lualine/lualine.nvim", config = [[require("james.plugins.lualine")]]}                                             -- statusline
    use('mbbill/undotree')                                                       -- undo tree
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }      -- troube - shows lsp erros in window
    use("lukas-reineke/indent-blankline.nvim")                                   -- indentation
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })            -- dependency for better sorting performance
    use { 'alvarosevilla95/luatab.nvim', requires = 'kyazdani42/nvim-web-devicons' } -- lua tabs configurations
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }         -- side by side diff
    use { "AmeerTaweel/todo.nvim", requires = "nvim-lua/plenary.nvim" }          -- todo list
    use("nvim-treesitter/nvim-treesitter")                                       -- treesitter configuration
    use { 'gelguy/wilder.nvim' }                                                 -- better cmd line autofill
    use("windwp/nvim-autopairs")                                                 -- autoclose parens, brackets, quotes, etc...
    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })                 -- autoclose tags
    use { "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = [[require('james.plugins.todo-comments')]]
        --require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
    use { 'nvim-telescope/telescope.nvim', -- fuzzy finding w/ telescope
        requires = {                    -- install telescope plugins here
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-treesitter/nvim-treesitter' },
            { 'nvim-telescope/telescope-fzf-native.nvim',  run = 'make' },
            --{'nvim-telescope/telescope-symbols.nvim'},i
            { "nvim-telescope/telescope-github.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { "ElPiloto/telescope-vimwiki.nvim" },
            { 'nvim-telescope/telescope-media-files.nvim' }
            --{"AckslD/nvim-neoclip.lua"},
        }
    }
    -- TELESCOPE EXTENSIONS
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "benfowler/telescope-luasnip.nvim" }
    --use {"ElPiloto/telescope-vimwiki.nvim", module = "telescope._extensions.vimwiki"}  -- vimwiki integration to telescope
    use { 'VonHeikemen/fine-cmdline.nvim', requires = { { 'MunifTanjim/nui.nvim' } } }
    ---------------------------------------------------------------------------------
    --Neo-tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
    ---------------------------------------------------------------------------------
    -- EDGY
    use {"folke/edgy.nvim"}
    ---------------------------------------------------------------------------------
    --LSP tools
    use { 'VonHeikemen/lsp-zero.nvim', -- lsp and auto complete
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use('rcarriga/nvim-notify')
    ------------------------------------------------
    --Buffer management
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    ------------------------------------------------
    -- GIT tools
    use { "lewis6991/gitsigns.nvim" } -- shows diff signs in gutter
    use { "tpope/vim-fugitive" }  -- got plug in
    -- use {"airblade/vim-gitgutter"}  -- TODO: te
    ------------------------------------------------
    --CTAGS & EDA tools
    use { 'ludovicchabant/vim-gutentags' }
    use { 'vhda/verilog_systemverilog.vim' }
    use { 'liuchengxu/vista.vim' }
    -- sidebar
    use { 'sidebar-nvim/sidebar.nvim', config = [[require('james.plugins.sidebar')]] }
    ------------------------------------------------------------------------------
    -- colour schemes
    --use ("catppuccin/nvim")
    --use ("folke/tokyonight.nvim")
    --use("bluz71/vim-nightfly-guicolors")
    -- configured in colorscheme.lua
    --
    use("catppuccin/nvim")
    use("folke/tokyonight.nvim")
    use("bluz71/vim-nightfly-guicolors")
    use('jacoborus/tender.vim')
    use('rktjmp/lush.nvim')
    use { "ellisonleao/gruvbox.nvim" }
    use('folke/lsp-colors.nvim')
    use("savq/melange-nvim")
    use { "mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" }
    use('luisiacc/gruvbox-baby')
    use('AlexvZyl/nordic.nvim')

    -- alpha
    use { 'goolord/alpha-nvim' }
    --config = function ()
    --     require'plugins.alpha'.setup(require'james.plugins.alpha.dashboard'.config)
    -- end
    --}
    -------------------------------------------------------------------------------
    -- Leave as last
    if packer_bootstrap then
        require("packer").sync()
    end
end)
