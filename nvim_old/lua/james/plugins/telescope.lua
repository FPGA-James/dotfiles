return {
    {
      "nvim-telescope/telescope.nvim",
      priority = 100,
      config = function()
        require "plugins.telescope.setup"
        --require "james.telescope.keys"
      end,
    },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-hop.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
      "ThePrimeagen/git-worktree.nvim",
      config = function()
        require("git-worktree").setup {}
      end,
    },
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    },
  }

-- local telescope = require("telescope")
-- local telescopeConfig = require("telescope.config")
-- 
-- -- Clone the default Telescope configuration
-- local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
-- local fb_actions = require "telescope".extensions.file_browser.actions -- mappings in file_browser extension of telescope.setupv
-- -- load extensions TODO
-- --telescope.load_extension "vimwiki"
-- --telescope.load_extension "dap"
-- --telescope.load_extension "notify"
-- --telescope.load_extension "file_browser"
-- --telescope.load_extension "ui-select"
-- --telescope.load_extension "fzf"
-- --telescope.load_extension "git_worktree"
-- --telescope.load_extension "neoclip"
-- 
-- -- I want to search in hidden/dot files.
-- table.insert(vimgrep_arguments, "--hidden")
-- -- I don't want to search in the `.git` directory.
-- table.insert(vimgrep_arguments, "--glob")
-- table.insert(vimgrep_arguments, "!**/.git/*")
-- 
-- telescope.setup{
--     defaults = {
--         vimgrep_arguments = {
--             'rg',
--             '--color=never',
--             '--no-heading',
--             '--with-filename',
--             '--line-number',
--             '--column',
--             '--smart-case'
--         },
--         prompt_prefix = "> ",
--         selection_caret = "> ",
--         entry_prefix = "  ",
--         initial_mode = "insert",
--         selection_strategy = "reset",
--         sorting_strategy = "descending",
--         layout_strategy = "horizontal",
--         layout_config = {
--             horizontal = {
--                 mirror = false,
--             },
--             vertical = {
--                 mirror = false,
--             },
--         },
--         file_sorter =  require'telescope.sorters'.get_fuzzy_file,
--         file_ignore_patterns = {},
--         generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
--         winblend = 0,
--         border = {},
--         borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
--         color_devicons = true,
--         use_less = true,
--         path_display = {"smart"},
--         set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
--         file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
--         grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
--         qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
--         -- Developer configurations: Not meant for general override
--         buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
--     },
--     pickers = {
--     -- Default configuration for builtin pickers goes here:
--     -- picker_name = {
--     --   picker_config_key = value,
--     --   ...
--     -- }
--     -- Now the picker_config_key will be applied every time you call this
--     -- builtin picker
--         colorscheme = {
--             enable_preview = true
--         }
--     },
-- 
--     extensions = {
--         file_browser = {
--            -- theme = "ivy",
--             -- disables netrw and use telescope-file-browser in its place
--             hijack_netrw = true,
--             mappings = {
--                 ["i"] = {
--                 -- your custom insert mode mappings
--                     ["<C-a>"] = fb_actions.create,
--                     ["<C-r>"] = fb_actions.rename,
--                     ["<C-d>"] = fb_actions.remove
--                 },
--                 ["n"] = {
--                 -- your custom normal mode mappings
--                 },
--             },
--         },
--         project = {
--             base_dirs = {
--                 '~/dev/src',
--                 {'~/dev/src2'},
--                 {'~/dev/src3', max_depth = 4},
--                 {path = '~/dev/src4'},
--                 {path = '~/dev/src5', max_depth = 2},
--             },
--             hidden_files = true, -- default: false
--             theme = "dropdown",
--             order_by = "asc",
--             search_by = "title",
--             sync_with_nvim_tree = true, -- default false
--         },
--     },
-- }
-- 
-- -- load extensions TODO
-- --_ = telescope.load_extension "vimwiki"
-- --_ = telescope.load_extension "dap"
-- --_ = telescope.load_extension "notify"
-- telescope.load_extension "file_browser"
-- --_ = telescope.load_extension "ui-select"
-- --_ = telescope.load_extension "fzf"
-- --_ = telescope.load_extension "git_worktree"
-- --_ = telescope.load_extension "neoclip"
-- require('telescope').load_extension('luasnip')
-- telescope.load_extension "project"
-- 
-- 