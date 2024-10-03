return {
-- *telesope.defaults.sorting_strategy*
sorting_strategy = "descending",
--  Determines the direction "better" results are sorted towards.
--  Available options are:
--    - "descending" (default)
--    - "ascending"

-- *telesope.defaults.selection_strategy*
selection_strategy = "reset",
--  Determines how the cursor acts after each sort iteration.
--  Available options are:
--    - "reset" (default)
--    - "follow"
--    - "row"
--    - "closest"
--    - "none"

-- *telesope.defaults.scroll_strategy*
scroll_strategy = cycle,
        --Determines what happens if you try to scroll past the view of the
        --picker.
        --Available options are:
        -- - "cycle" (default)
        -- - "limit"

-- *telesope.defaults.layout_strategy*
    layout_strategy = 'bottom_pane',
    --    Determines the default layout of Telescope pickers.
    --    See |telescope.layout| for details of the available strategies.
    --    Default: 'horizontal'

  -- *telesope.defaults.create_layout*
  --create_layout = 
  --      Configure the layout of Telescope pickers.
  --      See |telescope.pickers.layout| for details.
  --        Default: 'nil'

  -- *telesope.defaults.layout_config*
  layout_config =  
    {
        bottom_pane = { height = 25 , preview_cutoff = 120, prompt_position = "top"                 },
        center      = { height = 0.4, preview_cutoff = 40 , prompt_position = "top"   , width = 0.5 },
        cursor      = { height = 0.9, preview_cutoff = 40 ,                             width = 0.8 },
        horizontal  = { height = 0.9, preview_cutoff = 120, prompt_position = "bottom", width = 0.8 },
        vertical    = { height = 0.9, preview_cutoff = 40 , prompt_position = "bottom", width = 0.8 },
    },
  --      Determines the default configuration values for layout strategies.
  --      See |telescope.layout| for details of the configurations options for
  --      each strategy.
  --      Allows setting defaults for all strategies as top level options and
  --      for overriding for specific options.
  --      For example, the default values below set the default width to 80% of
  --      the screen width for all strategies except 'center', which has width
  --      of 50% of the screen width.
    -- {
    --   bottom_pane = { height = 25 , preview_cutoff = 120, prompt_position = "top"                 },
    --   center      = { height = 0.4, preview_cutoff = 40 , prompt_position = "top"   , width = 0.5 },
    --   cursor      = { height = 0.9, preview_cutoff = 40 ,                             width = 0.8 },
    --   horizontal  = { height = 0.9, preview_cutoff = 120, prompt_position = "bottom", width = 0.8 },
    --   vertical    = { height = 0.9, preview_cutoff = 40 , prompt_position = "bottom", width = 0.8 },
    -- },

    -- *telesope.defaults.cycle_layout_list*
    -- cycle_layout_list = { "horizontal", "vertical" },
    --    Determines the layouts to cycle through when using `actions.layout.cycle_layout_next`
    --    and `actions.layout.cycle_layout_prev`.
    --    Should be a list of "layout setups".
    --    Each "layout setup" can take one of two forms:
    --    1. string
    --        This is interpreted as the name of a `layout_strategy`
    --    2. table
    --        A table with possible keys `layout_strategy`, `layout_config` and `previewer`
    --    Default: { "horizontal", "vertical" }

  -- *telesope.defaults.winblend*
    -- winblend = function() return vim.o.winblend end,
    --    Configure winblend for telescope floating windows. See |winblend| for
    --    more information. Type can be a number or a function returning a
    --    number
    --    Default: function() return vim.o.winblend end

  -- *telesope.defaults.wrap_results*
    -- wrap_results = false,
    -- Word wrap the search results
    --   Default: false

  -- *telesope.defaults.prompt_prefix*
--   prompt_prefix = '>  ',
  --  The character(s) that will be shown in front of Telescope's prompt.
  --  Default: '> '

  -- *telesope.defaults.selection_caret*
--   selection_caret = '>',
  --  The character(s) that will be shown in front of the current selection.
  --  Default: '> '

  -- *telesope.defaults.entry_prefix*
--   entry_prefix = '  ',
  --  Prefix in front of each result entry. Current selection not included.
  --  Default: '  '

    -- *telesope.defaults.multi_icon*
    -- multi_icon = '+',
    --  Symbol to add in front of a multi-selected result entry.
    --  Replaces final character of |telescope.defaults.selection_caret| and
    --  |telescope.defaults.entry_prefix| as appropriate.
    --  To have no icon, set to the empty string.
    --     Default: '+'

    -- *telesope.defaults.initial_mode*
    -- initial_mode = "insert",
    --    Determines in which mode telescope starts. Valid Keys:
    --    `insert` and `normal`.
    --    Default: "insert"

    -- *telesope.defaults.border*
    -- border = true,
    --  Boolean defining if borders are added to Telescope windows.
    --  Default: true

    -- *telesope.defaults.path_display*
    -- path_display = "smart",
        -- Determines how file paths are displayed.
        -- path_display can be set to an array with a combination of:
        -- - "hidden"          hide file names
        -- - "tail"            only display the file name, and not the path
        -- - "absolute"        display absolute paths
        -- - "smart"           remove as much from the path as possible to only show
        --                     the difference between the displayed paths.
        --                     Warning: The nature of the algorithm might have a negative
        --                     performance impact!
        -- - "shorten"         only display the first character of each directory in
        --                     the path
        -- - "truncate"        truncates the start of the path when the whole path will
        --                     not fit. To increase the gap between the path and the edge,
        --                     set truncate to number `truncate = 3`
        -- - "filename_first"  shows filenames first and then the directories

        -- You can also specify the number of characters of each directory name
        -- to keep by setting `path_display.shorten = num`.
        --   e.g. for a path like
        --     `alpha/beta/gamma/delta.txt`
        --   setting `path_display.shorten = 1` will give a path like:
        --     `a/b/g/delta.txt`
        --   Similarly, `path_display.shorten = 2` will give a path like:
        --     `al/be/ga/delta.txt`

        -- You can also further customise the shortening behaviour by
        -- setting `path_display.shorten = { len = num, exclude = list }`,
        -- where `len` acts as above, and `exclude` is a list of positions
        -- that are not shortened. Negative numbers in the list are considered
        -- relative to the end of the path.
        --   e.g. for a path like
        --     `alpha/beta/gamma/delta.txt`
        --   setting `path_display.shorten = { len = 1, exclude = {1, -1} }`
        --   will give a path like:
        --     `alpha/b/g/delta.txt`
        --   setting `path_display.shorten = { len = 2, exclude = {2, -2} }`
        --   will give a path like:
        --     `al/beta/gamma/de`

        -- path_display can also be set to 'filename_first' to put the filename
        -- in front.

        --   path_display = {
        --     "filename_first"
        --   },

        -- The directory structure can be reversed as follows:

        --   path_display = {
        --     filename_first = {
        --         reverse_directories = true
        --     }
        --   },

        -- path_display can also be set to 'hidden' string to hide file names

        -- path_display can also be set to a function for custom formatting of
        -- the path display with the following signature

        -- Signature: fun(opts: table, path: string): string, table?

        -- The optional table is an list of positions and highlight groups to
        -- set the highlighting of the return path string.

        -- Example:

        --     -- Format path as "file.txt (path\to\file\)"
        --     path_display = function(opts, path)
        --       local tail = require("telescope.utils").path_tail(path)
        --       return string.format("%s (%s)", tail, path)
        --     end,

        --     -- Format path and add custom highlighting
        --     path_display = function(opts, path)
        --       local tail = require("telescope.utils").path_tail(path)
        --       path = string.format("%s (%s)", tail, path)

        --       local highlights = {
        --         {
        --           {
        --             0, -- highlight start position
        --             #path, -- highlight end position
        --           },
        --           "Comment", -- highlight group name
        --         },
        --       }

        --       return path, highlights
        --     end

        -- Default: {}

    -- *telesope.defaults.borderchars*
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    --  Set the borderchars of telescope floating windows. It has to be a
    --  table of 8 string values.
    --  Default: { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    -- *telesope.defaults.get_status_text*
    --get_status_text = 
    --  A function that determines what the virtual text looks like.
    --  Signature: function(picker) -> str
    --  Default: function that shows current count / all

    -- *telesope.defaults.hl_result_eol*
    -- hl_result_eol = true,
    --  Changes if the highlight for the selected item in the results
    --  window is always the full width of the window
    --  Default: true

    -- *telesope.defaults.dynamic_preview_title*
    -- dynamic_preview_title = false,
    --  Will change the title of the preview window dynamically, where it
    --  is supported. For example, the preview window's title could show up as the full filename.
    --  Default: false

    -- *telesope.defaults.results_title*
    -- results_title = "Results", 
    --  Defines the default title of the results window. A false value
    --  can be used to hide the title altogether.
    --  Default: "Results"

    -- *telesope.defaults.prompt_title*
    -- prompt_title = "Prompt",
    --  Defines the default title of the prompt window. A false value
    --  can be used to hide the title altogether. Most of the times builtins
    --  define a prompt_title which will be preferred over this default.
    --  Default: "Prompt"

    -- *telesope.defaults.mappings*
    --mappings = 
    --  Your mappings to override telescope's default mappings.
        --See = 
        -- |telescope.mappings|
    
    -- *telesope.defaults.default_mappings*
    --default_mappings = 
    --  Not recommended to use except for advanced users.
    --  Will allow you to completely remove all of telescope's default maps and use your own.
    --  Default: nil
    
    -- *telesope.defaults.history*
    -- history ={
    --     --path        = ,
    --     limit       = 100,
    --     --handler     =   ,
    --     cycle_wrap  =   false,
    -- }, 
    --  This field handles the configuration for prompt history.
    --  By default it is a table, with default values (more below).
    --  To disable history, set it to false.
    --  Currently mappings still need to be added, Example:
    --      mappings = {
    --     i = {
    --       ["<C-Down>"] = require('telescope.actions').cycle_history_next,
    --       ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
    --     },
    --   },
    -- Fields:
    --   - path:       The path to the telescope history as string.
    --                 Default: stdpath("data")/telescope_history
    --   - limit:      The amount of entries that will be written in the
    --                 history.
    --                 Warning: If limit is set to nil it will grow unbound.
    --                 Default: 100
    --   - handler:    A lua function that implements the history.
    --                 This is meant as a developer setting for extensions to
    --                 override the history handling, e.g.,
    --                 https://github.com/nvim-telescope/telescope-smart-history.nvim,
    --                 which allows context sensitive (cwd + picker) history.
    --                 Default:
    --                 require('telescope.actions.history').get_simple_history
    --   - cycle_wrap: Indicates whether the cycle_history_next and
    --                 cycle_history_prev functions should wrap around to the
    --                 beginning or end of the history entries on reaching
    --                 their respective ends
    --                 Default: false
    
    -- *telesope.defaults.cache_picker*
    -- cache_picker = {
    --     num_pickers     = -1,
    --     limit_entries       = 1000,
    --     ignore_empty_prompt = false,
    -- },
    --  This field handles the configuration for picker caching.
    --  By default it is a table, with default values (more below).
    --  To disable caching, set it to false.
    --  Caching preserves all previous multi selections and results andtherefore may result in slowdown or increased RAM occupation
    --  if too many pickers (`cache_picker.num_pickers`) or entries ('cache_picker.limit_entries`) are cached.
    --  Fields:
    --  - num_pickers:          The number of pickers to be cached.
    --                          Set to -1 to preserve all pickers of your
    --                                  session. If passed to a picker, the cached
    --                                  pickers with indices larger than
    --                                  `cache_picker.num_pickers` will be cleared.
    --                                  Default: 1
    --          - limit_entries:        The amount of entries that will be saved for
    --                                  each picker.
    --                                  Default: 1000
    --          - ignore_empty_prompt:  If true, the picker will not be cached if
    --                                  the prompt is empty (i.e., no text has been
    --                                  typed at the time of closing the prompt).
    --                                  Default: false
    
    
    -- *telesope.defaults.preview*
    -- preview = {
    --     check_mime_type = true,
    --     filesize_limit  = "25", 
    --     highlight_limit = "1", 
    --     timeout         = "250",  
    --     hook            = nil,          
    --     treesitter      = true,  
    --     msg_bg_fillchar = "/",
    --     hide_on_startup = false, 
    --     ls_short        = false,         
    -- },

-- This field handles the global configuration for previewers. By default it is a table, with default values (more below).
-- To disable previewing, set it to false. If you have disabled previewers globally, but want to opt in to previewing for single pickers, you will have to
--  pass `preview = true` or `preview = {...}` (your config) to the `opts` of your picker.
--  Fields:
--  - check_mime_type:  Use `file` if available to try to infer whether the file to preview is a binary if filetype detection fails.
--                      Windows users get `file` from: https://github.com/julian-r/file-windows, Set to false to attempt to preview any mime type.
                        --Default: true for all OS excl. Windows
--  - filesize_limit:   The maximum file size in MB attempted to be previewed. Set to false to attempt to preview any file size.
--                      Default: 25
--  - highlight_limit:  The maximum file size in MB attempted to be highlighted. Set to false to attempt to highlight any file size.
--                      Default: 1
--  - timeout:          Timeout the previewer if the preview did not complete within `timeout` milliseconds. Set to false to not timeout preview.
--                      Default: 250
-- - hook(s):          Function(s) that takes `(filepath, bufnr, opts)`, where opts exposes winid and ft (filetype).
                    --    Available hooks (in order of priority): {filetype, mime, filesize, timeout}_hook
                    --    Important: the filetype_hook must return true or false to indicate whether to continue (true) previewing or not (false),
                    --    respectively.  Two examples:
                                --   local putils = require("telescope.previewers.utils")
                                --   ... -- preview is called in telescope.setup { ... }
                                    -- preview = {
                                    --   -- 1) Do not show previewer for certain files
                                    --   filetype_hook = function(filepath, bufnr, opts)
                                        -- -- you could analogously check opts.ft for filetypes
                                        -- local excluded = vim.tbl_filter(function(ending)
                                        --   return filepath:match(ending)
                                        -- end, {
                                        --   ".*%.csv",
                                        --   ".*%.toml",
                                        -- })
                                        -- if not vim.tbl_isempty(excluded) then
                                        --   putils.set_preview_message(
                                            -- bufnr,
                                            -- opts.winid,
                                            -- string.format("I don't like %s files!",
                                            -- excluded[1]:sub(5, -1))
                                        --   )
                                        --   return false
                                        -- end
                                        -- return true
                                    --   end,
                                    --   -- 2) Truncate lines to preview window for too large files
                                    --   filesize_hook = function(filepath, bufnr, opts)
                                        -- local path = require("plenary.path"):new(filepath)
                                        -- -- opts exposes winid
                                        -- local height = vim.api.nvim_win_get_height(opts.winid)
                                        -- local lines = vim.split(path:head(height), "[\r]?\n")
                                        -- vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
                                    --   end,
                                    -- }
                                --   The configuration recipes for relevant examples.
                                --   Note: we use vim.filetype filetype detection,
                                        -- so if you have troubles with files not
                                        -- highlighting correctly, please read
                                        -- |vim.filetype|
                                --   Default: nil
            --   - treesitter:       Determines whether the previewer performs treesitter
                                --   highlighting, which falls back to regex-based highlighting.
                                --   `true`: treesitter highlighting for all available filetypes
                                --   `false`: regex-based highlighting for all filetypes
                                --   `table`: may contain the following keys:
                                    --   - enable boolean|table: if boolean, enable ts
                                                            --   highlighting for all supported
                                                            --   filetypes.
                                                            --   if table, ts highlighting is only
                                                                -- enabled for given filetypes.
                                    --   - disable table: list of filetypes for which ts highlighting
                                                    --    is not used if `enable = true`.
                                --   Default: true
            --   - msg_bg_fillchar:  Character to fill background of unpreviewable buffers with
                                --   Default: "╱"
            --   - hide_on_startup:  Hide previewer when picker starts. Previewer can be toggled
                                --   with actions.layout.toggle_preview.
                                --   Default: false
            --   - ls_short:         Determines whether to use the `--short` flag for the `ls`
                                --   command when previewing directories. Otherwise will result
                                --   to using `--long`.
                                --   Default: false
    
    
-- *telesope.defaults.vimgrep_arguments*
    -- vimgrep_arguments = {
    --     "rg",
    --     "--color=never",
    --     "--no-heading",
    --     "--with-filename",
    --     "--line-number",
    --     "--column",
    --     "--smart-case"
    -- },
    -- Defines the command that will be used for `live_grep` and `grep_string`
    -- pickers.
    -- Hint: Make sure that color is currently set to `never` because we do
    -- not yet interpret color codes
    -- Hint 2: Make sure that these options are in your changes arguments:
    --   "--no-heading", "--with-filename", "--line-number", "--column"
    -- because we need them so the ripgrep output is in the correct format.
    -- Default: {
    --   "rg",
    --   "--color=never",
    --   "--no-heading",
    --   "--with-filename",
    --   "--line-number",
    --   "--column",
    --   "--smart-case"
    -- }
    
-- *telesope.defaults.use_less*
    --use_less = true,
    --    Boolean if less should be enabled in term_previewer (deprecated and
    --    currently no longer used in the builtin pickers).
    --    Default: true
    
-- *telesope.defaults.set_env*
    --set_env = nil,
    --    Set an environment for term_previewer. A table of key values:
    --    Example: { COLORTERM = "truecolor", ... }
    --    Hint: Empty table is not allowed.
    --    Default: nil
    
-- *telesope.defaults.color_devicons*
    --color_devicons =  true,
    --        Boolean if devicons should be enabled or not. If set to false, the
    --        text highlight group is used.
    --        Hint: Coloring only works if |termguicolors| is enabled.
    --        Default: true
    
-- *telesope.defaults.file_sorter*
   -- file_sorter = require("telescope.sorters").get_fzy_sorter,
    --    A function pointer that specifies the file_sorter. This sorter will
    --    be used for find_files, git_files and similar.
    --    Hint: If you load a native sorter, you don't need to change this value,
    --    the native sorter will override it anyway.
    --    Default: require("telescope.sorters").get_fzy_sorter
    
-- *telesope.defaults.generic_sorter*
    --generic_sorter = require("telescope.sorters").get_fzy_sorter,
    --    A function pointer to the generic sorter. The sorter that should be
    --    used for everything that is not a file.
    --    Hint: If you load a native sorter, you don't need to change this value,
    --    the native sorter will override it anyway.
    --    Default: require("telescope.sorters").get_fzy_sorter
    
-- *telesope.defaults.prefilter_sorter*
   -- prefilter_sorter = require("telescope.sorters").prefilter,
    -- This points to a wrapper sorter around the generic_sorter that is able
    -- to do prefiltering.
    -- It's usually used for lsp_*_symbols and lsp_*_diagnostics
    -- Default: require("telescope.sorters").prefilter
    
-- *telesope.defaults.tiebreak
--    tiebreak = 
--            A function that determines how to break a tie when two entries have
--            the same score.
--            Having a function that always returns false would keep the entries in
--            the order they are found, so existing_entry before current_entry.
--            Vice versa always returning true would place the current_entry
--            before the existing_entry.
--    
--            Signature: function(current_entry, existing_entry, prompt) -> boolean
--    
--            Default: function that breaks the tie based on the length of the
--                     entry's ordinal
    
-- *telesope.defaults.file_ignore_patterns*
    --file_ignore_patterns = nil,
       -- A table of lua regex that define the files that should be ignored.
       -- Example: { "^scratch/" } -- ignore all files in scratch directory
       -- Example: { "%.npz" } -- ignore all npz files
       -- See: https://www.lua.org/manual/5.1/manual.html#5.4.1 for more
       -- information about lua regex
       -- Note: `file_ignore_patterns` will be used in all pickers that have a
       -- file associated. This might lead to the problem that lsp_ pickers
       -- aren't displaying results because they might be ignored by
       -- `file_ignore_patterns`. For example, setting up node_modules as ignored
       -- will never show node_modules in any results, even if you are
       -- interested in lsp_ results.
       -- If you only want `file_ignore_patterns` for `find_files` and
       -- `grep_string`/`live_grep` it is suggested that you setup `gitignore`
       -- and have fd and or ripgrep installed because both tools will not show
       -- `gitignore`d files on default.
       -- Default: nil
    
-- *telesope.defaults.get_selection_window*
    -- get_selection_window = 
    --           Function that takes function(picker, entry) and returns a window id.
    --           The window ID will be used to decide what window the chosen file will
    --           be opened in and the cursor placed in upon leaving the picker.
    
    --           Default: `function() return 0 end`
    
    
-- *telesope.defaults.git_worktrees*
   -- git_worktrees = nil,
        -- A table of arrays of detached working trees with keys `gitdir` and `toplevel`.
        -- Used to pass `--git-dir` and `--work-tree` flags to git commands when telescope fails
        -- to infer the top-level directory of a given working tree based on cwd.
        -- Example:
        -- git_worktrees = {
        --   {
        --     toplevel = vim.env.HOME,
        --     gitdir = vim.env.HOME .. '/.cfg'
        --   }
        -- }
        -- Default: nil
    
-- *telesope.defaults.file_previewer*
   -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        -- Function pointer to the default file_previewer. It is mostly used
        -- for find_files, git_files and similar.
        -- You can change this function pointer to either use your own
        -- previewer or use the command-line program bat as the previewer:
        --   require("telescope.previewers").cat.new
        -- Default: require("telescope.previewers").vim_buffer_cat.new
    
-- *telesope.defaults.grep_previewer*
  -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            -- Function pointer to the default vim_grep previewer. It is mostly
            -- used for live_grep, grep_string and similar.
            -- You can change this function pointer to either use your own
            -- previewer or use the command-line program bat as the previewer:
            --   require("telescope.previewers").vimgrep.new
            -- Default: require("telescope.previewers").vim_buffer_vimgrep.new
    
-- *telesope.defaults.qflist_previewer*
   -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Function pointer to the default qflist previewer. It is mostly
    -- used for qflist, loclist and lsp.
    -- You can change this function pointer to either use your own
    -- previewer or use the command-line program bat as the previewer:
    --   require("telescope.previewers").qflist.new
    -- Default: require("telescope.previewers").vim_buffer_qflist.new
    
-- *telesope.defaults.buffer_previewer_maker*
   -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        -- Developer option that defines the underlining functionality
        -- of the buffer previewer.
        -- For interesting configuration examples take a look at
        -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
        -- Default: require("telescope.previewers").buffer_previewer_maker
        -- Parameters = 
        --     {opts} (table)  Configuration opts. Keys: defaults, pickers,
        --                     extensions
}