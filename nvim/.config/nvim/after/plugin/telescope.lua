local ok, telescope = pcall(require, "telescope")
if not ok then return end

telescope.setup({
  defaults = { mappings = { i = { ["<C-j>"]="move_selection_next", ["<C-k>"]="move_selection_previous" } } },
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true },
    file_browser = {},
    undo = {},
  },
})

--telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("undo")
