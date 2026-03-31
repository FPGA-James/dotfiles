-- =============================================================================
-- lua/plugins/obsidian.lua
-- obsidian.nvim — Obsidian vault integration for Neovim
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/epwalsh/obsidian.nvim \
--     ~/.config/nvim/pack/local/opt/obsidian.nvim
--
-- Dependencies (already in pack/local/opt):
--   plenary.nvim
-- =============================================================================

vim.cmd.packadd("obsidian.nvim")

require("obsidian").setup({

  -- ── Workspaces ────────────────────────────────────────────────────────────
  -- Each entry is a vault. The first matching workspace is used.
  workspaces = {
    {
      name = "ai_vault",
      path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ai_vault",
    },
  },

  -- ── Picker ────────────────────────────────────────────────────────────────
  -- obsidian-nvim/obsidian.nvim (community fork) has native snacks support.
  -- Options: "snacks.nvim" | "telescope.nvim" | "fzf-lua" | "mini.pick"
  picker = {
    name = "snacks.nvim",

    -- Sort notes by last-modified time so recently-touched notes appear first.
    sort_by       = "modified",
    sort_reversed = true,

    -- Extra keys inside the note picker (e.g. ObsidianQuickSwitch).
    note_mappings = {
      -- Create a new note using the current query as its title.
      new         = "<C-n>",
      -- Insert a [[wikilink]] to the selected note at the cursor instead of opening it.
      insert_link = "<C-l>",
    },

    -- Extra keys inside the tag picker (e.g. ObsidianTags).
    tag_mappings = {
      -- Add the selected tag to the current note's frontmatter.
      tag_note   = "<C-x>",
      -- Insert #tag at the cursor position.
      insert_tag = "<C-l>",
    },
  },

  -- ── Completion ────────────────────────────────────────────────────────────
  -- Built-in completion (no nvim-cmp). Completes [[wikilinks]] and tags.
  completion = {
    nvim_cmp  = false,   -- not using nvim-cmp
    min_chars = 2,       -- min chars before suggesting
  },

  -- ── Note naming ───────────────────────────────────────────────────────────
  -- How new note filenames are generated.
  -- Default: uses note title slug. Override here if you prefer timestamps, etc.
  -- note_id_func = function(title)
  --   return title and title:gsub(" ", "-"):lower() or tostring(os.time())
  -- end,

  -- ── Note path ─────────────────────────────────────────────────────────────
  -- New notes land in notes_subdir rather than vault root, keeping root clean.
  new_notes_location = "notes_subdir",
  notes_subdir       = "notes",

  -- How ObsidianQuickSwitch opens notes. "current" | "vsplit" | "hsplit" | "tab"
  open_notes_in = "current",

  -- Always generate [[wikilinks]], never [text](path.md) markdown links.
  preferred_link_style = "wiki",

  -- ── Daily notes ───────────────────────────────────────────────────────────
  daily_notes = {
    -- Folder for daily notes (relative to vault root).
    folder = "daily",
    -- Date format used in the filename.
    date_format = "%Y-%m-%d",
    -- Template to use when creating a daily note (nil = no template).
    -- template = "daily.md",
  },

  -- ── Templates ─────────────────────────────────────────────────────────────
  templates = {
    -- Folder containing templates (relative to vault root).
    folder = "templates",
    -- Tokens available in templates.
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },

  -- ── UI ────────────────────────────────────────────────────────────────────
  -- Disabled: render-markdown.nvim (lua/plugins/render-markdown.lua) handles
  -- all in-editor rendering. Enabling both causes conflicts.
  ui = { enable = false },

  -- ── Frontmatter ───────────────────────────────────────────────────────────
  -- Auto-stamp created date, aliases, and tags on every new note.
  note_frontmatter_func = function(note)
    local out = {
      id      = note.id,
      aliases = note.aliases,
      tags    = note.tags,
    }
    -- Preserve any extra metadata already on the note.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    -- Stamp created date once; never overwrite it on subsequent saves.
    if out.created == nil then
      out.created = os.date("%Y-%m-%d")
    end
    return out
  end,

  -- ── Follow URL ────────────────────────────────────────────────────────────
  -- Open URLs with the macOS default browser via `open`.
  follow_url_func = function(url)
    vim.fn.jobstart({ "open", url }, { detach = true })
  end,

  -- ── Attachments ───────────────────────────────────────────────────────────
  attachments = {
    -- Folder for pasted images / attachments (relative to vault root).
    img_folder = "assets/imgs",
  },

  -- ── Keymaps ───────────────────────────────────────────────────────────────
  -- All keymaps only activate in Obsidian-managed markdown buffers.
  mappings = {
    -- Follow link under cursor (or create note if it doesn't exist).
    ["<CR>"]  = {
      action = function() return require("obsidian").util.gf_passthrough() end,
      opts   = { buffer = true, expr = true, desc = "Follow / create link" },
    },
    -- Toggle checkbox state (cycles through checkboxes defined in ui above).
    ["<leader>oc"] = {
      action = function() return require("obsidian").util.toggle_checkbox() end,
      opts   = { buffer = true, desc = "Toggle checkbox" },
    },
    -- Smart action: in normal mode follows link; in visual creates a link.
    ["<leader>oa"] = {
      action = function() return require("obsidian").util.smart_action() end,
      opts   = { buffer = true, expr = true, desc = "Smart action (follow / link)" },
    },
  },
})

-- ── Global keymaps ────────────────────────────────────────────────────────────
-- These work from any buffer, not just Obsidian markdown files.
local map = vim.keymap.set

map("n", "<leader>on", "<cmd>ObsidianNew<CR>",           { desc = "New note" })
map("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>",   { desc = "Find note" })
map("n", "<leader>og", "<cmd>ObsidianSearch<CR>",        { desc = "Grep vault" })
map("n", "<leader>od", "<cmd>ObsidianToday<CR>",         { desc = "Daily note (today)" })
map("n", "<leader>oD", "<cmd>ObsidianYesterday<CR>",     { desc = "Daily note (yesterday)" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>",     { desc = "Backlinks" })
map("n", "<leader>ot", "<cmd>ObsidianTags<CR>",          { desc = "Tags" })
map("n", "<leader>ol", "<cmd>ObsidianLinks<CR>",         { desc = "Links in buffer" })
map("n", "<leader>oL", "<cmd>ObsidianLinkNew<CR>",       { desc = "Link selection to new note" })
map("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>",      { desc = "Paste image" })
map("n", "<leader>or", "<cmd>ObsidianRename<CR>",        { desc = "Rename note" })
map("n", "<leader>oo", "<cmd>ObsidianOpen<CR>",          { desc = "Open in Obsidian app" })
map("n", "<leader>oT", "<cmd>ObsidianTemplate<CR>",      { desc = "Insert template" })
map("n", "<leader>ow", "<cmd>ObsidianWorkspace<CR>",     { desc = "Switch workspace" })
