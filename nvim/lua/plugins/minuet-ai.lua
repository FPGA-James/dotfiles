-- =============================================================================
-- lua/plugins/minuet-ai.lua
-- minuet-ai.nvim — AI code completion via local Ollama
--
-- Provider: openai_fim_compatible → Ollama FIM endpoint (local, no API key)
-- Model:    qwen2.5-coder:latest
--
-- Completions surface in two ways:
--   1. blink.cmp menu — appears alongside LSP/snippet items (Tab/CR to accept)
--   2. Virtual text   — inline ghost text (<A-y> accept, <A-e> dismiss)
--
-- Prerequisites:
--   ollama pull qwen2.5-coder
--   ollama serve   (or ensure the launchd/systemd service is running)
--
-- To install (run once in your shell):
--   git clone --depth 1 https://github.com/milanglacier/minuet-ai.nvim \
--     ~/.config/nvim/pack/local/opt/minuet-ai.nvim
-- =============================================================================

vim.cmd.packadd("minuet-ai.nvim")

require("minuet").setup({

  -- ── Provider ──────────────────────────────────────────────────────────────
  -- Ollama exposes an OpenAI-compatible FIM endpoint; there is no dedicated
  -- "ollama" provider — openai_fim_compatible is the correct choice for
  -- qwen2.5-coder FIM completions.
  provider = "openai_fim_compatible",

  -- ── Timing ────────────────────────────────────────────────────────────────
  -- Debounce completions so Ollama isn't hit on every keystroke.
  throttle        = 1500,  -- ms between requests
  request_timeout = 3,     -- seconds before giving up

  -- ── Provider options ──────────────────────────────────────────────────────
  provider_options = {
    openai_fim_compatible = {
      model     = "qwen2.5-coder:latest",
      stream    = true,
      end_point = "http://localhost:11434/v1/completions",
      name      = "Ollama",
      api_key   = "TERM",  -- Ollama ignores auth; any non-empty value is fine
      optional  = {
        max_tokens = 256,  -- max tokens per completion
      },
    },
  },

  -- ── Virtual text ──────────────────────────────────────────────────────────
  -- Ghost text rendered inline after the cursor.
  -- Accepted with <A-y>; dismissed with <A-e>.
  virtualtext = {
    -- Enable for all filetypes. Replace { "*" } with specific ft list to restrict.
    auto_trigger_ft = { "*" },
    keymap = {
      accept      = "<A-y>",  -- accept full suggestion
      accept_line = "<A-l>",  -- accept one line at a time
      dismiss     = "<A-e>",  -- dismiss suggestion
      prev        = "<A-[>",  -- cycle to previous suggestion
      next        = "<A-]>",  -- cycle to next suggestion
    },
  },
})
