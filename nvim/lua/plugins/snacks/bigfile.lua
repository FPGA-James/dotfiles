-- =============================================================================
-- lua/plugins/snacks/bigfile.lua
-- Automatically disables expensive features for large files to prevent lag.
-- Triggers on BufReadPre when file size exceeds the threshold.
-- =============================================================================
return {
  enabled = true,

  -- File size threshold in bytes.
  -- Files larger than this will trigger the big-file behaviour.
  -- Default: 1.5 MB
  size = 1.5 * 1024 * 1024,

  -- Notification level when a big file is detected.
  -- vim.log.levels: TRACE=0 DEBUG=1 INFO=2 WARN=3 ERROR=4 OFF=5
  notify = vim.log.levels.WARN,

  -- Features to disable when a big file is detected.
  -- Each entry is the name of a snacks feature or a custom function.
  -- Built-in feature names: "animate","indent","lsp","treesitter","illuminate",
  --                         "matchparen","vimopts","syntax"
  -- To add your own, pass a function(ctx) where ctx = { buf, ft }
  setup = function(_ctx)
    -- vim.b[ctx.buf].minianimate_disable = true -- if using mini.animate
  end,
}
