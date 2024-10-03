return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
      week_header = {
        enable = false,
      },
      header = {
         "         +++++        ++++      ",
         "       +++++++       ++++++     ",
         "    +++++   ++++     ++  ++++   ",
         "    +++ ++    +++    ++    ++   ",
         "    ++ +  +    +++   ++    ++   ",
         "    ++  +  +    +++  ++    ++   ",
         "    ++   ++++    +++  +    ++   ",
         "    ++    +++++    ++ ++   ++   ",
         "    ++    ++ +++    ++ +   ++   ",
         "    ++    ++  +++    +  ++ ++   ",
         "    ++    ++   +++    ++ + ++   ",
         "    +++   ++    ++++   ++  ++   ",
         "    +++++ ++      +++    ++++   ",
         "     ++++++         +++ ++++    ",         
         "",           
         "By: FPGA-James",
         "",
       },
       	shortcut = {
		{ 
			desc = '󰊳 Update', 
			group = '@property', 
			action = 'Lazy update', 
			key = 'u' 
		},
        	{
           		icon = ' ',
           		icon_hl = '@variable',
           		desc = 'Files',
           		group = 'Label',
           		action = 'Telescope find_files',
           		key = 'f',
         	},
         	{
           		desc = ' Lazy',
           		group = 'DiagnosticHint',
           		action = 'Lazy',
           		key = 'l',
         	},
         	{
           		desc = ' dotfiles',
           		group = 'Number',
           		action = 'Telescope dotfiles',
           		key = 'd',
         	},
	      	{
		      desc	= 'Exit',
		      action	= 'q',
		      key	= 'q',
	      	},
       },
       packages = { enable = true }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a functino type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
       project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
       mru = { limit = 4, icon = 'your icon', label = '', cwd_only = false },
       footer = {"By: FPGA_James"}, -- footer
       hide = {
        statusline  = true,   -- hide statusline default is true
        tabline     = false,      -- hide the tabline
        winbar      = false,        -- hide winbar
      },
      preview = {
        --command       -- preview command
        --file_path     -- preview file path
        --file_height   -- preview file height
        --file_width    -- preview file width
      },
     },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
