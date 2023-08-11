require("edgy").setup({
  --left = {}, ---@type (Edgy.View.Opts|string)[]
  --bottom = {}, ---@type (Edgy.View.Opts|string)[]
  --right = {}, ---@type (Edgy.View.Opts|string)[]
  --top = {}, ---@type (Edgy.View.Opts|string)[]
bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
    --  {
   --     ft = "toggleterm",
   --     size = { height = 0.4 },
   --     -- exclude floating windows
   ---     filter = function(buf, win)
   --       return vim.api.nvim_win_get_config(win).relative == ""
   --     end,
   --   },
     -- {
     --   ft = "lazyterm",
     --   title = "LazyTerm",
     --   size = { height = 0.4 },
     --   filter = function(buf)
     --     return not vim.b[buf].lazyterm_cmd
     --   end,
     -- },
     --{
    --  "Trouble",
      { ft = "qf", title = "QuickFix",
        size = { height = 0.4 },
        pinned = true,
        open = "TroubleToggle",
        },
   --   {
   --     ft = "help",
   --     size = { height = 20 },
  --     -- pinned = true,
  --      -- only show help buffers
  --      filter = function(buf)
  --        return vim.bo[buf].buftype == "help"
  --      end,
     -- },
     -- { ft = "spectre_panel", size = { height = 0.4 } },
    },

    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        pinned = true,
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.5 },
        open = "Neotree position=top filesystem",
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = true,
        open = "Neotree position=right git_status",
      },
      {
        title = "Neo-Tree Buffers",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "buffers"
        end,
        pinned = true,
        open = "Neotree position=bottom buffers",
      },
      -- any other neo-tree windows
      "neo-tree",
    },

right = {
    {
       -- title = "Outline",
        ft = "Outline",
        pinned = true,
        open = "TagbarToggle",
    },
    },



  ---@type table<Edgy.Pos, {size:integer, wo?:vim.wo}>
  options = {
    left = { size = 40 },
    bottom = { size = 10 },
    right = { size = 10 },
    top = { size = 10 },
  },
  -- edgebar animations
  animate = {
    enabled = true,
    fps = 100, -- frames per second
    cps = 120, -- cells per second
    on_begin = function()
      vim.g.minianimate_disable = true
    end,
    on_end = function()
      vim.g.minianimate_disable = false
    end,
    -- Spinner for pinned views that are loading.
    -- if you have noice.nvim installed, you can use any spinner from it, like:
    -- spinner = require("noice.util.spinners").spinners.circleFull,
    spinner = {
      frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      interval = 80,
    },
  },
  -- enable this to exit Neovim when only edgy windows are left
  exit_when_last = false,
  -- close edgy when all windows are hidden instead of opening one of them
  -- disable to always keep at least one edgy split visible in each open section
  close_when_all_hidden = true,
  -- global window options for edgebar windows
  ---@type vim.wo
  wo = {
    -- Setting to `true`, will add an edgy winbar.
    -- Setting to `false`, won't set any winbar.
    -- Setting to a string, will set the winbar to that string.
    winbar = true,
    winfixwidth = true,
    winfixheight = false,
    winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
    spell = false,
    signcolumn = "no",
  },
  -- buffer-local keymaps to be added to edgebar buffers.
  -- Existing buffer-local keymaps will never be overridden.
  -- Set to false to disable a builtin.
  ---@type table<string, fun(win:Edgy.Window)|false>
  keys = {
    -- close window
    ["q"] = function(win)
      win:close()
    end,
    -- hide window
    ["<c-q>"] = function(win)
      win:hide()
    end,
    -- close sidebar
    ["Q"] = function(win)
      win.view.edgebar:close()
    end,
    -- next open window
    ["]w"] = function(win)
      win:next({ visible = true, focus = true })
    end,
    -- previous open window
    ["[w"] = function(win)
      win:prev({ visible = true, focus = true })
    end,
    -- next loaded window
    ["]W"] = function(win)
      win:next({ pinned = false, focus = true })
    end,
    -- prev loaded window
    ["[W"] = function(win)
      win:prev({ pinned = false, focus = true })
    end,
    -- increase width
    ["<c-w>>"] = function(win)
      win:resize("width", 2)
    end,
    -- decrease width
    ["<c-w><lt>"] = function(win)
      win:resize("width", -2)
    end,
    -- increase height
    ["<c-w>+"] = function(win)
      win:resize("height", 2)
    end,
    -- decrease height
    ["<c-w>-"] = function(win)
      win:resize("height", -2)
    end,
    -- reset all custom sizing
    ["<c-w>="] = function(win)
      win.view.edgebar:equalize()
    end,
  },
  icons = {
    closed = " ",
    open = " ",
  },
  -- enable this on Neovim <= 0.10.0 to properly fold edgebar windows.
  -- Not needed on a nightly build >= June 5, 2023.
  fix_win_height = vim.fn.has("nvim-0.10.0") == 0,
})
