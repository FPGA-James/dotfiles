return {
  "nvim-neorg/neorg",
  --enabled = true,
  build = ":Neorg sync-parsers",
  priority = 30,
  ft = "norg",
  cmd = "Neorg",
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
  keys = {
    { "<leader>own", "<cmd> Neorg workspace notes <cr>", desc = "load notes workspace" },
    { "<leader>oim", "<cmd> Neorg inject_metadata <cr>", desc = "insert metadata" },
    { "<leader>oif", "<cmd> Telescope neorg insert_file_link <cr>", desc = "insert_file_link" },
    { "<leader>ofl", "<cmd> Telescope neorg find_linkable <cr>", desc = "find_linkable" },
    { "<leader>off", "<cmd> Telescope neorg find_norg_files <cr>", desc = "find_norg_files" },
    { "<leader>oil", "<cmd> Telescope neorg insert_link <cr>", desc = "insert_link" },
  },
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.keybinds"] = {
        config = {
          default_keybinds = true,
          neorg_leader = "<Leader>o",
        },
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
        },
      },
      ["core.integrations.telescope"] = {},
      ["core.tempus"] = {},
      ["core.ui.calendar"] = {},
    },
  },
}
