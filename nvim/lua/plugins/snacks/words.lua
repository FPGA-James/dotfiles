-- =============================================================================
-- lua/plugins/snacks/words.lua
-- Highlights all occurrences of the word under the cursor via LSP references.
-- Replaces vim-illuminate. Adds ]w / [w jump motions.
-- =============================================================================

vim.keymap.set("n", "]]", function() Snacks.words.jump(1,  true) end, { desc = "Next word reference" })
vim.keymap.set("n", "[[", function() Snacks.words.jump(-1, true) end, { desc = "Prev word reference" })

return {
  enabled      = true,
  debounce     = 200,    -- ms after cursor stops before highlighting
  notify_jump  = false,  -- notify when jumping between references
  notify_end   = true,   -- notify when wrapping around
  modes        = { "n", "i", "c" },
  filter = function(buf)
    return vim.g.snacks_words ~= false
      and vim.bo[buf].buftype == ""
  end,
}
