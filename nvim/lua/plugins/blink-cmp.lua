-- =============================================================================
-- lua/plugins/blink-cmp.lua
-- blink.cmp — async completion engine backed by a Rust fuzzy-matcher
--
-- Replaces Neovim's native vim.lsp.completion (disabled in lua/lsp.lua).
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/saghen/blink.cmp \
--     ~/.config/nvim/pack/local/opt/blink.cmp
--
-- On first load blink downloads a pre-built binary from its GitHub release.
-- If download fails (air-gap / no curl): cd pack/local/opt/blink.cmp && cargo build --release
-- =============================================================================

vim.cmd.packadd("blink.cmp")

require("blink.cmp").setup({

  -- ── Keymap ────────────────────────────────────────────────────────────────
  -- "default": <C-n>/<C-p> navigate, <C-y> accept, <C-e> cancel
  -- "super-tab": <Tab>/<S-Tab> navigate, <CR> accept
  -- "enter": <CR> accept, <C-n>/<C-p> navigate
  keymap = { preset = "default" },

  -- ── Appearance ────────────────────────────────────────────────────────────
  appearance = {
    -- "mono" | "normal" — controls icon spacing for nerd fonts
    nerd_font_variant = "mono",
  },

  -- ── Sources ───────────────────────────────────────────────────────────────
  sources = {
    -- Ordered list of active sources for normal buffers.
    default = { "lsp", "path", "snippets", "buffer" },

    -- In markdown buffers also complete [[wikilinks]], #tags, and new note titles
    -- via the obsidian.nvim community fork's built-in blink sources.
    per_filetype = {
      markdown = { "obsidian", "obsidian_tags", "obsidian_new", "lsp", "path", "snippets", "buffer" },
    },
  },

  -- ── Snippets ──────────────────────────────────────────────────────────────
  -- Uses Neovim 0.10+'s built-in vim.snippet — no extra plugin needed.
  snippets = { preset = "default" },

  -- ── Completion UI ─────────────────────────────────────────────────────────
  completion = {
    -- Selection behaviour.
    list = {
      selection = {
        preselect  = true,   -- pre-highlight the first item
        auto_insert = false, -- don't insert text until explicitly accepted
      },
    },

    menu = {
      border = "rounded",

      draw = {
        -- Two-column layout: label on the left, kind on the right.
        columns = {
          { "label", "label_description", gap = 1 },
          { "kind_icon", "kind",          gap = 1 },
        },
      },
    },

    -- Documentation popup.
    documentation = {
      auto_show          = true,
      auto_show_delay_ms = 200,
      window = { border = "rounded" },
    },

    -- Show first completion as greyed-out virtual text.
    ghost_text = { enabled = false },
  },

  -- ── Fuzzy matching ────────────────────────────────────────────────────────
  fuzzy = {
    -- "prefer_rust"              — use Rust binary, fall back to Lua silently
    -- "prefer_rust_with_warning" — same but warn on fallback
    -- "lua"                      — always use pure-Lua (slower, no binary needed)
    implementation = "prefer_rust",

    prebuilt_binaries = {
      -- Download a pre-built binary automatically.
      download = true,
      -- Cloned from HEAD (no tag), so tell the downloader to match the latest
      -- release tag. Equivalent to: git describe --tags --match "v*"
      force_version = "v*",
    },
  },
})
