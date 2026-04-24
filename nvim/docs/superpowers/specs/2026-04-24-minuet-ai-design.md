# minuet-ai.nvim Integration Design

**Date:** 2026-04-24
**Status:** Approved

## Overview

Add [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim) to the Neovim config for AI-powered code completion using a local Ollama model. Completions surface in two ways: as items in the existing blink.cmp menu, and as inline virtual text ghost text.

## Architecture

### Provider

- **Backend:** Ollama (local, no API key)
- **Model:** `qwen2.5-coder:latest`
- **Throttle:** 1500 ms debounce, 3 s request timeout — prevents hammering Ollama on every keystroke

### Completion surfaces

| Surface | How it works | Accept key |
|---|---|---|
| blink.cmp menu | minuet registered as a blink source; suggestions appear alongside LSP/snippets | `<Tab>` / `<CR>` (unchanged) |
| Virtual text | Ghost text rendered inline after cursor | `<A-y>` (accept), `<A-e>` (dismiss) |

The blink source is given `score_offset = -3` so LSP completions rank above AI suggestions by default.

## Files changed

### New: `lua/plugins/minuet-ai.lua`

- `vim.cmd.packadd("minuet-ai.nvim")`
- `require("minuet").setup()` with Ollama provider, qwen2.5-coder model, virtual text enabled, `<A-y>`/`<A-e>` keymaps, throttle/timeout config

### Modified: `lua/plugins/blink-cmp.lua`

- Add `"minuet"` to `sources.default` list
- Add `"minuet"` to `sources.per_filetype.markdown` list
- Add `sources.providers.minuet` entry: `{ name = "minuet", score_offset = -3 }`

### Modified: `lua/plugins/which-key.lua`

Under the existing `<leader>a` (ai / claude) group:

- `<leader>am` — toggle minuet auto-suggestion on/off
- `<leader>aM` — trigger minuet completion manually

### Modified: `scripts/install.sh`

- Add `clone "minuet-ai.nvim" "https://github.com/milanglacier/minuet-ai.nvim"` to the plugins section

### Modified: `init.lua`

- Add `require("plugins.minuet-ai")` immediately after `require("plugins.blink-cmp")` (blink must initialise before the minuet source registers)

## Load order

```
blink-cmp.lua   → blink.cmp.setup() (sources list includes "minuet" provider entry)
minuet-ai.lua   → minuet.setup() (registers itself as the "minuet" blink source)
which-key.lua   → wk.add() (adds <leader>am / <leader>aM descriptions)
```

## Keymaps summary

| Key | Mode | Action |
|---|---|---|
| `<A-y>` | insert | Accept virtual text suggestion |
| `<A-e>` | insert | Dismiss virtual text suggestion |
| `<leader>am` | normal | Toggle auto-suggestion |
| `<leader>aM` | normal | Trigger completion manually |

## Prerequisites

Ollama must be running locally with qwen2.5-coder pulled:

```sh
ollama pull qwen2.5-coder
# then ensure ollama serve is running (or launchd/systemd service)
```
