require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "right",
    initial_width = 50,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "datetime", "git", "todos", "buffers", "diagnostics", "symbols" },
    section_separator = { "", "-----", "" },
    datetime = {
        icon = "",
        format = "%a %b %d, %H:%M",
        clocks = {
            { name = "local" }
        }
    },
    buffers = {
        icon = "",
        ignored_buffers = {},      -- ignore buffers by regex
        sorting = "id",            -- alternatively set it to "name" to sort by buffer name instead of buf id
        show_numbers = true,       -- whether to also show the buffer numbers
        ignore_not_loaded = false, -- whether to ignore not loaded buffers
        ignore_terminal = true,    -- whether to show terminal buffers in the list
    },
    ["git"] = {
        icon = "",
    },
    todos = {
        icon = "",
        ignored_paths = { '~' },  -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
        initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
    },
    ["diagnostics"] = {
        icon = "",
    },
    symbols = {
        icon = "ƒ",
    }
    --files = {
    --    icon = "",
    --    show_hidden = false,
    --    ignored_paths = { "%.git$" }
    --}
})
