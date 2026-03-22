-- =============================================================================
-- lua/plugins/snacks/image.lua
-- Inline image rendering using the Kitty Graphics Protocol.
-- Supported terminals: Kitty, WezTerm, Ghostty, iTerm2 (with imgcat).
-- Images appear in picker previews, hover docs, and the dashboard.
--
-- NOTE: disabled by default — enable if your terminal supports the protocol.
-- =============================================================================
return {
  enabled = false,  -- ← set true if you're on Kitty/WezTerm/Ghostty

  -- Backend to use for rendering.
  -- "kitty"  = Kitty Graphics Protocol (kitty, wezterm, ghostty)
  -- "ueberzug" = ueberzugpp (X11/Wayland, requires ueberzugpp installed)
  backend = "kitty",

  -- Maximum image dimensions (pixels).  nil = no limit.
  max_width  = nil,
  max_height = nil,

  -- Maximum image dimensions as a fraction of the window size.
  max_width_window_percentage  = nil,
  max_height_window_percentage = 50,

  -- Image file extensions snacks will attempt to render.
  formats = {
    "png", "jpg", "jpeg", "gif", "webp", "bmp", "ico",
    "tiff", "svg",
  },

  -- Force clear images when the cursor leaves the window.
  force_clear_on_leave = false,
}
