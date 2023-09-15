return {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            {"LinArcX/telescope-env.nvim"},
            { 'nvim-telescope/telescope-file-browser.nvim' },
            { 'nvim-telescope/telescope-project.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { "benfowler/telescope-luasnip.nvim" },
            { "fcying/telescope-ctags-outline.nvim"},
            {"nvim-telescope/telescope-symbols.nvim"},
        },
        keys = {
            { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            {"<leader>te", "<cmd> Telescope file_browser <cr>", desc = "File Explorer"},
            {"<leader>tp", "<cmd> Telescope project <cr>", desc = "Project switcher"},
            {"<leader>ts", "<cmd> Telescope symbols <cr>", desc = " symbol insert"},
        },
        opts = {
            extensions = {
               file_browser = {
                    -- theme = "ivy",
              -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    hidden = true,
                    mappings = {
                     -- snh   ["i"] = {
                     -- snh   -- your custom insert mode mappings
                     -- snh       ["<C-a>"] = fb_actions.create,
                     -- snh       ["<C-r>"] = fb_actions.rename,
                     -- snh       ["<C-d>"] = fb_actions.remove
                     -- snh   },
                     -- snh   ["n"] = {
                     -- snh   -- your custom normal mode mappings
                     -- snh   },
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
                },
            },
        },
        config = function(_, opts)
            require("telescope").load_extension("env")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension ("luasnip")
            require("telescope").load_extension('project')
            --require("telescope").load_extension('symbols')
            require("telescope").setup(opts)
            end,
}