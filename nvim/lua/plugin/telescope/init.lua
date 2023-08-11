local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
local fb_actions = require "telescope".extensions.file_browser.actions -- mappings in file_browser extension of telescope.setupv
-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        -- prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        --hidden = true,
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        file_sorter = require 'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
    },
    pickers = {
        find_files = {
            -- I don't like having the cwd prefix in my files
            find_command = { "fdfind", "--strip-cwd-prefix", "--type", "f" },
            hidden = true,  
            mappings = {
                n = {
                    ["kj"] = "close",
                },
            },
        },
        colorscheme = {
            enable_preview = true
        }
    },
    extensions = {
        file_browser = {
            -- theme = "ivy",
             -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            hidden = true,
            mappings = {
                ["i"] = {
                -- your custom insert mode mappings
                    ["<C-a>"] = fb_actions.create,
                    ["<C-r>"] = fb_actions.rename,
                    ["<C-d>"] = fb_actions.remove
                },
                ["n"] = {
                -- your custom normal mode mappings
                },
            },
        },
        project = {
            base_dirs = {
                {path = '/workarea/apaweuc1svm02/james.fleeting/'} ,
                --{path = '~/dev/src5', max_depth = 2},
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true, -- default false
        },
        --["ui-select"] = {
        --    require("telescope.themes").get_dropdown {
        --       -- even more opts
        --    },
      ctags_outline = {
            --ctags option
            ctags = {'ctags'},
            --ctags filetype option
            ft_opt = {
                vim = '--vim-kinds=fk',
                lua = '--lua-kinds=fk',
            },    --},
        }
        }
}
-- load extensions TODOLocationList
--_ = require("telescope").load_extension("session-lens")
-- load extensions TODO
_ = telescope.load_extension "vimwiki"
--_ = telescope.load_extension "dap"
-- _ = telescope.load_extension "notify"
_ = telescope.load_extension "env"
_ = telescope.load_extension "file_browser"
_ = telescope.load_extension "ui-select"
--_ = telescope.load_extension "fzf"
_ = telescope.load_extension "git_worktree"
--_ = telescope.load_extension "neoclip"
_ = telescope.load_extension "luasnip"
_ = telescope.load_extension('project')
_ = telescope.load_extension('media_files')

