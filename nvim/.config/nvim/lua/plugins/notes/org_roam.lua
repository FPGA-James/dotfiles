return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.0",
  enabled = false,
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.4",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/notes/org",
      -- optional
      org_files = {
        "~/notes/org/**/*",
      }
    })
  end
}
