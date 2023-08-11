local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')
--local
--local banner = require("james.plugins.alpha.banners")

-- Footer
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' - ' .. datetime
end

-- Banner
local basic_banner = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

local fpga_banner ={
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
}

local basic_footer = {
    "Brought top you by FPGA-James ",
    ""
}
--local

dashboard.section.header.val = fpga_banner

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('e', '  New file',          ':ene <BAR> startinsert<CR>'    ),
  dashboard.button('f', '  Find file',         ':Telescope fd cwd=<CR>'     ),
  dashboard.button('p', '  Projects',          "<cmd> lua require'telescope'.extensions.project.project{ } <CR>"),
  dashboard.button('g', '  Git Status',        ':Telescope git_status<CR>'          ),
  dashboard.button('s', '  Settings',          ':e $MYVIMRC<CR>'               ),
  dashboard.button('u', '  Update plugins',    ':PackerUpdate<CR>'             ),
  dashboard.button('q', '  Quit',              ':qa<CR>'                       ),
}

dashboard.section.footer.val = basic_footer

alpha.setup(dashboard.config)
