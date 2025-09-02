return {
  dashboard = {
    enabled = true,
    header = {
      "   ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
      "   ████╗  ██║██║   ██║██║████╗ ████║",
      "   ██╔██╗ ██║██║   ██║██║██╔████╔██║",
      "   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
    },
    footer = { "Welcome to Neovim with Snacks.nvim!" },
    buttons = {
      { key = "f", label = "Find File", cmd = ":lua require('snacks').picker.find_files()<CR>" },
      { key = "r", label = "Recent Files", cmd = ":lua require('snacks').picker.oldfiles()<CR>" },
      { key = "g", label = "Git Status", cmd = ":lua require('snacks').git.status()<CR>" },
      { key = "q", label = "Quit", cmd = ":qa<CR>" },
    },
  },
}
