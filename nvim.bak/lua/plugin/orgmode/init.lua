-- init.lua

-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
-- require('nvim-treesitter.configs').setup {
--   -- If TS highlights are not enabled at all, or disabled via `disable` prop,
--   -- highlighting will fallback to default Vim syntax highlighting
--   highlight = {
--     enable = true,
--     -- Required for spellcheck, some LaTex highlights and
--     -- code block highlights that do not have ts grammar
--     additional_vim_regex_highlighting = { 'org' },
--   },
--   ensure_installed = { 'org' }, -- Or run :TSUpdate org
-- }

require('orgmode').setup({
  -- key mappings
  -- mappings = {
  --   disable_all = false,
  --   prefix = '<Leader>o',
  --   global = {
  --     org_agenda = '<prefix>a',
  --     org_capture = '<prefix>c',
  --   },

    --
    org_agenda_files = { '~/notes/org/*' },
    org_default_notes_file = '~/notes/org/refile.org',
    org_todo_keywords = { 'TODO(t!)', 'NEXT(n!)', 'WAITING(w@/!)', '|', 'DONE(d!)', 'DELEGATED(g!)', 'CANCELED(c@)' },
    org_todo_keyword_faces = {
      WAITING = ':foreground blue :weight bold',
      DELEGATED = ':background #FFFFFF :slant italic :underline on',
      TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
    },
    -- org_deadline_warning_days = 14,
    -- org_agenda_min_height = 16,
    -- org_agenda_span = 'week', -- day/week/month/year/number of days
    -- org_agenda_start_on_weekday = 1,
    -- org_agenda_start_day = nil, -- start from today + this modifier
    -- calendar_week_start_day = 1,
    -- org_agenda_skip_scheduled_if_done = false,
    -- org_agenda_skip_deadline_if_done = false,
    -- org_agenda_text_search_extra_files = {},
    -- org_priority_highest = 'A',
    -- org_priority_default = 'B',
    -- org_priority_lowest = 'C',
    -- org_archive_location = '%s_archive::',
    -- org_tags_column = -80,
    -- org_use_tag_inheritance = true,
    -- org_tags_exclude_from_inheritance = {},
    -- org_hide_leading_stars = false,
    -- org_hide_emphasis_markers = false,
    -- org_ellipsis = '...',
    -- org_log_done = 'time',
    -- org_log_into_drawer = nil,
    -- org_highlight_latex_and_related = nil,
    -- org_indent_mode = 'indent',
    -- org_time_stamp_rounding_minutes = 5,

    org_custom_exports = {
      j = {
        description = 'Journal',
        template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
        target = '~/notes/org/journal.org'
      }
    },
    -- org_blank_before_new_entry = {
    --   heading = true,
    --   plain_list_item = false,
    -- },
    -- org_src_window_setup = 'top 16new',
    -- org_edit_src_content_indentation = 0,
    -- win_split_mode = 'horizontal',
    -- win_border = 'single',
    -- notifications = {
    --   enabled = false,
    --   cron_enabled = true,
    --   repeater_reminder_time = false,
    --   deadline_warning_reminder_time = 0,
    --   reminder_time = 10,
    --   deadline_reminder = true,
    --   scheduled_reminder = true,
    -- },

    -- Capture templates
    org_capture_templates = {
      -- New TODO
      t = {
        description = 'TODO',
        template = '* TODO %?\n:PROPERTIES: \n:LOGGING: TODO(!) NEXT(!) WAITING(@/!) DONE(!) DELEGATED(@) CANCELED(@) \n:CREATED: %U \n:END:',
        target = '~/notes/org/todo.org'
      },
      -- New Meeting
      m = {
        description = 'Meeting',
        template = '\n*** %U \n:PROPERTIES:\n:ID: \n:END: \n  Attendees-\n   -%? \n notes:  ',
        target = '~/notes/org/meeting.org'
      },
      -- 
      n = {
        description = 'Note',
        template = '\n** %U \n:PROPERTIES:\n:ID:\n:END:\n %?',
        target = '~/notes/org/note.org'
      }
    },

    -- -- Agenda settings
    -- agenda = {
    --   org_agenda_later = 'f',
    --   org_agenda_earlier = 'b',
    --   org_agenda_goto_today = '.',
    --   org_agenda_day_view = 'vd',
    --   org_agenda_week_view = 'vw',
    --   org_agenda_month_view = 'vm',
    --   org_agenda_year_view = 'vy',
    --   org_agenda_quit = 'q',
    --   org_agenda_switch_to = '<CR>',
    --   org_agenda_goto = '<TAB>',
    --   org_agenda_goto_date = 'J',
    --   org_agenda_redo = 'r',
    --   org_agenda_todo = 't',
    --   org_agenda_clock_goto = '<prefix>xj',
    --   org_agenda_set_effort = '<prefix>xe',
    --   org_agenda_clock_in = 'I',
    --   org_agenda_clock_out = 'O',
    --   org_agenda_clock_cancel = 'X'   --
    -- capture = {
    --   org_capture_finalize = '<C-c>',
    --   org_capture_refile = '<prefix>r',
    --   org_capture_kill = '<prefix>k',
      -- org_capture_show_help = 'g?',
    -- },

    -- note = {
    --   org_note_finalize = '<C-c>',
    --   org_note_kill = '<prefix>k',
    --   org_note_show_help = 'g?',
    -- },
    --
    -- edit_src = {
    --   org_edit_src_abort = '<prefix>k',
    --   org_edit_src_save = '<prefix>w',
    --   org_edit_src_show_help = 'g?',
    -- },

    -- text_objects = {
    --   inner_heading = 'ih',
    --   around_heading = 'ah',
    --   inner_subtree = 'ir',
    --   around_subtree = 'ar',
    --   inner_heading_from_root = 'Oh',
    --   around_heading_from_root = 'OH',
    --   inner_subtree_from_root = 'Or',
      -- around_subtree_from_root = 'OR',
    -- },
  -- }
})
