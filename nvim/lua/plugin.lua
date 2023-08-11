-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    --local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    local install_path = fn.stdpath("data") ..
        "/users/apaweuc1svm02/james.fleeting/.local/share/nvim/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
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
    use { "wbthomason/packer.nvim" }
 
    --------------------------------------------------------------------------------------
    -- Base plugins used by other plugins ------------------------------------------------
    use { "nvim-lua/plenary.nvim" } -- lua functions that many plugins use
    use { "nvim-treesitter/nvim-treesitter", config = [[require('plugin.treesitter')]], } -- treesitter configuration
    use { "nvim-tree/nvim-tree.lua", config = [[require('plugin.nvim-tree')]] } -- file explorer
    use { "nvim-tree/nvim-web-devicons" } -- vs-code like icons
    -- use { 'rcarriga/nvim-notify', config = [[require('plugin.notify')]] } --

    --------------------------------------------------------------------------------------
    ---- Telescope schemes ---------------------------------------------------------------
    use { 'nvim-telescope/telescope.nvim', -- fuzzy finding w/ telescope
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            {'BurntSushi/ripgrep'},
            --{ 'nvim-treesitter/nvim-treesitter' },
            { 'nvim-telescope/telescope-fzf-native.nvim',  run = 'make' },
            --{'nvim-telescope/telescope-symbols.nvim'},
            -- TELESCOPE EXTENSIONiS
            { 'adoyle-h/lsp-toggle.nvim', config = function()
                require('lsp-toggle').setup()
                end
            },
            {"LinArcX/telescope-env.nvim"},
            { 'nvim-telescope/telescope-file-browser.nvim' },
            { 'nvim-telescope/telescope-project.nvim' },
            { 'nvim-telescope/telescope-media-files.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'ThePrimeagen/git-worktree.nvim' },
            { 'ElPiloto/telescope-vimwiki.nvim' },
            { "benfowler/telescope-luasnip.nvim" },
            { "fcying/telescope-ctags-outline.nvim"}
        },
        config = [[require('plugin.telescope')]],
    }

    --------------------------------------------------------------------------------------
    -- LSP plugins -----------------------------------------------------------------------
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
        },
        config = [[require('plugin.lsp')]],
    }
    use { "folke/trouble.nvim", -- troube - shows lsp erros in window
        requires = "kyazdani42/nvim-web-devicons",
        config = [[require('plugin.lsp.trouble')]]
    }
    -------------------------------------------------------------------------------------
    ---- Git plugins  -------------------------------------------------------------------
    use { "lewis6991/gitsigns.nvim" } --, config = [[require('plugin.git.gitsigns')]] } -- shows diff signs in gutter
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' } -- side by side diff

    -------------------------------------------------------------------------------------
    ---- Note Plugins -------------------------------------------------------------------
    use { "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config   = [[require('plugin.todo-comments')]]
    }
    -- use { "vimwiki/vimwiki" } -- vimwiki

    use { 'numToStr/Comment.nvim',
    config = [[require('plugin.Comment')]]
    }
    use {'nvim-orgmode/orgmode', config =[[require('plugin.orgmode')]]}
    use {'renerocksai/telekasten.nvim',
      requires = {
          {'nvim-telescope/telescope.nvim'},
          --{'mattn/calendar-vim'}
          {'renerocksai/calendar-vim'}
        },
      config = [[require('plugin.telekasten')]]
    }
    -------------------------------------------------------------------------------------
    ---- GUI Plugins --------------------------------------------------------------------
    use { "nvim-lualine/lualine.nvim", config = [[require('plugin.lualine')]] } -- statusline
    --use{"lukas-reineke/indent-blankline.nvim"}                                          -- indentation
    use { 'akinsho/bufferline.nvim',
        tag      = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config   = [[require('plugin.bufferline')]]
    }
    --use{"christoomey/vim-tmux-navigator"}                                                 -- tmux & split window navigation
    use { "szw/vim-maximizer" } -- maximizes and restores current window
    use { "tpope/vim-surround" } -- add, delete, change surroundings (it's awesome)
    --use{"inkarkat/vim-ReplaceWithRegister"}                                               -- replace with register contents using motion (gr + motion)
    use { "ludovicchabant/vim-gutentags" }
    use { "preservim/tagbar" } --
    -- use { "liuchengxu/vista.vim", config = [[require('plugin.vista')]] }
    use { 'VonHeikemen/fine-cmdline.nvim', -- popup comand line
        requires = { { 'MunifTanjim/nui.nvim' } },
        config   = [[require('plugin.fine-cmdline')]]
    }
    use { "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    ------------------------------------------------------------------------------------------
    -- EDGY
    use {"folke/edgy.nvim",
        config = [[require('plugin.edgy')]]
    }

    ------------------------------------------------------------------------------------------
    --Neo-tree
    use {  "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        config = [[require('plugin.neo-tree')]]
        }
    }

    ------------------------------------------------------------------------------------------
    ---- Editor Plugins ----------------------------------------------------------------------
    use { 'mbbill/undotree' } -- undo tree
    -- use { 'gelguy/wilder.nvim' } -- better cmd line autofill

    ------------------------------------------------------------------------------------------
    ---- Dashboard plugins -------------------------------------------------------------------
    use { 'goolord/alpha-nvim', config = [[require('plugin.dashboard')]] } -- Alpha dashboard configuration
    use { 'sidebar-nvim/sidebar.nvim', config = [[require('plugin.sidebar')]] }

    ------------------------------------------------------------------------------------------
    ---- Session & project plugins -----------------------------------------------------------
    ------------------------------------------------------------------------------------------
    ---- colour schemes ----------------------------------------------------------------------
    use { "catppuccin/nvim" }
    use { "folke/tokyonight.nvim" }
    use { "bluz71/vim-nightfly-guicolors" }
    use { "ellisonleao/gruvbox.nvim" }
    use { "savq/melange-nvim" }
    use { "luisiacc/gruvbox-baby" }
    use { "AlexvZyl/nordic.nvim" }
    use { "rebelot/kanagawa.nvim"}
    use {"jacoborus/tender.vim"}
    use {'nyoom-engineering/oxocarbon.nvim'}
    --------------------------------------------------------------------------------
    -- Leave as last ---------------------------------------------------------------
    if packer_bootstrap then
        require("packer").sync()
    end
end)
