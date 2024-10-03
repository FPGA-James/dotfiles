local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    view = {
        centralize_selection = false,
        cursorline = true,
        debounce_delay = 15,
        width = 50,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
            -- user mappings go here
            },
        },
    },
    renderer = {
        root_folder_modifier = ":t",

        indent_markers = {
            enable = true,
            icons = {
                edge   = "│",
                item   = "├",
                corner = "└",
                none   = " ",
            },
        },

        icons = {

            show = {
                folder_arrow = true;
                git          = true,
            };

            glyphs = {
                default = "",
                symlink = "",

                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },

                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,

    }
}
