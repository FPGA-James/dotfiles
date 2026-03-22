-- =============================================================================
-- lua/plugins/snacks/dashboard.lua
-- Startup dashboard — github template (2-pane layout).
-- Requires: gh CLI  (brew install gh)
--           colorscript (optional, brew install terminal-colorscript or similar)
-- =============================================================================
return {
  enabled = true,
  width   = 110,
  row     = nil,
  col     = nil,
  pane_gap = 4,
  autokeys = "1234567890abcdefghijklmnopqrstuvwxyz",

  preset = {
    keys = {
      { icon = " ", key = "f", desc = "Find File",    action = ":lua Snacks.picker.files()" },
      { icon = " ", key = "n", desc = "New File",     action = ":ene | startinsert" },
      { icon = " ", key = "g", desc = "Find Text",    action = ":lua Snacks.picker.grep()" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
      { icon = " ", key = "c", desc = "Config",       action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
      { icon = " ", key = "q", desc = "Quit",         action = ":qa" },
    },
    header = [[
███████╗██████╗  ██████╗  █████╗        ██╗ █████╗ ███╗   ███╗███████╗███████╗
██╔════╝██╔══██╗██╔════╝ ██╔══██╗      ██║██╔══██╗████╗ ████║██╔════╝██╔════╝
█████╗  ██████╔╝██║  ███╗███████║       ██║███████║██╔████╔██║█████╗  ███████╗
██╔══╝  ██╔═══╝ ██║   ██║██╔══██║   ██   ██║██╔══██║██║╚██╔╝██║██╔══╝  ╚════██║
██║     ██║     ╚██████╔╝██║  ██║   ╚█████╔╝██║  ██║██║ ╚═╝ ██║███████╗███████║
╚═╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝    ╚════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝]],
  },

  sections = {
    -- ── Pane 1: header + keys ───────────────────────────────────────────────
    { section = "header" },
    {
      pane    = 2,
      section = "terminal",
      cmd     = "cat /etc/motd 2>/dev/null || echo ''",
      height  = 5,
      padding = 1,
    },
    { section = "keys", gap = 1, padding = 1 },
    {
      pane    = 2,
      icon    = " ",
      desc    = "Browse Repo",
      padding = 1,
      key     = "b",
      action  = function() Snacks.gitbrowse() end,
    },

    -- ── Pane 2: github live sections ────────────────────────────────────────
    function()
      local in_git = Snacks.git.get_root() ~= nil
      local cmds = {
        {
          icon   = " ",
          title  = "Git Status",
          cmd    = "git --no-pager diff --stat -B -M -C",
          height = 10,
        },
        {
          title   = "Notifications",
          cmd     = "gh api notifications --jq '.[:5] | .[] | \"[\\(.reason)] \\(.subject.title) (\\(.repository.full_name))\"\' 2>/dev/null || echo 'No notifications'",
          action  = function() vim.ui.open("https://github.com/notifications") end,
          key     = "N",
          icon    = " ",
          height  = 5,
          enabled = true,
        },
        {
          title  = "Open Issues",
          cmd    = "gh issue list -L 3",
          key    = "i",
          action = function() vim.fn.jobstart("gh issue list --web", { detach = true }) end,
          icon   = " ",
          height = 7,
        },
        {
          icon   = " ",
          title  = "Open PRs",
          cmd    = "gh pr list -L 3",
          key    = "P",
          action = function() vim.fn.jobstart("gh pr list --web", { detach = true }) end,
          height = 7,
        },
      }
      return vim.tbl_map(function(cmd)
        return vim.tbl_extend("force", {
          pane    = 2,
          section = "terminal",
          enabled = in_git,
          padding = 1,
          ttl     = 5 * 60,
          indent  = 3,
        }, cmd)
      end, cmds)
    end,

  },
}
