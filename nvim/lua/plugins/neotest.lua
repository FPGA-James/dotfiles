-- =============================================================================
-- lua/plugins/neotest.lua
-- neotest — test runner framework with pytest adapter
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/nvim-neotest/neotest       ~/.config/nvim/pack/local/opt/neotest
--   git clone --depth 1 https://github.com/nvim-neotest/neotest-python ~/.config/nvim/pack/local/opt/neotest-python
--   git clone --depth 1 https://github.com/nvim-neotest/nvim-nio       ~/.config/nvim/pack/local/opt/nvim-nio
-- =============================================================================

vim.cmd.packadd("plenary.nvim")
vim.cmd.packadd("nvim-nio")
vim.cmd.packadd("neotest")
vim.cmd.packadd("neotest-python")

local neotest = require("neotest")

neotest.setup({
  adapters = {
    require("neotest-python")({
      -- Use pytest as the test runner.
      runner = "pytest",
      -- Extra args passed to pytest on every run.
      args = { "--tb=short" },
      -- Auto-detect virtualenv (checks .venv, venv, $VIRTUAL_ENV, pyenv).
      python = function()
        local venv = vim.fn.finddir(".venv", vim.fn.getcwd() .. ";")
        if venv ~= "" then
          return venv .. "/bin/python"
        end
        return vim.fn.exepath("python3") or "python3"
      end,
    }),
  },

  -- Show test status icons in the sign column.
  status = { enabled = true, signs = true, virtual_text = false },

  -- Open test output automatically on failure.
  output = { enabled = true, open_on_run = "short" },

  -- Diagnostic markers for failures.
  diagnostic = { enabled = true },
})

-- ── Keymaps ───────────────────────────────────────────────────────────────────
local map = vim.keymap.set

map("n", "<leader>Tr", function() neotest.run.run() end,                    { desc = "Run nearest test" })
map("n", "<leader>Tf", function() neotest.run.run(vim.fn.expand("%")) end,  { desc = "Run test file" })
map("n", "<leader>Tl", function() neotest.run.run_last() end,               { desc = "Re-run last test" })
map("n", "<leader>Ts", function() neotest.summary.toggle() end,             { desc = "Test summary" })
map("n", "<leader>To", function() neotest.output_panel.toggle() end,        { desc = "Test output panel" })
map("n", "<leader>TS", function() neotest.run.stop() end,                   { desc = "Stop test" })
map("n", "]t",         function() neotest.jump.next({ status = "failed" }) end, { desc = "Next failed test" })
map("n", "[t",         function() neotest.jump.prev({ status = "failed" }) end, { desc = "Prev failed test" })
