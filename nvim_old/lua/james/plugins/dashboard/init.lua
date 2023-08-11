vim.g.dashboard_default_excecutive = 'telescope'
vim.g.dashboard_command_footer = {'James is the best::'}

--local dash = pcall(require, "dashboard")

require("dashboard").setup{
    theme = 'hyper',
    config = {
        header = {
        [[                                                                    ]],
        [[                            ░░╚══╗░╔═╔════╝                         ]],
        [[                            ╚═╦═╗╠═╩═╩╗╔═╦═╗                        ]],
        [[                            ░░║▒╠╣▒▒▒▒╠╣▒║▒║                        ]],
        [[                            ╔═╩═╝╠═╦═╦╝╚═╩═╝                        ]],
        [[                            ░░╔══╝░╚═╚════╗                         ]],
        [[ ______ ______  _____   ___              ___   _____  _____  _____  ]],
        [[ |  ___|| ___ \|  __ \ / _ \            / _ \ /  ___||_   _|/  __ \ ]],
        [[ | |_   | |_/ /| |  \// /_\ \  ______  / /_\ \\ `--.   | |  | /  \/ ]],
        [[ |  _|  |  __/ | | __ |  _  | |______| |  _  | `--. \  | |  | |     ]],
        [[ | |    | |    | |_\ \| | | |          | | | |/\__/ / _| |_ | \__/\ ]],
        [[ \_|    \_|     \____/\_| |_/          \_| |_/\____/  \___/  \____/ ]],
        [[                          _____ ______  _____                       ]],
        [[                         |_   _||  _  \|  ___|                      ]],
        [[                           | |  | | | || |__                        ]],
        [[                           | |  | | | ||  __|                       ]],
        [[                          _| |_ | |/ / | |___                       ]],
        [[                          \___/ |___/  \____/                       ]],
        [[]]                                                                                                                                                            
        },
        --week_header = {enable = true, },
        shortcut = {
            { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
                icon = ' ',
                icon_hl = '@variable',
                desc = ' Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f',
            },
            {
                desc = ' FPGA James',
                group = 'DiagnosticHint',
                action = ':OpenURL https://github.com/FPGA-James',
                key = 'G',
            },
            {
                desc = ' dotfiles',
                group = 'Number',
                action = ':e ~/.config/nvim/init.lua',
                key = 'd',
            },
        },
        project = { enable = true, limit = 8, icon = 'Projects', label = '', action = 'Telescope find_files cwd=' },        
        packages = { enable = true }, -- show how many plugins neovim loaded
        mru = { enable = true , limit = 10, icon = 'Most Recent', label = '', },
        project = {enable = true , limit = 3, icon = 'wiki', label = '', action = 'Telescope find files cwd =', },


        footer = {
            [[ ]]    ,
            [[ Brought to you by FPGA James.... Have fun]],
            [[ ]]
            }, -- footer
    },
}
