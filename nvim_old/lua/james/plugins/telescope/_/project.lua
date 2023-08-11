require('telescope').setup {
  extensions = {
    project = {
        base_dirs = {
            {path = '~/Workspace/FPGA'},
            {path = '~/Workspace/hw'},
            {path = '~/Workspace/python'},
            {path = '~/Workspace/rust'},
            --{path = '~/dev/src5', max_depth = 2},
        },
        hidden_files = true, -- default: false
        theme = "dropdown",
        order_by = "asc",
        search_by = "title",
        sync_with_nvim_tree = true, -- default false
    }
  }
}
