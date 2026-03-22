-- =============================================================================
-- lua/plugins/snacks/gitbrowse.lua
-- Opens the current file/selection/branch/commit in a browser.
-- Auto-detects GitHub, GitLab, Gitea, Bitbucket from the remote URL.
-- =============================================================================

-- ── Keymaps ───────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v" }, "<leader>gb", function() Snacks.gitbrowse() end,
  { desc = "Git browse (open in browser)" })

return {
  enabled = true,

  -- Notify before opening the browser.
  notify  = true,

  -- Which thing to open when called without a visual selection.
  -- "file"   = current file at current line
  -- "branch" = current branch page
  -- "repo"   = repository root
  -- "commit" = current HEAD commit
  what    = "file",

  -- Branch name to open when what = "branch".
  -- nil = use current branch.
  branch  = nil,

  -- Additional URL patterns for self-hosted forges.
  -- Each entry maps a remote URL pattern to a URL template.
  -- Tokens: {repo} {branch} {file} {line_start} {line_end}
  remote_patterns = {
    -- GitHub (default built-in, shown here for reference)
    -- { "^https://github.com/(.+)%.git$", "https://github.com/%1" },
  },

  -- Url patterns for line ranges
  -- Change to nil to open without line anchors.
  line_start = nil,
  line_end   = nil,
}
