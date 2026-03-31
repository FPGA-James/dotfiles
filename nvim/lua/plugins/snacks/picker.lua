-- =============================================================================
-- lua/plugins/snacks/picker.lua
-- Fuzzy picker — Telescope replacement with built-in sources.
-- Sources: files, grep, buffers, LSP, git, keymaps, commands, and more.
-- =============================================================================

-- ── Keymaps ───────────────────────────────────────────────────────────────────
local map = vim.keymap.set

-- Files
map("n", "<leader>ff", function() Snacks.picker.files() end,               { desc = "Find files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end,              { desc = "Recent files" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
                                                                             { desc = "Find config file" })
-- Search / grep
map("n", "<leader>fg", function() Snacks.picker.grep() end,                { desc = "Grep (live)" })
map("n", "<leader>fw", function() Snacks.picker.grep_word() end,           { desc = "Grep word under cursor" })
map({ "n", "v" }, "<leader>fs", function() Snacks.picker.grep() end,       { desc = "Grep selection" })
map("n", "<leader>fb", function() Snacks.picker.lines() end,               { desc = "Buffer lines" })
map("n", "<leader>fB", function() Snacks.picker.grep_buffers() end,        { desc = "Grep open buffers" })

-- Buffers & UI
map("n", "<leader><leader>", function() Snacks.picker.files() end,         { desc = "Find files" })
map("n", "<leader><space>", function() Snacks.picker.buffers() end,        { desc = "Buffers" })
map("n", "<leader>,",       function() Snacks.picker.buffers() end,        { desc = "Buffers" })
map("n", "<leader>:",       function() Snacks.picker.command_history() end,{ desc = "Command history" })
map("n", "<leader>fk",      function() Snacks.picker.keymaps() end,        { desc = "Keymaps" })
map("n", "<leader>fK",      function() Snacks.picker.commands() end,       { desc = "Commands" })
map("n", "<leader>fh",      function() Snacks.picker.help() end,           { desc = "Help pages" })
map("n", "<leader>fH",      function() Snacks.picker.highlights() end,     { desc = "Highlights" })
map("n", "<leader>fm",      function() Snacks.picker.marks() end,          { desc = "Marks" })
map("n", "<leader>fR",      function() Snacks.picker.registers() end,      { desc = "Registers" })
map("n", "<leader>fj",      function() Snacks.picker.jumps() end,          { desc = "Jump list" })
map("n", "<leader>fq",      function() Snacks.picker.qflist() end,         { desc = "Quickfix list" })
map("n", "<leader>fl",      function() Snacks.picker.loclist() end,        { desc = "Location list" })
map("n", "<leader>fu",      function() Snacks.picker.undo() end,           { desc = "Undo history" })

-- Git
map("n", "<leader>gc", function() Snacks.picker.git_log() end,             { desc = "Git log" })
map("n", "<leader>gf", function() Snacks.picker.git_status() end,          { desc = "Git status (files)" })
map("n", "<leader>gZ", function() Snacks.picker.git_stash() end,           { desc = "Git stash" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end,            { desc = "Git diff (hunks)" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end,        { desc = "Git log (line)" })

-- LSP
map("n", "gd",          function() Snacks.picker.lsp_definitions() end,     { desc = "Go to definition" })
map("n", "gD",          function() Snacks.picker.lsp_declarations() end,    { desc = "Go to declaration" })
map("n", "gr",          function() Snacks.picker.lsp_references() end,      { desc = "References" })
map("n", "gI",          function() Snacks.picker.lsp_implementations() end, { desc = "Implementations" })
map("n", "gt",          function() Snacks.picker.lsp_type_definitions() end,{ desc = "Type definition" })
map("n", "<leader>ls",  function() Snacks.picker.lsp_symbols() end,         { desc = "LSP symbols (buf)" })
map("n", "<leader>lS",  function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP symbols (workspace)" })
map("n", "<leader>ld",  function() Snacks.picker.diagnostics() end,         { desc = "Diagnostics" })

return {
  enabled = true,

  -- ── Prompt position ───────────────────────────────────────────────────────
  -- "top" | "bottom"
  prompt = ">",

  -- Layout preset.
  -- "default" | "telescope" | "vscode" | "ivy" | "sidebar" | "select"
  layout = {
    preset  = "ivy",
    -- cycle through results at top/bottom
    cycle   = true,
  },

  -- ── Preview ───────────────────────────────────────────────────────────────
  previewers = {
    file = {
      -- Max file size (bytes) to preview.
      max_size        = 1024 * 1024,  -- 1 MB
      -- Highlight syntax in previews.
      ft_hl           = true,
      -- Max lines of treesitter highlighting in preview.
      max_hl_lines    = 500,
      -- Filetype overrides for preview syntax.
      ft              = {},
    },
    -- Use git diff coloring in git pickers.
    git = { enabled = true },
    -- Render man pages in the preview.
    man = { enabled = true },
  },

  -- ── Matcher ────────────────────────────────────────────────────────────────
  matcher = {
    -- Algorithm: "fzf" (requires fzf binary) | "fzy" | "fuzzy"
    -- "fzf" gives the best performance on large repos.
    fuzzy      = true,
    smartcase  = true,
    ignorecase = true,

    -- Sort results by frecency (frequency + recency).
    frecency   = true,
    history_bonus = true,
  },

  -- ── UI misc ────────────────────────────────────────────────────────────────
  ui_select = true,  -- replace vim.ui.select() with the picker

  -- Icons
  icons = {
    files = {
      enabled = true,    -- show file type icons (requires nvim-web-devicons)
    },
    diagnostics = {
      Error = " ",
      Warn  = " ",
      Hint  = " ",
      Info  = " ",
    },
    git = {
      enabled = true,
      status  = {
        added    = "A ",
        deleted  = "D ",
        modified = "M ",
        renamed  = "R ",
        untracked = "? ",
      },
    },
  },

  -- ── Sources (per-source overrides) ────────────────────────────────────────
  sources = {
    files = {
      -- Use fd if available, fall back to find.
      -- cmd = "fd",
      hidden = false,  -- show hidden files
      follow = false,  -- follow symlinks
    },
    grep = {
      -- Use ripgrep (rg) by default.
      hidden    = false,
      follow    = false,
      -- Extra args passed to rg.
      args      = {},
    },
    buffers = {
      -- Show all buffers, including hidden ones.
      current = true,
    },
    explorer = {
      -- Pin the sidebar to the right edge.
      layout = { layout = { position = "right" } },
    },
  },
}
