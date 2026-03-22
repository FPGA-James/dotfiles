-- =============================================================================
-- lua/plugins/snacks/notifier.lua
-- Replaces vim.notify() with styled toast notifications.
-- Supports levels, timeouts, progress updates, and a browsable history.
-- =============================================================================
return {
  enabled = true,

  -- Time (ms) before a notification auto-dismisses.
  -- Individual notify() calls can override this.
  timeout    = 3000,

  -- Maximum number of notifications shown on screen at once.
  width      = { min = 40, max = 0.4 },  -- 0.4 = 40% of screen width
  height     = { min = 1,  max = 0.6 },

  -- Margin from the screen edge (lines / columns).
  margin     = { top = 0, right = 1, bottom = 0 },

  -- Screen corner where notifications stack.
  -- "top_left" | "top_right" | "bottom_left" | "bottom_right"
  --  | "top" | "bottom"
  position   = "bottom_right",

  -- Icons per log level.  Requires a Nerd Font.
  icons = {
    error   = " ",
    warn    = " ",
    info    = " ",
    debug   = " ",
    trace   = " ",
  },

  -- Keep this many notifications in history (browsable via picker).
  history_limit = 100,

  -- Sort notifications by level (highest first) or by arrival order.
  -- "time" | "level"
  sort  = { "level", "added" },

  -- Style of the notification window border.
  -- "none" | "single" | "double" | "rounded" | "solid" | "shadow"
  style      = "compact",

  -- Minimum log level to show.
  -- vim.log.levels: TRACE=0 DEBUG=1 INFO=2 WARN=3 ERROR=4
  level = vim.log.levels.TRACE,

  -- Date format for notification timestamps.
  date_format = "%R",

  -- Refresh interval when a notification has progress (ms).
  refresh = 50,
}
