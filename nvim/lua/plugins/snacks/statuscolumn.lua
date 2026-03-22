-- =============================================================================
-- lua/plugins/snacks/statuscolumn.lua
-- Custom status column combining line numbers, signs, folds, and git markers.
-- Replaces the default sign column + number column with one unified gutter.
-- =============================================================================
return {
  enabled = true,
  left    = { "mark", "sign" },   -- left gutter: marks then signs
  right   = { "fold", "git" },    -- right gutter: fold indicator then git
  folds = {
    open   = false,   -- show indicator on open folds
    git_hl = false,   -- colour fold column by git status
  },
  git = {
    -- Highlight group name patterns to treat as git signs.
    patterns = { "GitSign", "MiniDiffSign" },
  },
  refresh = 50,   -- ms debounce before re-rendering the column
}
