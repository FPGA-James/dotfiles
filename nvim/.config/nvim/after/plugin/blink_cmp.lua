local ok, blink = pcall(require, 'blink.cmp')
if not ok then return end

blink.setup({
  keymap = { preset = "default" },  -- default key mappings, uses <C-y> to accept
  sources = {
    default = { "lsp", "buffer", "path", "snippets" },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 200 },
    ghost_text = { enabled = true },
  },
})
