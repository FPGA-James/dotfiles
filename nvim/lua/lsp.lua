-- =============================================================================
-- lua/lsp.lua
-- Enables all language servers and wires up on-attach keymaps.
-- Each server is configured in its own lsp/<name>.lua file which Neovim
-- discovers automatically from the runtimepath (no nvim-lspconfig needed).
-- Requires Neovim 0.12+
-- =============================================================================

-- ── Enable servers ────────────────────────────────────────────────────────────
vim.lsp.enable({
  "pyright",             -- Python
  "verible_verilog_ls",  -- SystemVerilog (Verible — formatting, lint, navigation)
  "svlangserver",        -- SystemVerilog (svlangserver — Verilator-backed lint)
  "vhdl_ls",             -- VHDL
  "taplo",               -- TOML
  "yamlls",              -- YAML
  "marksman",            -- Markdown (wikilink go-to-definition, completions)
  "sigasi",              -- VHDL / SystemVerilog (commercial, requires license)
})

-- ── Capabilities ──────────────────────────────────────────────────────────────
vim.lsp.config("*", {
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits" },
            },
          },
        },
      },
    }
  ),
})

-- ── Diagnostics display ───────────────────────────────────────────────────────
vim.diagnostic.config({
  virtual_text     = true,
  signs            = true,
  underline        = true,
  update_in_insert = false,
  severity_sort    = true,
  float = {
    border = "rounded",
    source = true,
  },
})

-- ── On-attach keymaps ─────────────────────────────────────────────────────────
-- Neovim 0.11+ defaults already provide:
--   K       → hover          grn → rename       gra → code_action
--   grr     → references     gri → implementation
--   gO      → document_symbol   CTRL-S (i) → signature_help
--
-- We add the remaining mappings here.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspKeys", { clear = true }),
  callback = function(ev)
    local buf  = ev.buf
    local opts = { buffer = buf, silent = true }

    -- Navigation
    vim.keymap.set("n", "gd",  vim.lsp.buf.definition,      vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "gD",  vim.lsp.buf.declaration,     vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
    vim.keymap.set("n", "gt",  vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))

    -- Workspace
    vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder,    vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
    vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
    vim.keymap.set("n", "<leader>lwl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))

    -- Formatting
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "Format buffer / range" }))

    -- Diagnostics
    vim.keymap.set("n", "[d",         function() vim.diagnostic.jump({ count = -1, float = true }) end, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
    vim.keymap.set("n", "]d",         function() vim.diagnostic.jump({ count =  1, float = true }) end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostic float" }))
    vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, vim.tbl_extend("force", opts, { desc = "Diagnostics to loclist" }))

    -- Inlay hints (Neovim 0.10+)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
      vim.keymap.set("n", "<leader>lh", function()
        local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = buf })
        vim.lsp.inlay_hint.enable(not enabled, { bufnr = buf })
      end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))
    end

    -- Completion is handled by blink.cmp (lua/plugins/blink-cmp.lua).
    -- Do NOT call vim.lsp.completion.enable() here — they conflict.

    -- If Sigasi is running, stop vhdl_ls on the same buffer to avoid
    -- duplicate hover/completion (keep verible for formatting).
    if client and client.name == "sigasi" then
      for _, c in ipairs(vim.lsp.get_clients({ bufnr = buf })) do
        if c.name == "vhdl_ls" then
          c:stop()
        end
      end
    end
  end,
})
