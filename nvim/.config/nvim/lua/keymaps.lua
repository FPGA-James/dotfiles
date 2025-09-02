-- Keymaps for Neovim + Snacks.nvim + Which-Key 3.0+
-- Snacks.nvim keymaps take priority over older mappings.

local wk = require("which-key")

wk.add({
  -- General Neovim defaults
  { "<leader>w", "<cmd>w<CR>", desc = "Save File" },
  { "<leader>q", "<cmd>q<CR>", desc = "Quit Window" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Clear Search Highlight" },
  { "<leader>e", "<cmd>Ex<CR>", desc = "Open Explorer (netrw)" },
  

  -- Snacks group
  { "<leader>l",  group = "LSP" },
    { "<leader>li", "<cmd>LspInfo <CR>", desc = "LSP Server Information" },
    { "<leader>li", "<cmd>LspRestart <CR>", desc = "LSP Restart server" },
    { "<leader>li", "<cmd>LspInfo <CR>", desc = "LSP Information" },


  -- Snacks group
  { "<leader>b",  group = "buffers" },
    { "<leader>bo", "<cmd>only<CR>", desc = "Close other splits" },
    { "<leader>bn", "<cmd>bnext<CR>", desc = "Next Buffer" },
    { "<leader>bp", "<cmd>bprev<CR>", desc = "Previous Buffer" },
    { "<leader>bd", "<cmd>bdelete<CR>", desc = "Close Buffer" },
    { "<leader>bl", function() Snacks.picker.buffers() end, desc = "Buffer list" },
 
  -- trouble diagnostics groups
  { "<leader>x",  group = "Diagnostics" },
    { "<leader>xd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>xD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },

    -- find groups
  { "<leader>f",  group = "find" },
  -- find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fl", function() Snacks.picker.grep() end, desc = "Recent" },

  -- Snacks group
  { "<leader>g",  group = "Git/goto" },
    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
  
  -- help
  { "<leader>h",  group = "Help" },
    { "<leader>ht", "<cmd>lua require('snacks').picker.help_tags()<CR>", desc = "Help Tags" },
    { "<leader>hk", "<cmd>lua require('snacks').picker.keymaps()<CR>", desc = "Search Keymaps" },
    { "<leader>ha", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>hh",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
  

  -- Windows
  { "<leader>w",  group = "Window" },
    { "<leader>wv", "<cmd>vsplit<CR>", desc = "Vertical Split" },
    { "<leader>wx", "<cmd>split<CR>", desc = "Horizontal Split" },
    { "<leader>wn", "<cmd>lua require('snacks').notifier()<CR>",  desc = "Show Notifications" },

  -- Snacks Git tools (priority over gitsigns.vim mappings)
  { "<leader>sg", "<cmd>lua require('snacks').git.status()<CR>", desc = "Git Status" },
  { "<leader>sc", "<cmd>lua require('snacks').git.commits()<CR>", desc = "Git Commits" },
  { "<leader>gb", "<cmd>lua require('snacks').git.blame_line()<CR>", desc = "Blame Line" },
  { "<leader>gd", "<cmd>lua require('snacks').git.diff_this()<CR>", desc = "Diff This File" },
  { "<leader>gD", "<cmd>lua require('snacks').git.diff_project()<CR>", desc = "Diff Project" },
  { "<leader>gl", "<cmd>lua require('snacks').git.log()<CR>", desc = "Git Log Picker" },

  -- LSP integration via Snacks
  --{ "gd", "<cmd>lua require('snacks').lsp.definition()<CR>", desc = "LSP Definition" },
  --{ "gr", "<cmd>lua require('snacks').lsp.references()<CR>", desc = "LSP References" },
  --{ "gi", "<cmd>lua require('snacks').lsp.implementation()<CR>", desc = "LSP Implementation" },
  --{ "K",  "<cmd>lua require('snacks').lsp.hover()<CR>", desc = "Hover Documentation" },
  --{ "<leader>rn", "<cmd>lua require('snacks').lsp.rename()<CR>", desc = "Rename Symbol" },
  --{ "<leader>ca", "<cmd>lua require('snacks').lsp.code_action()<CR>", desc = "Code Action" },
  --{ "<leader>fd", "<cmd>lua require('snacks').lsp.format()<CR>", desc = "Format Document" },

  -- Keep important system mappings not covered by Snacks
  { "<leader>tt", "<cmd>terminal<CR>", desc = "Open Terminal (basic)" },

    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
    { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    -- Other
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
    { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },


})

