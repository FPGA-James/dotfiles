-- =============================================================================
-- lua/plugins/snacks/scratch.lua
-- Per-filetype scratch buffers that persist to disk under stdpath("data").
-- =============================================================================

vim.keymap.set("n", "<leader>.", function() Snacks.scratch() end,        { desc = "Toggle scratch buffer" })
vim.keymap.set("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select scratch buffer" })

return {
  enabled   = true,
  name      = "Scratch",

  -- Default filetype: inherit from current buffer, fall back to markdown.
  ft = function()
    if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
      return vim.bo.filetype
    end
    return "markdown"
  end,

  icon      = nil,    -- nil = auto-detect from filetype
  root      = vim.fn.stdpath("data") .. "/scratch",
  autowrite = true,   -- save when the scratch window is hidden

  win       = { style = "scratch" },

  -- Per-filetype key overrides inside the scratch window.
  win_by_ft = {
    lua = {
      keys = {
        ["execute"] = {
          "<CR>",
          function(self)
            local buf = vim.api.nvim_win_get_buf(self.win)
            Snacks.debug.run({ buf = buf })
          end,
          desc = "Execute buffer",
          mode = { "n", "x" },
        },
      },
    },
  },
}
