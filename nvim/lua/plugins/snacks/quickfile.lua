-- =============================================================================
-- lua/plugins/snacks/quickfile.lua
-- Renders the first file argument before plugins finish loading.
-- Gives an immediate visual response when opening `nvim somefile.txt`.
-- No configuration needed — just enabling it is enough.
-- =============================================================================
return {
  enabled = true,

  -- Exclude these filetypes from fast rendering.
  -- (They require full plugin setup before they're safe to display.)
  exclude_ft = {
    "lazy",
    "mason",
  },
}
